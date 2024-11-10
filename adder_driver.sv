
import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 

class adder_driver extends uvm_driver#(adder_transaction);
`uvm_component_utils(adder_driver)

    function new(string name ="adder_driver",uvm_component parent);
super.new(name,parent);
    endfunction

    //adder_transaction req;
    virtual adder_interface vif;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //req=adder_transaction::type_id::create("req");
    if(!uvm_config_db#(virtual adder_interface)::get(this,"","vif",vif))
    `uvm_error(get_type_name(),"unable to access interface")
  endfunction

virtual task run_phase(uvm_phase phase);
forever begin
    seq_item_port.get_next_item(req);
    vif.A<=req.A;
    vif.B<=req.B;

    seq_item_port.item_done();

end

endtask


endclass