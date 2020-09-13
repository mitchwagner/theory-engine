# Genre Engine Clients

This directory contains clients for various TE-based genre engines, organized
according to genre. 

## Specification Conformance

Each genre engine client must implement an interface that allows a user to
interact with the respective genre engine server per its specified control
flow.

Providing that this is achieved, a conformant genre engine client
has complete control over the user interface experience.

The configuration that defines a game that can be run by a genre
engine can optionally include graphic and sound assets. Clients
may optionally utilize these, or eschew them entirely in favor of
their own assets. For example, a client may elect to use basic
shapes for enemy unit types, instead of configuration-provided
sprites.

Of course, a client providing assets must be reasonable and
consistent.  It can't provide 16x16 sprites for some units,
105x105 sprites for others, a 1024px menu title background, but
4k backgrounds for vignettes depicting conversations, etc. So,
further specification and standardization that allows a
configuration to communicate this kind of information to a client 
is necessary.
