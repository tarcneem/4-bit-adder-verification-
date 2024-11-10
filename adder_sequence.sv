
`ifndef adder_sequence_sv
`define adder_sequence_sv
`include "uvm_macros.svh"
import uvm_pkg::*; 
`include "adder_transaction.sv" 

class adder_sequence extends uvm_sequence#(adder_transaction);
    `uvm_object_utils(adder_sequence)
    function new(string name="adder_sequence");
        super.new(name);
       endfunction
       virtual task body();
        //instance of  the transaction
        adder_transaction req=adder_transaction::type_id::create("req");

        start_item(req);
        req.randomize();
        `uvm_info(get_type_name(),$sformatf("Data send to driver a= %0d,b=%0d ",req.A,req.B),UVM_LOW)
        finish_item(req);
       endtask
   
endclass
`endif // End of include guard
