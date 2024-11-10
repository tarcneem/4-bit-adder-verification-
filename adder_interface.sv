

import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 


interface adder_interface;
    logic signed  [3:0] A ;//First operand 
    logic [3:0]B;//second operand
   
    logic [4:0] Y; //result of the operation

    
    
endinterface