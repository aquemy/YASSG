---
Title: 'Island Model with ParadisEO: components and basics'
Date: 2013-11-23 18:13
Category: Mathématiques
Tags: Mathématiques
Lang: en
---

[TOC]

# Introduction

The purpose of this article is to present how to create an homogeneous island model, that is to say with the same Evolutionary Algorithm (EA) on each island, with the module SMP from the framework ParadisEO. To do so, we will present all its components: integration policy, immigration policy, islands, topology and the model by itself.

The need to speed up the runtime of EAs drove towards a new model of parallelism called island model where several EAs in the same time. It could be viewed like a multi start on an EA, however there is a fundamental change.

In a multi start model we merely run our EAs on different populations and then wait for the result, hoping that one of the EAs would get better results than another. No exchange of useful information is considered and the full context of execution is lost between two runs.

On the contrary, the island model takes benefit from the useful information discovered during the search process by an EA, by spreading this information in runtime to the other EAs according to a pre-defined topology and exchange policy.

## Explanations

A representation of an arbitrary topological model with migrations between the islands is shown below:
{% img center /images/im.png %}
Let us consider the following scenario emigrations/immigrations should occur every ten generations. In addition we would like to control the selection of the individuals to emigrate as well as the replacement process of the current individuals with the immigrant ones. In other words, constructing an insular migration model consists in:

1. Having a topological model including several evolutionary algorithms.
2. Defining the migration frequency as well as the size of the migration (i.e. the number of individuals that emigrate).
3. The selection and replacement strategies or the velocity strategy.

## Requirements

You are supposed to be able to build the algorithms that you want to run on multicores architecture using ParadisEO framework.

# Generic use

Before giving a practical example, let us see the generic way to create an homogeneous island model. For more details, refer to the source file ```/smp/tutorial/Lesson2/islandmodel.cpp```.

First of all, you need to create the elements shared by all islands.
```c++
#include <smp>

//Common part to all islands
IndiEvalFunc plainEval;
IndiInit chromInit;
eoDetTournamentSelect<Indi> selectOne(param.tSize);
eoSelectPerc<Indi> select(selectOne);// by default rate==1
IndiXover Xover;                     // CROSSOVER
IndiSwapMutation  mutationSwap;      // MUTATION
eoSGATransform<Indi> transform(Xover, param.pCross, mutationSwap, param.pMut);
eoPlusReplacement<Indi> replace;
```

Then, create a model according to a certain topology:
```c++
// MODEL
Topology<Complete> topo;
IslandModel<Indi> model(topo);
```

Define the islands. The creation process will be detailled in the above section:
```c++
// ISLAND 1
// // Algorithm part
eoGenContinue<Indi> genCont(param.maxGen+100);
eoPop<Indi> pop(param.popSize, chromInit);
// // Emigration policy
// // // Element 1
eoPeriodicContinue<Indi> criteria(5);
eoDetTournamentSelect<Indi> selectOne(20);
eoSelectNumber<Indi> who(selectOne, 3);

MigPolicy<Indi> migPolicy;
migPolicy.push_back(PolicyElement<Indi>(who, criteria));

// // Integration policy
eoPlusReplacement<Indi> intPolicy;

Island<eoEasyEA,Indi> island1(pop, intPolicy, migPolicy, genCont, plainEval, select, transform, replace);
```

Last but not least, add the islands to the model and run the island model:
```c++
model.add(island1);
model.add(island2);
...
model.add(islandn);

model();
```

# Components

Let us now present the design of each component.

## Policies

An island has two different kind of policy: one for the integration of individuals, the other to know who and when sending some individuals, namely the integration policy.

The integration policy is just an ```eoReplacement``` in order to know how to integrate the population: elitist policy by integrating the best individuals or, on the contrary, integrate all individuals for diversification.

For instance:
```c++
eoPlusReplacement<Indi> intPolicy;
```

The migration policy is a little bit different. One could see it like a container of policy rule. Each policy rule is compound of two elements:
"Who" which corresponds to the way to select individuals to send.
This is an ```eoReplacement``` and in our example we define it as follow:
```c++
eoDetTournamentSelect<Indi> selectOne(20); // Tournament between 20 individuals
eoSelectNumber<Indi> who(selectOne, 3);    // Select 3 elements using the deterministic tournament
```

"When" which answers the question: "when to send individuals?".
This is an ```eoContinue``` such as ```eoGenContinue``` or ```eoFitContinue```.
```c++
eoPeriodicContinue<Indi> criteria(5); // Will send individuals all five generations
```
Finally, we need to push the policy rule into the policy :
```c++
MigPolicy<Indi> migPolicy;
migPolicy.push_back(PolicyElement<Indi>(who, criteria)); // First criteria
migPolicy.push_back(PolicyElement<Indi>(who_2, criteria_2)); // Second criteria
...
```

## Islands

The island is simply a wrapper over any algorithm to extent it with communications mecanisms.
```c++
Island<eoEasyEA,Indi> island1(pop, intPolicy, migPolicy, genCont, plainEval, select, transform, replace);
```

This island will be an ```eoEasyEA``` working on individuals of type ```Indi```. It is required to specify the population on which the algorithm will work, policies and others parameters depending on the API of the wrapped algorithm.
The only restriction is that the algorithm needs to inherite from ```eoAlgo<EOT>```, that is to say, it must be a population based algorithm.

## Model

The model is the combination of an island container and a topology. Thus, it is quite straightforward to use it:
```c++
Topology<Complete> topo;
IslandModel<Indi> model(topo);
```

One can change the topology as follow:
```c++
Topology<Ring> topo_2;
model.setTopology(topo_2);
```

It is important to note that the island does not know its neighbours for scalability reasons. It always sends populations to the model which is responsible for dispatching populations to the right islands.

## Topology

The topology defines the links between islands. Since an island does not know its neighbours and the topology does not know neither the islands nor the number of islands, a topology just defines a general way of communications such as Ring, Complete, Hypercubic and more (refer to the documentation for an exhaustive list).

The topology builds the matricial representation, used by the model, only when the model starts. As all topologies can not be built with any number of edges, please, check that the number of islands matches the topology requirements. In the other case an exception will be thrown.

Defining a topology can be done as follow:
```c++
Topology<Complete> topo;
Topology<Ring> topo_2;
Topology<Star> topo_3;
...
```

Note the possiblity a cutom topology by its matricial representation (written in a JSON file), using the Custom topology object.
In addition, it is possible to create stochastic topologies that will return a list neighbors depending on probabilities.
Those mecanisms will be presented in an article about advanced features of the island model.

# Wrapper for homogeneous island model

In order to create an homogeneous model easily, it is possible to use the function ```HomogeneousModelWrapper```.
Please, note that all ```eoContinue``` will be shared between islands ! For instance, if one defines a ```eoGenContinue``` for 300 generations, and a model with 3 islands, only 300 generations will be performed, not 300 for each one !
Moreover, as islands run in parallel, we can not assume that each island will perform exactly 100 generations.

This is the same behavior with the migration policy because it uses ```eoContinue``` as criteria.

Let us see how this convenient wrapper works (more details in the source file ```/smp/tutorial/Lesson2/wrapper.cpp```) :
```c++
std::vector<eoPop<Indi>> pops = IslandModelWrapper<eoEasyEA,Indi>(number_of_islands, topo, popSize, chromInit,
    intPolicy, migPolicy, genCont, plainEval, select, transform, replace);
```

The function needs to know how many islands you would like to create, the topology, and how to create populations (that is to say the size per population and the ```eoInit```). The other parameters depend on the API of the algorithm to wrap inside each island.
