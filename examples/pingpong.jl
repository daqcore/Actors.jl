#
# This file is part of the Actors.jl Julia package, 
# MIT license, part of https://github.com/JuliaActors
#

using Actors, Printf, Random, .Threads
import Actors: spawn

struct Player{S,T}
    name::S
    capa::T
end

struct Ball{T,S,L}
    diff::T
    name::S
    from::L
end

struct Serve{L}
    to::L
end

function (p::Player)(prn, b::Ball)
    if p.capa ≥ b.diff
        send(b.from, Ball(rand(), p.name, self()))
        send(prn, p.name*" serves "*b.name)
    else
        send(prn, p.name*" looses ball from "*b.name)
    end
end
function (p::Player)(prn, s::Serve)
    send(s.to, Ball(rand(), p.name, self()))
    send(prn, p.name*" serves ")
end

@threads for i in 1:nthreads()
    Random.seed!(2021+threadid())
end

prn = spawn(s->print(@sprintf("%s\n", s))) # a print server
ping = spawn(Player("Ping", 0.8), prn, thrd=3)
pong = spawn(Player("Pong", 0.75), prn, thrd=4)

send(ping, Serve(pong))
