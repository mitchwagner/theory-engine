# Specification

One of the primary aims of Ice Crest is the creation of a modular
and open engine for turn-based strategy RPGs like Fire Emblem.

The Theory Engine forms the foundation of this architecture;
individual genre engines like Ice Crest and Forward Combat build
on top of the primitives it offers. At the top of the stack
is the client:

Theory Engine -> Server (e.g, Ice Crest) -> Clients (UIs)

This directory houses specifications designed to detail a
contract between servers and clients for a particular genre
engine. This includes information such as:

- Core game mechanics
- Information exposed to clients via the server's API
