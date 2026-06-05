# ARM Assembly Pong — TM4C123 (Tiva C)

A two-player Pong game written almost entirely in **ARM assembly** for the Texas Instruments **TM4C123GH6PM** (ARM Cortex-M4) microcontroller. It runs bare-metal on the LaunchPad and renders in real time to any ANSI terminal over UART — no display hardware required.

<!-- Add a short screen-capture GIF of gameplay here. It's the single most compelling thing you can put in this README.
![Gameplay demo](docs/demo.gif) -->

## Highlights
- **Bare-metal, hand-written ARM assembly** (~87% of the codebase) — register-level control, no HAL or RTOS.
- **Interrupt-driven architecture** — input, physics, and timing run off hardware interrupts rather than polling.
- **Terminal rendering over UART0** using ANSI escape sequences for color, cursor positioning, and real-time animation.
- **Complete game loop**: config menu, serve selection, live play with ball physics and collision detection, scoring, pause/resume, and a win screen.

## Skills demonstrated
ARM Assembly · ARM Cortex-M4 · bare-metal firmware · interrupt service routines · UART serial comms · GPIO · hardware timers · ANSI terminal graphics · finite-state game logic

## Hardware
- **MCU:** TM4C123GH6PM (Tiva C Series)
- **Board:** EK-TM4C123GXL LaunchPad
- **I/O:** ANSI-compatible terminal over UART0 (115200 baud)

| Port  | Use                                  |
|-------|--------------------------------------|
| Port F | On-board RGB LED + push button      |
| Port B | External LED indicators             |
| Port D | Switches SW2–SW5                    |
| UART0  | Terminal display + keyboard input   |

## How it works
Execution starts in `main.c`, which initializes hardware and hands control to the assembly game engine. Four interrupt handlers drive everything:

- `UART0_Handler` — keyboard input (start, serve, pause)
- `Switch_Handler` — button input for paddle movement and menu selection
- `Timer_Handler` — ball physics and animation tick
- `Second_Timer_Handler` — game clock and power-up timing

Gameplay runs as a state machine: **Boot → Point Selection (3/5/7/10) → Serve Selection → Play → Pause → Game Over.**

## Project structure
```
main.c                       Entry point / hardware init
main_routine.s               Game state machine and main loop
library.s                    Low-level hardware drivers (UART, GPIO, timers)
pong_lib.s                   Rendering and game-specific routines
tm4c123gh6pm_startup_ccs.c   Startup / vector table
tm4c123gh6pm.cmd             Linker script
```

## Build & run
1. Open the project in **Code Composer Studio** (target: TM4C123GH6PM).
2. Build and flash to the LaunchPad.
3. Connect a terminal (PuTTY, screen, etc.) to UART0 at **115200 baud, 8-N-1**.
4. Press **Space** to boot, choose a score limit with **SW2–SW5**, and play.

## Notes
Built as a course project to explore bare-metal embedded programming and real-time, interrupt-driven design on ARM. Shared for portfolio and reference use — please don't submit it as your own academic work.

## License

Copyright (c) [2025] [Shouvik Das]

This project is provided for personal reference purposes only.

You may **not**:
- Reproduce, distribute, or publicly display this project or its contents
- Use any part of this project in your own public or commercial projects
- Submit this project or any derivative work as your own for academic, professional, or competitive purposes
- Modify or redistribute the code in any form

THE PROJECT IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED.

Any unauthorized use of this project is strictly prohibited.
