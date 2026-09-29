# msxzin

An MSX1 emulator for DOS in 4 KB.

`msxzin.com` is a complete MSX1 in a single 4096-byte `.COM` file. It runs on
any 8086-compatible PC, from a real XT to DOSBox.

## Features

- **Z80**, verified by the ZEXDOC instruction exerciser
  - IM 0, IM 1 and IM 2
  - undocumented opcodes
- **VDP (TMS9918)**
  - SCREEN 0, 1, 2 and 3
  - 8x8 and 16x16 sprites, magnified sprites
  - fifth-sprite limit and sprite collision
  - read-ahead on data port reads
  - mirrored colour and pattern tables
- **Sound**: PSG and Konami SCC, rendered as sampled waves
  - PSG logarithmic volume and envelopes
- **Cartridges** of any size, MegaROMs included
  - mappers: Konami, Konami with SCC, ASCII 8 KB, ASCII 16 KB, R-Type
  - the mapper is detected automatically
- **Disks**: `.dsk` images of 180, 360 or 720 KB, read and written
- **Tapes**: `.cas` files

## Running

- **Download** [msxzin.zip](https://ricbit.github.io/msxzin/msxzin.zip): the
  emulator with `bios.rom` and `disk.rom`, ready to run.
- **Run it online** in your browser, in an emulated DOS PC:
  [msxzin-run.html](https://ricbit.github.io/msxzin/msxzin-run.html).

From the DOS prompt:

```
msxzin              boots into BASIC
msxzin game.rom     a cartridge
msxzin game.cas     a tape
msxzin game.dsk     a disk
```

Press **Esc** to quit.

The emulator loads these ROM files from the current directory. The zip
includes them; a build from source needs its own:

- `bios.rom` is the 32 KB MSX1 BIOS. It is required.
- `disk.rom` is an MSX disk ROM. It is needed only for `.dsk` images.

Requirements:

- DOS on an 8086 or better, with VGA.
- EMS memory, to hold cartridge banks.
- A Sound Blaster 16 at port 220h, 16-bit DMA channel 5, for sound.
- File names in DOS 8.3 form.

On a modern machine, run it in [DOSBox](https://www.dosbox.com/).

## Building

The source is `msxzin.ng`, which is assembled with namagiri. `debug.ng` holds
debugging hooks, and `selfext.ng` is the self-extracting stub that unpacks
the program when it starts.

```
make NAMAGIRI=/path/to/namagiri
```

This assembles the emulator, packs it, and wraps it in the stub to produce
`msxzin.com`.

## Reading the source

GitHub has no syntax highlighting for `.ng` files.
[Read it syntax-highlighted](https://ricbit.github.io/msxzin/msxzin.html), as
it appears in the editor. The same page is `html/msxzin.html` in this
repository.
