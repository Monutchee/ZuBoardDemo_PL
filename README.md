# Vivado Project Template for version control

## Version Control Policy

This repository tracks Vivado design intent, not generated build output.

Track:

- HDL sources under `SourceData/DesignFile/`
- constraints under `SourceData/Constraints/`
- block design sources such as `SourceData/BlockDesign/MainBlock/MainBlock.bd`
- the top-level generated wrapper if it is used as the project top
- rebuild/export scripts under `SourceData/Script/`

Do not track:

- `vivado_gen/` project/build output, except `vivado_gen/ZuBoardDemo_PL.xpr`
- block-design generated IP output under `SourceData/BlockDesign/**/ip/`
- shared IP cache under `SourceData/BlockDesign/**/ipshared/`
- generated netlists, checkpoints, reports, logs, journals, and hardware handoff output

`vivado_gen/ZuBoardDemo_PL.xpr` is kept as an archive/convenience snapshot.
Treat the `SourceData/` files and rebuild scripts as the source of truth because Vivado may rewrite `.xpr` paths and run metadata when the project is opened or rebuilt.

## Project Initialization

1. Create or regenerate the Vivado project under `vivado_gen/`.
2. Add the source files from `SourceData/`.
3. Generate block-design output products locally from the tracked `.bd` file.

## Usage

1. Create source files under `SourceData/`.
2. After real project or block-design changes, update the tracked source files and scripts:
   - For project changes, use `File -> Project -> Write Tcl`.
   - For block-design changes, use `File -> Export -> Export Block Design`.
   - Write generated scripts to `SourceData/Script/`.
3. Before committing, `git status` should normally show only source-intent changes such as `.bd`, HDL, XDC, or scripts. Recompile-only changes in `vivado_gen/`, `ip/`, and `ipshared/` should remain ignored.

