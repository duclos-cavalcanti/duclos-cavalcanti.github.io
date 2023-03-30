---
title: 'Projects'
author: "Daniel Duclos-Cavalcanti"
description: "my projects"
---

# Projects
<hr />

## [FreeRTOS Space-Invaders](https://github.com/duclos-cavalcanti/microsemi-error-detection)

A loosely based version of the classic arcade video game - Space Invaders - developed by Tomohiro Nishikado and released in 1978. 
The work was written in C and based upon a FreeRTOS emulator.

<!-- ![](/assets/images/space.png) -->

+ Keywords: __C - FreeRTOS - RTOS__

## [Value Iteration with OpenMPI](https://github.com/duclos-cavalcanti/Open-MPI-ValueIteration)

The goal was implement an asynchronous value iteration model configured as a dynamic programming problem. This was done using 
Open-MPI to distribute the workload across different machines.

+ Keywords: __C++ - Dynamic Programming - High Performance Computing__

## [Hamming Encoding (16,11) - Error Detection](https://github.com/duclos-cavalcanti/microsemi-error-detection)

<!-- ![](/assets/videos/error.gif?){id=video} -->

Typical [(16,11) Hamming Encoding](https://en.wikipedia.org/wiki/Hamming_code) error detection algorithm 
implemented on the Microsemi SmartFusion2 _SoC_. The work wishes to emulate a typical scenario in Space Engineering, 
where communication between devices may be corrupted, when bits are _"flipped"_ due to radiation. 
The work consisted of embedded-C development, as well as `VHDL` development for the FPGA-side of the system.

+ Keywords: __C - VHDL - FPGA - Embedded uC - Tcl - UART - APB Bus__

## [Shmenu](https://github.com/duclos-cavalcanti/shmenu)

Small CLI-tool written solely in bash that reads a list of arguments separated through _whitespace_
and displays them in an easy to navigate TUI-menu. The user can shuffle through the options using _j_ 
and _k_ as an ode to my favorite editor.

<!-- ![](/assets/videos/shmenu.gif?){id=video} -->

+ Keywords: __Bash/Posix SH__ - __UNIX__ - __CLI__

## [Serve](https://github.com/duclos-cavalcanti/serve)

An almost copycat implementation of shmenu in golang.

+ Keywords: __Golang - CLI__

