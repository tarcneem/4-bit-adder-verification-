
import uvm_pkg::*; // Import UVM package
`include "uvm_macros.svh"
`include "Env.sv"
`include "adder_sequence.sv"
class test extends uvm_test;
`uvm_component_utils(test)
    function new(string name = "test",uvm_component parent);
        super.new(name,parent);
    endfunction

Env e;
adder_sequence sq;

        
function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   e=Env::type_id::create("e",this);
   sq=adder_sequence::type_id::create("sq");

 endfunction
 virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    sq.start(e.ag.sqr);
    #50;
    phase.drop_objection(this);
 endtask
 endclass
