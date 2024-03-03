# ECE310
 All projects for ECE 310 during the Spring 2024 semester at North Carolina State University

 Project 1:
    Project 1 was the implementation of a design that calculate the value of (A+B)-(C+D) where A, B, C, D are 4-bit unsigned integers. The output value, "result", is a 5-bit unsigned integer, and a valid flag is to be raised when the correct value is stored in result. I
    used an external library named ece310_lib that is in this repository in its own directory. The library includes low level combinational logic components and sequential components such as a D-flip-flop. I created higher level components using this library, as well as my
    own low level components. All of these components eventually led to datapath and controller modules which then lead to the top-level proj001 module located in "proj001.v". The project requirements limited my programming style to dataflow and structural implementations,
    save for the given library modules and testbench module.
    
