class uart_sequencer extends uvm_sequencer#(uart_xtn);
	`uvm_component_utils(uart_sequencer)
extern function new(string name="uart_sequencer",uvm_component parent);

endclass

function uart_sequencer::new(string name="uart_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction 

