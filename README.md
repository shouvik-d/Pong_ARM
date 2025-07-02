# ARM Assembly Pong Game

A classic Pong game implementation written in ARM assembly language for the TM4C123GH6PM microcontroller (Tiva C Series).

## Overview

This project implements a fully functional Pong game with two-player support, featuring:
- Real-time gameplay with paddle and ball physics
- ANSI terminal graphics for visual display
- Hardware integration with GPIO buttons, switches, and LEDs
- Configurable scoring system
- Power-up mechanics
- Pause/resume functionality

## Hardware Requirements

- **Microcontroller**: TM4C123GH6PM (Tiva C Series)
- **Development Board**: EK-TM4C123GXL LaunchPad
- **Terminal**: ANSI-compatible terminal emulator
- **Connections**: UART for display, GPIO for controls

### Pin Configuration
- **Port F**: RGB LED control and push button input
- **Port B**: External LED control
- **Port D**: Additional switch inputs (SW2-SW5)
- **UART0**: Terminal communication

## Game Features

### Core Gameplay
- **Two-player Pong**: Classic paddle-based ball bouncing game
- **Ball Physics**: Multi-directional movement (horizontal, diagonal)
- **Collision Detection**: Ball-paddle and boundary interactions
- **Real-time Clock**: Game timer display

### Scoring System
- Configurable winning points: 3, 5, 7, or 10 points
- Real-time score display for both players
- Win condition detection and display

### Power-ups
- Random power-up generation during gameplay
- Multiple power-up types with different colors
- Timed power-up effects

### Controls
- **SW2-SW5**: Point selection (3, 5, 7, 10 points)
- **SW1**: Pause/unpause game
- **Space**: Start game, continue rounds
- **1/2 Keys**: Serve selection
- **Push Buttons**: Paddle movement

## File Structure

```
lab7_final/
├── main.c                    # Entry point
├── main_routine.s           # Main game logic and flow
├── library.s               # Hardware interface functions
├── pong_lib.s              # Game-specific functions
├── tm4c123gh6pm_startup_ccs.c  # Startup code
├── tm4c123gh6pm.cmd        # Linker script
└── README.md               # This file
```

### Key Files

- **main_routine.s**: Contains game state management, user interface, and main game loop
- **library.s**: Low-level hardware functions (UART, GPIO, timers)
- **pong_lib.s**: Game rendering, display management, and visual elements

## Game States

1. **Boot**: Initial startup screen
2. **Point Selection**: Choose winning score
3. **Serve Selection**: Choose starting player
4. **Active Gameplay**: Real-time Pong game
5. **Pause**: Game suspended
6. **Game Over**: Winner display and restart option

## Display System

### ANSI Terminal Graphics
- Uses ANSI escape sequences for colors and positioning
- 256-color palette support
- Dynamic cursor positioning
- Real-time screen updates

### Color Scheme
- **Background**: Gray (ANSI 239)
- **Game Area**: Black (ANSI 232)
- **Player 1**: Blue elements
- **Player 2**: Red elements
- **Power-ups**: Various colors (randomized)

## Building and Running

### Prerequisites
- Code Composer Studio (CCS)
- TM4C123GH6PM target configuration
- ANSI-compatible terminal

### Build Steps
1. Import project into CCS
2. Configure target device (TM4C123GH6PM)
3. Build project
4. Flash to microcontroller
5. Connect terminal to UART0 (115200 baud)

### Runtime Setup
1. Power on the development board
2. Open terminal connection
3. Press SPACE to boot the game
4. Follow on-screen prompts

## Game Flow

1. **Startup**: Display boot message
2. **Configuration**: Select points and serve direction
3. **Gameplay**: 
   - Paddles move via button input
   - Ball bounces with physics simulation
   - Score tracking and display
   - Power-up generation and effects
4. **End Game**: Winner announcement and restart option

## Technical Implementation

### Interrupt Handlers
- **UART0_Handler**: Keyboard input processing
- **Switch_Handler**: GPIO button interrupts
- **Timer_Handler**: Game timing and physics updates
- **Second_Timer_Handler**: Clock and power-up timing

### Memory Management
- Static allocation for game state
- String buffers for display text
- Pointer tables for efficient access

### Real-time Features
- Non-blocking input handling
- Smooth animation updates
- Responsive control input
- Consistent timing

## Troubleshooting

### Common Issues
- **No display**: Check UART connection and baud rate
- **Controls not working**: Verify GPIO pin connections
- **Game freezes**: Reset microcontroller and restart
- **Colors not showing**: Ensure ANSI-compatible terminal

### Debug Tips
- Monitor UART output for error messages
- Check LED indicators for system status
- Verify switch functionality with multimeter
- Use debugger for code execution analysis

## Development Notes

- Written in ARM assembly for educational purposes
- Demonstrates embedded systems programming concepts
- Showcases real-time system design
- Integrates multiple hardware peripherals
- Uses interrupt-driven architecture

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