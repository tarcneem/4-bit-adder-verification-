`ifndef adder_transaction_sv
`define adder_transaction_sv

`include "uvm_macros.svh"
import uvm_pkg::*; 

class adder_transaction extends uvm_sequence_item;
//data members
    rand logic [3:0]A;
    rand logic [3:0]B;
    logic [4:0]Y;

    //field macro+class registertion
`uvm_object_utils_begin(adder_transaction)
    `uvm_field_int(A,UVM_DEFAULT);
    `uvm_field_int(B,UVM_DEFAULT);
    `uvm_field_int(Y,UVM_DEFAULT);
    `uvm_object_utils_end    
    //constructr
    function new(string name="adder_transaction");
     super.new(name);
    endfunction

endclass

`endif // End of include guard
