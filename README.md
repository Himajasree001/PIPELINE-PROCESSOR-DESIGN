# PIPELINE-PROCESSOR-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: UPPU HIMAJASREE

*INTERN ID*: CT08DN217

*DOMAIN*: VLSI

*DURATION*: 8 WEEKS

*MENTOR*: NEELA SANTHOSH 

**Task Name: Design and Simulation of a Basic Pipelined Processor Using Verilog**

The task assigned was to design and simulate a simple **pipelined processor** using Verilog, focusing on a multi-stage pipeline architecture and basic instruction set execution. This project was completed entirely using **EDA Playground**, an online simulation platform that supports a variety of Verilog simulators such as ModelSim and Icarus Verilog. EDA Playground provided a convenient web-based environment for writing, compiling, simulating, and debugging Verilog code, making it an ideal tool for digital design projects like this one. With the ability to quickly iterate over code changes and visualize waveforms, it offered the flexibility and efficiency required to complete the task smoothly.

The main objective of this task was to model a basic pipelined processor architecture with instruction fetch, decode, execute, and write-back stages. In the design, a small instruction memory and a register file were implemented along with pipeline registers to simulate the flow of instructions through different stages of the processor. The instruction set included a few basic operations such as `ADD`, `SUB`, and `LOAD`, represented in a 16-bit instruction format. These instructions were preloaded into the instruction memory during initialization using the `initial` block in Verilog. A set of general-purpose registers was also initialized with some default values to aid in testing and simulation.

The processor itself was divided into standard pipeline stages: the `IF_ID`, `ID_EX`, and `EX_MEM` pipeline registers represented the instruction movement from fetch to execution. At each positive clock edge, depending on the stage, the processor fetched a new instruction, decoded it to determine operands and operation types, executed arithmetic or immediate load instructions, and finally, wrote the results back into the register file. The `opcode`, `rd`, `rs1`, `rs2`, and `imm` fields were extracted using bit slicing, and operations such as `ADD`, `SUB`, and `LOAD` were implemented in a `case` block within the always block triggered by the clock.

To test the design, a dedicated testbench module was written to simulate the processor under controlled conditions. It included a clock signal toggling every 5 time units and an initial reset phase to initialize the processor. The `$dumpfile` and `$dumpvars` system tasks were used to generate waveform outputs in `.vcd` format, allowing the internal behavior of the processor—including register file contents, instruction flow, and data paths—to be visualized clearly during simulation. A simulation runtime of 100 time units was chosen to allow multiple instructions to pass through the pipeline, demonstrating instruction overlap and write-back.

This task holds practical significance in both academic learning and real-world digital design. The concepts applied here are foundational to understanding how modern processors are built and how instruction-level parallelism improves performance. Designing a pipelined processor gives valuable insights into hazards, data dependencies, and the importance of timing in hardware systems. Such designs can be extended for more advanced processors with features like branching, memory access, and hazard handling. The skills demonstrated through this project—modular Verilog coding, simulation, and debugging—are directly applicable in the development of embedded systems, custom CPUs, FPGA implementations, and teaching processor architecture in educational environments. Overall, completing this task successfully offered a hands-on, conceptual, and practical understanding of pipelining in digital systems.

*OUTPUT*

![Image](https://github.com/user-attachments/assets/88a9a087-cd10-41d4-b5c3-4b93c5b8bbbd)
