---
title: 'Projects'
author: "Daniel Duclos-Cavalcanti"
description: "my projects"
---

# Projects
<hr />

## [FreeRTOS Space-Invaders](https://github.com/duclos-cavalcanti/FreeRTOS-SpaceInvaders)

>A loosely based version of the classic arcade video game developed by Tomohiro Nishikado and released in 1978. 
>The work was written in C and done so as a multi-threaded FreeRTOS application based upon an available emulator.

<!-- ![](/assets/images/space.png){id=media}-->

+ C
+ FreeRTOS 
+ Multi-threaded

## [Value Iteration with OpenMPI](https://github.com/duclos-cavalcanti/Open-MPI-ValueIteration)

> An asynchronous value iteration model implemented as a dynamic programming problem. Done so using 
> Open-MPI to distribute the workload across different machines at a cluster made available by the 
> university.

+ Cpp
+ Dynamic Programming 
+ High Performance Computing
+ Open-MPI

## [Hamming Encoding (16,11) - Error Detection](https://github.com/duclos-cavalcanti/microsemi-error-detection)

<!-- ![](/assets/videos/error.gif?){id=media} -->

>Typical [(16,11) Hamming Encoding](https://en.wikipedia.org/wiki/Hamming_code) error detection and correction algorithm 
>implemented on the Microsemi SmartFusion2 _SoC_.
>The challenge consisted not only of bare-metal C development, as well as VHDL design for the FPGA-side of the system, but 
>also ensuring smooth and correct interaction between fabric and software.

+ C
+ VHDL
+ uC 
+ FPGA
+ UART
+ APB Bus

## [Shmenu](https://github.com/duclos-cavalcanti/shmenu)

>Small CLI-tool written solely in bash that reads a list of arguments separated through _whitespace_
>and displays them in an easy to navigate TUI-menu. The user can shuffle through the options using _j_ 
>and _k_ as an homage to my favorite editor.

<!-- ![](/assets/videos/shmenu.gif?){id=media} -->

+ Bash
+ Posix SH
+ UNIX 
+ CLI
+ TUI

## [Serve](https://github.com/duclos-cavalcanti/serve)

>An almost copycat implementation of shmenu in golang.

+ Golang
+ CLI
+ TUI
