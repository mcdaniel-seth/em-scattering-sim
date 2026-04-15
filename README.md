# em-scattering-sim


## Overview 
Written By: Seth McDaniel
email seth.mcdanie@gmail.com with any questions

This project is a MatLab Simulation of Forward Scattering Energy

The simulation comnpares:
  1. Multiple Particle Sizes with constant particle count
  2. Mutliple Particle Concentrations with constant particle radius

## How to Run

   1. Open MATLAB
   2. Open app1.mlapp
   3. Click Run
   4. Use either tab:
      - Particle Sizes for comparing radius
      - Concentrations for comparing Concentration
   5. Adjust inputs and press Run

      
## Files

  ScatteringSimulation.m
    Main testing simulation file

  app1.mlapp
    Simple app with gui for ease of use

  ForwardScatteringEnergyTest.m
    This is the file I used weekly to show my progress, section by section

## Supporting Files

   - readfromcsv.m  (grabs the middle row from whichever csv file you input)

   -  S1.m            (Implements S1 eqn from [1])
      -   pin.m        (Implements pin eqn from [1])
      -   taun.m       (Implements taun eqn from [1])
      -   mieCoeff.m    (Implements mieCoeff eqn from [2])
         -    riccatiBessel.m  (Implements Riccati Bessel Function)

  -  ForwardScatteringEnergy.m  (Overhead function that caluclates Fwd Scatter)

## Sources

[1] A. R. Jones, “Light scattering for particle characterization,” Progress in Energy and Combustion Science, vol. 25, no. 1, pp. 1–53, 1999, doi: 10.1016/S0360-1285(98)00017-3.

[2] C. Mätzler, MATLAB Functions for Mie Scattering and Absorption, Version 2, Research Report No. 2002-11, Institut für Angewandte Physik, Universität Bern, Bern, Switzerland, Aug. 2002.
