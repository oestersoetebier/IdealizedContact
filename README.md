IdealizedContact
================

The `IdealizedContact` Library is a free Modelica package for modeling and handling of collisions in MultiBody Systems.
Modeling of multibody mechanics plays a central role in the design of mechatronic systems. In technical use-cases, these often contain loose couplings, where contact is possible. The IdealizedContact library is ready-to-use contact library for Modelica. It comprises surface definitions for simple contact surfaces, which can be connected with the multibodies of the Modelica Standard Library. It furthermore implements a force-based approach between single contact points. The contact forces are calculated in configurable non-central contact blocks. 
The aim is to bring the designer in the position to perform simulations of industrial applications including contacts. Thereby, the analysis of the principle functional capability of the system in the course of the conceptual design is focused. This entails specialized modeling principles concerning the usability and the interpretation of the simulation results, which both should be relatively easy. In addition, it should be possible to define each component separately in order to be able to reuse and combine approved patterns in new applications.

The library was presented at the 10th International Modelica Conference (https://modelica.org/events/modelica2014/proceedings/html/sessions/session_libraries.html). 
Detailed explanations of the concept can be found in the [paper](http://dx.doi.org/10.3384/ecp14096929). Exemplarily the results of chosen experiments are shown therein. They are compared with benchmark simulations in RecurDyn. 

## Current release

Download [latest development version](../../archive/master.zip)

#### Release notes
* [Version v0.1.0 (2014-05-07)] initial version based on the one presented at Modelica 2014
  

## License
The library is licensed under the Modelica License 2
This Modelica package is free software and the use is completely at your own risk; it can be redistributed and/or modified under the terms of the Modelica license 2, see the license conditions (including the disclaimer of warranty) at http://www.Modelica.org/licenses/ModelicaLicense2. 

## Development and contribution

The library was developed by:

Heinz Nixdorf Institute  
Control Engineering and Mechatronics  
University of Paderborn  
F�rstenallee 11  
33102 Paderborn  
Germany  
web: https://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/

Contributers:
* Peng Wang
* Felix Oesters�tebier

You may report any issues with using the [Issues](../../issues) button.

Contributions in shape of [Pull Requests](../../pulls) are welcome.

## Acknowledgements: 
This work was partly developed in the project [ENTIME](http://entime.upb.de/): Entwurfstechnik Intelligente Mechatronik (Design Methods for Intelligent Mechatronic Systems). The project ENTIME is funded by the state of North Rhine-Westphalia (NRW), Germany and the EUROPEAN UNION, European Regional Development Fund, Investing in your future. 

