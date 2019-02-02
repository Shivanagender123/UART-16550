class u_sequencer extends uvm_sequencer#(xtn);
	`uvm_component_utils(u_sequencer)
extern function new(string name="u_serquencer",uvm_component parent);

endclass

function u_sequencer::new(string name="u_serquencer",uvm_component parent);
	super.new(name,parent);
endfunction 

