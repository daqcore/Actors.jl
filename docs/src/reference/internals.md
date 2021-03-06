# Internals

```@meta
CurrentModule = Actors
```

Actors have internal data structures controlling their behavior:

## Actor State

```@docs
_ACT
Info
```

## Actor Mode

More complex actor behaviors can be realized by changing their mode. `Actors` uses the following modes:

| mode | brief description |
|:-----|:------------------|
| `:default` | the default actor mode. |
| `:sticky` | sticky actors do not exit if they get an [`Exit`](@ref) signal from a connected actor. |
| `:system` | behave as `:sticky` actors, but are  internal actors `_REF` and `_ROOT`. |
| `:supervisor` | reserved for actors with supervisor behavior. |

## Connections

The error handling between actors is realized by connections between them

```@docs
Connection
Peer
Monitor
Monitored
Super
Child
```

## Supervision

A supervisor actor has a function object as behavior:

```@docs
Supervisor
```
