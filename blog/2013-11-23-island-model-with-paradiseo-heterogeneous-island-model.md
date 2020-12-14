---
Title: 'Island Model with ParadisEO: heterogeneous island model'
Date: 2013-11-23 18:13
Category: Mathématiques
Tags: Mathématiques
Lang: en
---

[TOC]


# Introduction

Depending on the problem, one might want to create a model that contains different types of algorithms such as Evolutionary Algorithms or Particle Swarm Optmization algorithms. Hopefully, SMP proposes a mechanism to create such a model.

# Base individual concept

The only difference between an heterogeneous and an homogeneous model is that it requires to define a *base individual* notion which is the *main* type of individuals to exchange. Most of the time, it will be the type used by the largest amount of islands, but it can be more specific, depending on the problem.

When an island sends individuals, it converts individuals to the *base type* before sending them. In addition, when an island receives individuals, itconverts individuals from the *base type* to its own type.

The API is strictly the same thanthe homogeneous model's one. The only difference is the need to specify to the islands running with different indidividual type than the *base type*, functions to convert *from* and *to* base type. Those functions can be lambda, functor, free function or method performed by an object.

# Concrete example

A complete example is available in the file ```/smp/tutorial/Lesson3/heterogeneous.cpp```.

Assuming we have a base type called ```Indi```, and a second type called ```Indi2```, we need to create our conversion functions:
```c++
// Conversion functions
Indi2 fromBase(Indi& i, unsigned size)
{}

Indi toBase(Indi2& i)
{}
```

Note that it it possible to have more that one parameter. In our example, we need the size of the ```Indi2``` to convert an ```Indi``` to an ```Indi2```.

Then, we need to bind our functions in a ```std::function``` object (one per island that does not work on base type :
```c++
// We bind conversion functions
auto frombase = std::bind(fromBase, std::placeholders::_1, VEC_SIZE);
auto tobase = std::bind(toBase, std::placeholders::_1);
```

As the expected prototype for conversion function in the island contains only one parameter (a reference or value of the original type), we need to fix the second one which is the size. That is why we fixed it with the constant ```VEC_SIZE```.

Finally, create your islands :
```c++
Island<eoSGA,Indi2, Indi> gga(frombase, tobase, pop, intPolicy, migPolicy, select,
    xover, CROSS_RATE, mutation, MUT_RATE, eval, continuator);
Island<eoEasyEA,Indi> ea(pop2, intPolicy2, migPolicy2, genCont, plainEval, select2, transform, replace);
```

The third template parameter of the ```eoSGA``` island is the base type.

And finally, we add islands and start the model:

```c++
IslandModel<Indi> model(topo);
model.add(ea);
model.add(gga);

model();
```

Obviously, the number of individual types is not limited to two.
