 

 
import uvm_pkg::*; // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 
`include "adder_driver.sv" 
`include "adder_monitor.sv" 
`include "adder_sequencer.sv" 


class agent extends uvm_agent;
`uvm_component_utils(agent)
    adder_driver drv;
    adder_monitor mon;
    adder_sequencer sqr;
    
    function new(string name ="agent",uvm_component parent);
        super.new(name,parent);
    endfunction
        
 function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv=adder_driver::type_id::create("drv",this);
    mon=adder_monitor::type_id::create("mon",this);
    sqr=adder_sequencer::type_id::create("sqr",this);
    

 endfunction

 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
drv.seq_item_port.connect(sqr.seq_item_export);
 endfunction

endclass