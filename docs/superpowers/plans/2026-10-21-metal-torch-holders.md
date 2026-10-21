# Metal torch holders implementation plan

**Goal:** Complete the vanilla torch-holder material range without changing gameplay, models or existing variants.

**Approved scope:** Vintage Story 1.22.7; add copper, tinbronze, bismuthbronze, blackbronze, iron, meteoriciron, steel, bismuth, molybdochalkos, silver, gold and electrum. Preserve brass, aged and ruined. Two matching plates vertically produce two empty holders. Add furniture-trader selling offers and names/descriptions in every installed game language (34 locale files). No new metal production, C#, Harmony or lighting rules in the shipped mod.

**Architecture:** Content-only mod `moretorchholders`, display name **VS More Torch Holders**. Append material states to the vanilla holder via JSON patches. Reuse the vanilla shapes and corresponding vanilla lantern metal textures directly. One alpha-only `OverlayCutout` mask preserves holder openwork without modifying source RGB. Reuse the vanilla block class, block entity, drops, particles and orientation behavior. Recipes use explicit `game:` references; trader offers append to `/selling/list/-`. Localization for patched vanilla codes belongs in `assets/game/lang`.

## Task 1: Content and recipes
- [x] Established baseline in the real server: 0/12 new materials resolved.
- [x] Created metadata, patches and recipes. Version 1.0.2 removes all guessed tint layers in favor of original lantern textures and one cutout mask; localization now covers 34 locales and 1,224 entries.
- [x] Appended exactly 12 material states while preserving original material variants.
- [x] Real game recipe matching accepted matching plates, rejected mixed plates and consumed both inputs for two holders.
- [x] Added 12 furniture selling entries using the vanilla brass stock and price distributions.

## Task 2: Runtime acceptance and package
- [x] Used isolated data directories and loopback-only dedicated server networking; user data and game files were not modified.
- [x] Resolved all 96 variants, 12 recipes, texture assets and selling entries with the actual game.
- [x] Placed all 12 materials, inserted/removed/reinserted torches, checked drops and brightness, and verified all 12 filled holders after saved-world reload.
- [x] Launched 1.0.2 in the actual client: all 12 holders use matching lantern textures with unchanged RGB. Captured silver holder beside silver lantern; game language loader resolved all 34 locales and 1,224 entries.
- [x] Release ZIP contains only content metadata/assets, not test assemblies or game binaries.
- [x] Updated README and changelog. Lab tooling stays outside the repository; actual trader transactions and separate-client dedicated-server interactions remain unverified.
