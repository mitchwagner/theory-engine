# Specification

The aim of a _genre engine_ is to expose all of the functionality
necessary, via a flexible configuration language, to recreate
the basic facets of most entries in a particular series of games.

For example, the Ice Crest Engine aims to facilitate the recreation
of Fire Emblem games; its configuration language exposes things
like item inventories, stats, unit classes, and persistent units.
By contrast, the Forward Combat exposes configuration items like
unit type, unit costs, and per-unit fuel and ammo reserves.

These "genres" all share a number of unifying characteristics, so
why _not_ create one giant monorepo leveraging the same code base
to make each of them?

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
