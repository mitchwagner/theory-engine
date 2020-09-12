# Battle

The Ice Crest Engine intends to flexibly expose as many options as 
possible when it comes to configuring a combat environment.

This is roughly patterned off of the genius that was Civil War
Generals Two, which permitted tiles like "a barn granting a
defensive augmentation off a road in the middle of a forest".
It's slightly more ambitious, because that implementation
conflated the things that I call "tiles" and "features". E.g, I
want to be able to have a fort in a forest- CWG2 did not make
that possible.

## Map 
- Each battle will consist of multiple overlapping nxm square grids.
  We use the term "tile" to refer to a specific map index.

### Height Map
- A data structure specifying a height for each tile.

### Terrain Map
- A data structure assigning a terrain type to each tile. Examples
  of terrain types are "grassland", "desert", "marsh", "swamp", "tundra",
  "beach".

### Connector Map
- A data structure that assigns a connector type to each tile. Used
  for roads, rivers- entities that cross tiles.

### Feature Map
- A data structure for tracking things built on tiles. These
  are things that can be destroyed, like fortresses, pill boxes,
  or barrels of oil.

### Decorations Map
- A data structure that assigns a list of modifying deocrations
  to each tile. Decorations can be purely aesthetic.

### Additional Considerations
- There may be some constraints between layers. For example,
  there may be features or connectors that cannot be built on
  certain terrain. The configuration language must take this into
  account.

## Unit Locations
- A separate (non-grid) data structure mapping units to map indices.

- A list of up to 100 turns-worth of unit grids is kept to facilitate
  "rewind" functionality.

## Possible Expansions
- Hex grids.

## Notes
- The configuration langauge needs to be flexible enough to define an
  attack move for a unit. The intention is less for people to
  write code on top of the Ice Crest Engine, and more for them to
  write configuration, taking advantage of the countless options
  it provides.
