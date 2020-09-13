# Vignettes

For our purposes, a vignette conforms to the following
Merriam-Webster definitions:
- "a short descriptive literary sketch"
- "a brief incident or scene (as in a play or movie)

A vignette is defined by a list of snapshots, either:

1) A Frame, which has:
    - characters talking from assigned positions (left,
      center-left, center-right, right)

    - a Line, which specifies a character and a bubble of text for them
      to say.
        - Note: it might be useful to provider a wrapper for a long
          line in configuration to automatically split it into
          multiple Lines.

    - A specific background (or not at all- vignettes can be displayed
      in the middle of a battle)

    - Optionally, an animation to play on the background (scroll left,
      scroll right, etc.)

or

2) An Action- a vignette can optionally be parameterized by a Map,
   which can be manipulated at all will by the vignette.

A Vignette is a Room, and must specify the room that immediately follows it.
This allows us to transfer control to a Vignette in the middle of a battle,
and, upon exiting it, return immediately to the battle itself, while also
allowing us the flexibility to use Vignettes outside of combat.
