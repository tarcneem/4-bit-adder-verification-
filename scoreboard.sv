

import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 


class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
    uvm_analysis_imp#(adder_transaction,scoreboard) recv;
    adder_transaction req;
    function new(string name = "scoreboard",uvm_component parent);
super.new(name,parent);
recv=new("recv",this);
req=new();
    endfunction

     function void build_phase(uvm_phase phase);
super.build_phase(phase);

     endfunction

     virtual function void write(input adder_transaction t);
        req = t;
       `uvm_info("SCO",$sformatf("Data rcvd from Monitor a: %0d , b : %0d and y : %0d",req.A,req.B,req.Y), UVM_NONE);
       
         if(req.Y == req.A + req.B)
            `uvm_info("SCO","Test Passed", UVM_NONE)
        else
            `uvm_info("SCO","Test Failed", UVM_NONE);
        endfunction
       
endclass