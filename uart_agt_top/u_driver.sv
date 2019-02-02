class u_driver extends uvm_driver#(xtn);
	`uvm_component_utils(u_driver)
extern function new(string name="u_driver",uvm_component parent);

endclass

function u_driver::new(string name="u_driver",uvm_component parent);
	super.new(name,parent);
endfunction 

