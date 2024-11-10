import uvm_pkg::*;
`include "uvm_macros.svh"
`include "adder_transaction.sv" 

class adder_sequencer extends uvm_sequencer#(adder_transaction);
`uvm_component_utils(adder_sequencer)

    function new(string name="adder_sequencer",uvm_component parent);
        super.new(name,parent);
    endfunction
endclass