# VS More Torch Holders

Content-only mod for **Vintage Story 1.22.7**. Adds the missing metal variants of the vanilla wall-mounted **torch holder**. These hold torches, not lanterns.

## Materials

Copper, tin bronze, bismuth bronze, black bronze, iron, meteoric iron, steel, bismuth, molybdochalkos, silver, gold and electrum. The existing brass, aged and ruined holders are left in place.

## Crafting and trading

Place **two plates of the same metal vertically** in the crafting grid to make **two empty holders**. The recipes are available in the handbook. Mixed metals do not craft a holder.

Furniture traders can sell each new holder. Stock and price distributions match the vanilla brass holder: stock average 2, variation 0.5; price average 12 rusty gears, variation 3. Offers use the normal randomized trader assortment; not every metal appears at every trader or restock.

The mod adds no plate-production recipes. A holder recipe does not make its metal plate obtainable if the base game does not provide a survival route for that material.

## Vanilla mechanics

Same model, placement, torch insertion/removal, drops, light level and permanent burning as the vanilla functional holder. No custom C# code, Harmony patches, new light rules or buffs. Each new holder directly references the corresponding vanilla lantern metal texture. The only overlay is an alpha-only cutout preserving the vanilla holder's openwork: no recoloring, RGB filters or invented palettes. Game textures and shapes are referenced from the installation, not redistributed.

## Languages

All 33 languages selectable in Vintage Story 1.22.7, plus the installed Romanian locale: **34 locale files, 36 entries each (1,224 translations)**. Includes holder names, empty-holder names and descriptions. Locale codes: `ar`, `be`, `bg`, `cs`, `da`, `de`, `en`, `eo`, `es-419`, `es-es`, `fi`, `fr`, `hu`, `is`, `it`, `ja`, `ko`, `lt`, `nl`, `no`, `pl`, `pt-br`, `pt-pt`, `ro`, `ru`, `sk`, `sr`, `sv-se`, `th`, `tr`, `uk`, `vi`, `zh-cn`, `zh-tw`. Uses vanilla metal terminology where available. Translations have not received native-speaker review for every language.

## Install

1. Back up the world before adding or removing content mods.
2. Remove the previous `moretorchholders` ZIP, then copy `moretorchholders_1.0.2.zip` from `dist/` into your Vintage Story data directory's `Mods` folder. Do not extract it or keep two versions installed.
3. Restart the game. Multiplayer requires the mod on the server and clients.

Windows default user mod directory: `%APPDATA%\VintagestoryData\Mods`.

Removing the mod makes the added holder blocks unavailable in existing worlds. Do not remove it from a world that uses them without first removing those holders or restoring a backup. Compatibility with other mods that replace torch-holder material variants or texture mappings is not guaranteed.

## Build

From the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1
```

Produces `dist/moretorchholders_1.0.2.zip` containing only `modinfo.json` and `assets/`. The script checks JSON parsing and uses deterministic ZIP entry timestamps. No .NET SDK or game files are needed to package the content mod.

## Размещение и крафт

Две пластины одного металла, расположенные вертикально, дают два держателя. Держатель устанавливается на стену и использует обычный факел. Ванильная механика не меняется. Новые варианты также добавлены в случайный ассортимент торговца мебелью.

## Verification — 2026-10-21

The initial 1.0.0 mechanics checks below used the actual **1.22.7** dedicated server and client in separate lab data directories, with a temporary verification mod outside this repository and outside the release ZIP.

- Baseline without this mod: 0/12 added materials resolved.
- With the ZIP: all **96** added block variants resolved (12 metals × 2 states × 4 orientations).
- All **12** recipes accepted matching plates, rejected mixed plates, consumed both inputs and produced two holders.
- **96** drop/brightness checks passed; original holder variants remained present.
- All **12** furniture selling entries resolved. An actual trader transaction was not exercised.
- Actual game methods successfully placed all **12** holders and inserted, removed and reinserted torches.
- After saving and reopening the test world, all **12** filled holders retained their material and state.
- The client resolved all **12** custom material textures and Russian inventory names; startup reported no captured issues.
- Initial ZIP validation: **18 files**, valid CRCs and JSON, no C# assemblies or extracted game files.

### 1.0.1 visual correction

- The real client loaded `moretorchholders_1.0.1.zip` and confirmed all 12 materials use the exact vanilla brass shape, rotation and base texture.
- A close-up wall screenshot compared vanilla brass, aged and copper holders. Fine crenellations, holes, surface detail and silhouette now match the vanilla reference. Both empty and torch-filled holders rendered in the comparison scene.
- All 13 flat tint-layer alpha masks match the vanilla brass alpha mask at every pixel; the layers add no replacement artwork or geometry.
- Corrected ZIP validation: **19 files**, valid CRCs, payload matches source, display name **VS More Torch Holders**.

### 1.0.2 material and language correction

- Real client: all 12 holders use the corresponding `game:block/metal/lantern/{metal}` texture. The actual game's `OverlayCutout` operation preserved every source RGB pixel; it changes alpha only.
- In-game close-up: silver holder directly alongside silver lantern, plus adjacent copper examples. No guessed brass recoloring remains.
- The actual game language loader resolved all **1,224 entries across 34 locales**, including wildcard block names and descriptions.
- File coverage matches all 33 menu languages plus the installed Romanian translation file. Every locale contains all 36 mod keys.
- Final archive: **39 files**, valid JSON and CRCs, 34 locale files and one original alpha-cutout mask. No copied vanilla textures, test assemblies or RGB tint images.

Actual trader transactions, separate-client dedicated-server interaction and compatibility with third-party mods have not been verified.
