import uvm_pkg::*; // Import UVM package
`include "uvm_macros.svh"
`include "test.sv" 
`include "adder.sv" 
`include "adder_interface.sv"

module top();
  adder_interface vif();
   adder dut(.A(vif.A),.B(vif.B),.Y(vif.Y));
initial begin
    uvm_config_db#(virtual adder_interface)::set(null,"*","vif",vif);
   run_test("test");
end

endmodule