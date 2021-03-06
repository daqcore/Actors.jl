# Actor Model

```@meta
CurrentModule = Actors
```

The Actor Model was originally proposed by Carl Hewitt et. al. in the 70es and since then has evolved into different families [^1]. 

We focus here on the *classical Actor Model* described by Gul Agha in Actors [^2]. This sees an *actor* as the universal primitive of concurrent computation:

> An actor is a computational entity that, in response to a message it receives, can concurrently:
>
> - *send* a finite number of messages to other actors;
> - *create* a finite number of new actors;
> - designate the *behavior* to be used for the next message it receives. [^3]

## Actor Characteristics

Actor systems and actors have the following basic characteristics[^4] :

- communication via direct *asynchronous messaging*,
- actors support *finite state machines*,
- actors *do not share their mutable state*,
- *lock-free* concurrency,
- actors *support parallelism*,
- actors tend to *come in systems*.

Modern actor implementations extend those by

- *location transparency*: this enables actors of different kinds and on different systems to communicate,
- *supervision*: actors form a dependency relationship where a parent actor supervises child/subordinate ones. This is used to implement fault tolerant systems.
- *actor protocols*: there are predefined actors  following a specific message protocol to implement complex behaviors e.g. as generic server, supervisor, router, publish-subscribe ...  

## Actor Primitives

The actor machinery is based on only a few basic [primitives](../api/primitives.md) defined in [`ActorInterfaces.Classic`](https://github.com/JuliaActors/ActorInterfaces.jl):

| Primitive             | Brief description            |
|:----------------------|:-----------------------------|
| `Addr` | an address identifying an actor,  |
| `self()` | get the address of the current actor, |
| `spawn(bhv)` | create an actor from a behavior and return an address, |
| `send(addr, msg)` | send a message to an actor, |
| `become(bhv)` | an actor designates a new behavior, |

A user can write actor programs using only those. His programs should run with minor modifications on other actor libraries supporting the same basic interface.

!!! note "The interface needs yet work!"

    At the moment the Actors implementation of the interface in ActorInterfaces.Classic is not complete as it doesn't support context injection with `@ctx`.

[^1]: De Koster, Van Cutsem, De Meuter 2016. *[43 Years of Actors](http://soft.vub.ac.be/Publications/2016/vub-soft-tr-16-11.pdf): A Taxonomy of Actor Models and Their Key Properties*.
[^2]: Gul Agha 1986. *Actors. a model of concurrent computation in distributed systems*, MIT
[^3]: See the Wikipedia entry on the [Actor Model](https://en.wikipedia.org/wiki/Actor_model).
[^4]: Here I follow roughly: Vernon, Vaughn 2016. *Reactive messaging patterns with the Actor model: applications and integration in Scala and Akka*, Pearson

