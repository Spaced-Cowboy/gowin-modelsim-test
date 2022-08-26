# gowin-modelsim-test
Simple test project to work out how to get Gowin's FPGA software to work with Modelsim

This is the result of trying a new FPGA environment (Gowin) and a new Simulator (Modelsim) and trying to get them to work together. 

The newer version adds two rPLL instances, configured to be appropriate for a 400MHz DDR3 controller

# Steps to build:

- Open up the test.gprj in the top level folder you checked this out into
- Click on synthesize / place-and-route, it all ought to work

# Steps to simulate

- open up cmd.exe from the Windows menu
- cd to the folder you checked out into, and then into 'src'
- type 'modelsim' to run Modelsim
- Open up the transcript window (if necessary) and type 'do setup.do'
- Click on the transcript window to re-focus again and type 'do wave.do'

You ought to see the simple wave-form appear within modelsim
