class uart_agent extends  uvm_agent;

`uvm_component_utils(uart_agent)

uart_agent_config m_cfg;
uart_driver drvh;
uart_monitor monh;
uart_sequencer m_sequencer;

extern function new(string name="uart_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass


function uart_agent::new(string name="uart_agent",uvm_component parent);
super.new(name,parent);
endfunction


function void uart_agent::build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(uart_agent_config)::get(this,"","uart_agent_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
       

 drvh=uart_driver::type_id::create("drvh",this);
if(m_cfg.is_active==UVM_ACTIVE)
      monh=uart_monitor::type_id::create("monh",this);
     m_sequencer=uart_sequencer::type_id::create("m_sequencer",this);
endfunction


function void uart_agent::connect_phase(uvm_phase phase);
if(m_cfg.is_active==UVM_ACTIVE)
begin
drvh.seq_item_port.connect(m_sequencer.seq_item_export);
end
endfunction
