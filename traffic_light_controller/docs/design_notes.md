# Design Notes — Traffic Light Controller

## 1. Project Overview
This project implements a simple traffic light controller using Verilog HDL. The controller is modeled as a finite state machine (FSM) and advances through its states on each rising edge of the input clock.

## 2. State Encoding

| State | Encoding |
|---|---|
| INIT | `2'b00` |
| GREEN | `2'b01` |
| YELLOW | `2'b10` |
| RED | `2'b11` |

## 3. State Sequence
The controller follows this sequence:

`INIT → GREEN → YELLOW → RED → GREEN → ...`

The INIT state transitions to GREEN. GREEN transitions to YELLOW, YELLOW transitions to RED, and RED transitions back to GREEN.

## 4. Output Behavior

| State | Red | Yellow | Green |
|---|---:|---:|---:|
| INIT | 0 | 0 | 0 |
| GREEN | 0 | 0 | 1 |
| YELLOW | 0 | 1 | 0 |
| RED | 1 | 0 | 0 |

The outputs are assigned inside a clocked `always` block, so they update on the rising edge of the clock as the state is processed.

## 5. Simulation and Verification
The testbench instantiates the controller, generates a clock, and stops the simulation after a defined delay. The design can be verified in Vivado behavioral simulation by observing the clock and the red, yellow, and green output waveforms.

## 6. Current Design Limitations
- Each state advances on every rising edge of the clock; there are no state-duration counters.
- The INIT state turns all lights off.
- The design has no external reset input.
- It is a basic FSM demonstration and does not implement real-world traffic timing or pedestrian/emergency controls.

## 7. Possible Future Enhancements
- Add counters to set configurable durations for each light.
- Add an external reset input.
- Add pedestrian crossing logic.
- Add emergency vehicle priority.
- Add a countdown display or timer.
