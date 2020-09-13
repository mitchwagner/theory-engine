# Theory Engine

The Theory Engine (TE) is a turn-based strategy engine whose design is
focused on mathematical elegance and expressivity.

## Goal

Theory Engine provides a modular core that captures the unifying
features of a variety of turn-based strategy games, including
those of

- Chess
- Checkers
- Noughts and Crosses
- Fire Emblem
- Advance Wars
- Civil War Generals

The Theory Engine is MIT-licensed and 100% free in all senses of
the word. The ultimate aim of the engine is to lower the barrier
to entry in this genre, and stimulate innovation in all its
aspects, from story-telling to gameplay. The Theory Engine
strives to do for turn-based strategy what Mario Maker has done
for platformers, and what Stardew Valley did to farming sims.

It's 2020. It's time the bar for these games was raised- the
stories alone could stand a healthy does of open and accessible
competition. People are still doing ROM hacks, and there's really
no excuse for the lack of supporting tooling. So, here it is, or
at least here it will be, at last!

## Theory

The hypothesis motivating the Theory Engine is that an intuitive,
rigorous foundation will both increase code quality and reduce
the time to required to extend the engine's core capabilities.

## Structure

The foundation of the Theory Engine is a lean control-flow abstraction
that captures the essence of what it means to be turn-based.

The Theory Engine will (eventually) provide modules ("genre
engines") built on top of this foundation, including:

- Chess (demonstration)
- Checkers (demonstration)
- The Ice Crest Engine (Fire Emblem clone) 
- The Forward Combat Engine (Advance Wars clone)

The Ice Crest and Forward Combat engines will be fully
configurable, affording anyone with the ability to modify
configuration files the ability to design their own Fire Emblem
or Advance Wars story, as well as limited aspects of gameplay. As
free and open-source engines, they also offer promise further
extensibility. 

## Theory

### Client-Server Architecture

TE is designed with a client-server architecture in mind.
Turn-based strategy games in particular are excellent
applications for such a design, as they are relatively, if not
entirely, immune to the problems of latency.

The architecture lends itself well to an open-source,
collaborative project, as it encourages a strong decoupling of
interface and game logic. This liberates clients to consume the
game in whatever manner they see fit, whether that be via a
command-line interface, a web browser, or a native user
interface. By designing a game from the ground-up to adhere to a
client-server architecture, the implementation of multiplayer is
also made all the easier.
