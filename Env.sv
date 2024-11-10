
import uvm_pkg::*; // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 
`include "scoreboard.sv" 
`include "adder_monitor.sv" 
`include "agent.sv" 


class Env extends uvm_env;
`uvm_component_utils(Env)
    scoreboard scr;
    agent ag;
    
    function new(string name ="Env",uvm_component parent);
        super.new(name,parent);
    endfunction
        
 function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   scr=scoreboard::type_id::create("scr",this);
    ag=agent::type_id::create("ag",this);

 endfunction

 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  ag.mon.send.connect(scr.recv);
 endfunction

endclass