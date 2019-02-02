class wr_agent_config extends uvm_object;


// UVM Factory Registration Macro
`uvm_object_utils(wr_agent_config)


 
virtual uart_if vif;

//------------------------------------------
// Data Members
//------------------------------------------

uvm_active_passive_enum is_active = UVM_ACTIVE;

static int mon_rcvd_xtn_cnt = 0;


static int drv_data_sent_cnt = 0;



extern function new(string name = "wr_agent_config");

endclass 
//-----------------  constructor new method  -------------------//

function wr_agent_config::new(string name = "wr_agent_config");
  super.new(name);
endfunction


