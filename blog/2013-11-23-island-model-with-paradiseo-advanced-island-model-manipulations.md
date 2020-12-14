---
Title: 'Island Model with ParadisEO: advanced island model manipulations'
Date: 2013-11-23 18:31
Category: Mathématiques
Tags: Mathématiques
Lang: en
---

[TOC]

# Introduction

This article presents how to manage advanced mecanisms supplied by the island model. In the first part we will present the custom topology and stochastic topology. In a second part, we will see a fine-grained management of the island policies. Last but not least, we will demonstrate how to make the island performs any function each generation (in order to change topology with some conditions on a specific island for instance).

# Custom and stochastic topology

There are two types of custom topologies: boolean and stochastic. Both are built from a file containing the matrix. The file is parsed and each line must have the same number of values, equals to the number of lines (square matrix). The ```CustomBooleanTopology```, contains integers (basically 0 and 1). Each zero value is considered to be false, and every other value is true. The ```CustomStochasticTopology``` contains double values between 0 and 1. The value at line $i$, column $j$ is the probability to have a communication from island $i$ to island $j$. Therefore, negative values are considered to be 0, and values above 1 are considered to be 1.

Example for boolean topology:
```
    0    1    0
    1    0    1
    0    1    0
```

```c++
    CustomBooleanTopology topo_bool("data_boolean");
    //getting the neighbors of island 1
    std::vector<unsigned> neighbors = topo_bool.getIdNeighbors(1); //return a vector containing 0 and 2
```

Example for stochastic topology:
```
    0    1    0
    1    0    .75
    0    1    0
```

```c++
    CustomBooleanTopology topo_stoch("data_stochastic");
    //getting the neighbors of island 1:
    std::vector<unsigned> neighbors = topo_bool.getIdNeighbors(1);
    //return a vector containing 0, and the probability 0.75 to contain the value 2.
```

# Advanced management of policy

In this part, we will present a list of common cases that use the combination of ```eoContinue``` to build fine-grained policy rules.
As explained in the previous article about components, a policy rule is compound of a temporal criteria - an ```eoContinue``` -, and a spatial criteria - an ```eoSelect``` -.

To perform an OR condition, it is possible to use an ```eoCheckPoint``` as criteria. For instance:
```c++
eoSelect<EOT> who;
eoPeriodicGenContinue<EOT> criteria_1(50);
eoFitContinue<EOT> criteria_2(5000);
eoCheckPoint<EOT> criterion(criteria_1);
criterion.add(criteria_2);

PolicyElement<EOT> rule_1(criterions, who);
```

A migration will be performed if the algorithm reaches one of the criterion: a generation number 0 mod 50 **or** a fitness of 5000 for an individual.

Obviously, you can have more than 2 criteria.

To perform an AND condition, one can use an ```eoCombinedContinue```. For instance:
```c++
eoSelect<EOT> who;
eoPeriodicGenContinue<EOT> criteria_1(50);
eoFitContinue<EOT> criteria_2(5000);
eoCombinedContinue<EOT> criterion(criteria_1);
criterion.add(criteria_2);

PolicyElement<EOT> rule_1(criterions, who);
```

A migration will be performed only if a generation is number 0 mod 50 **and** if there is an individual with a fitness at least of 5000.

This is particulary useful to create dynamic policy that selects between diversification or intensification. Here is an example of a policy that changes from diversification to intensification after 30 minutes.

First, we need to define the diversification step:
```c++
eoSelect<EOT> who; // Selection without condition on the fitness, for instance
eoPeriodicGenContinue<EOT> criteria_1(50);
eoSecondsElapsedContinue<EOT> criteria_2(60*30);
eoCombinedContinue<EOT> criterion(criteria_1);
criterion.add(criteria_2);

PolicyElement<EOT> diversification_step(criterions, who);
```

For the intensification step, we need to use a new ```eoContinue```:
```c++
eoInvertedContinue which is a functor that returns the oposite of an eoContinue.
eoSelect<EOT> who; // Elitist selection
eoPeriodicGenContinue<EOT> criteria_1(50);
eoInvertedContinue<EOT>criteria_2((eoSecondsElapsedContinue<EOT>(60*30));
eoCombinedContinue<EOT> criterion(criteria_1);
criterion.add(criteria_2);

PolicyElement<EOT> intensification_step(criterions, who);
```

# Creating events by callback method

When starting an island model it is possible to perform an action such as changing the topology at a precise moment.

In that purpose SMP proposes a callback mecanism using the class ```smp::Notifier``` which inherites from ```eoUpdater```.

The notifier has to be added to the ```eoContinue``` of an island and you should not forget that the binded action will be performed each generation. Hence, you have to provide mecanism to check if you really would like to perform an action.

Let is see this mecanism on an example. In our case, we would like to change the topology after 10 minutes of computation.

First, we need to write a function to change the topology after 10 minutes:
```c++
void changeTopo(IslandModel<Indi>* _model, AbstractTopology& _topo)
{
    static auto start = std::chrono::system_clock::now();
    auto now = std::chrono::system_clock::now();
    auto elapsed = now - start;
    static bool first = false; // We would like to change only one time !
    if(std::chrono::duration_cast<std::chrono::minutes>(elapsed).count() > 10 && !first)
    {
        _model->setTopology(_topo);
        first = true;
    }
}
```

Then, when creating the island, we need to bind our function with our model and the topology we would like to have after 10 minutes:

```c++
Topology<Ring> topo2; // New topology
std::function<void(void)> task = std::bind(changeTopo, &model, topo2); // We bind our function with our new topology
Notifier topoChanger(task); // We create the notifier
checkPoint.add(topoChanger); // We add the notifier, assuming that checkPoint is the eoCheckPoint used by an island as continuators
```

Finaly, we instanciate the island:

```c++
Island<eoEasyEA,Indi> test(pop, intPolicy, migPolicy, checkPoint, plainEval, select, transform, replace);
```

In this example, we bind a function but it is possible to bind a lambda or class method which will be performed by a specific instance, etc.

Another example of the use of the ```Notifier``` could be the modification of probabilities in stochastic topology in order to refine migration and integration policies during the computation.
