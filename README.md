# SF1544 projects

See project descriptions in each folder for further details.

## Lab 1 - Quarter Car

### Overview
Purpose of the quarter car lab is to:
- Solve systems with inital conditions/values with explicit methods (Euler, ODE45 from matlab) and implicit methods (trapezoidal rule).
- Illustrate and undertand stability and order of accuracy.
- Implement Newtons method and verify its convergence.

Background to lab:
-  An important part of the car is its suspension system, and one model of a simple suspension system is the quarter car system.
- Two springs (k1, k2) and two dampers (c1,c2) and the mass of the wheel and the car among with other constants (see picture). 
- It is important that the car-ride is pleasent and not too bumpy, while still being safe and able to grip the road.

### Mainscript 2

- a) Plot the extentions of the springs using ODE45
- b) Visualize how the time intervall in ODE45 change
- c) Compare Eulers method and matlabs ODE45

### Mainscript 3

- b) Find the maximum time intervall $\Delta$ t (or $\Delta$ h in our code) where Eulers method is still stable. Is $\Delta$ h =  $5 \times 10^{-3}$ stable?
- c) What happens at 0.9, 1, 1.1, 1.5 times $\Delta$ h?
- d) What happens if we have a more rigid system? k2 = $100 \times $ k2. Plot the system with 0.1 $\Delta$ h.

### Mainscript 4

- a) Plot the new rigid system with h = 1, 10, and 100 times $\Delta$ h.
- b) Measure the maximum error over an intervall of 0.05 s (rigid system) compared to ODE45. Also use the trapezoidal rule and plot it with 1, 1/2, 1/4, 1/8 of h (try different h). Figure out order of accuracy with the trapezodial rule.
 
### Mainscript 5
- a) Optimize k1 and k2 with given functions (Jacobian_transfer_functions.m and transfer_functions.m) if comfort is 71% of its inital value and security remains unchanged.
- b) Implement Newtons method and make sure it converges with the expected order of convergence.
- c) Plot the new optimized k1 and k2 with the initial k1 and k2. 

### Credits
This is a group project, so most of not all of the code is written together with my lab-partner. Some parts we've commited and done alone from home, but mostly it's been written together.

We were also given two functions Jacobian_transfer_functions.m and transfer_functions.m. These we did not write ourselves. 

## Lab 2 - ??
Haven't started yet

## Lab 3 - ??
Haven't started yet


