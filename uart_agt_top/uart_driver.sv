class uart_driver extends uvm_driver #(uart_xtn);

`uvm_component_utils(uart_driver)
virtual uart_if.WR_DR vif;
uart_agent_config m_cfg;
extern function new(string name="uart_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
 extern task send_to_dut(uart_xtn xtn);
 extern task run_phase(uvm_phase phase);

endclass
//////////////////////////////////////CONSTUCTOR/////////////////////////////////////////////////
function uart_driver::new(string name="uart_driver",uvm_component parent);
  super.new(name,parent);
endfunction

///////////////////////////BUILD_PHASE////////////////////////////////////////////////////
function void uart_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db #(uart_agent_config)::get(this,"","uart_agent_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
   super.build();
        super.build_phase(phase);
        endfunction


////// ///////////////////////CONNECT_PHASE////////////////////////////////////////////////////////
function void uart_driver::connect_phase(uvm_phase phase);
 vif=m_cfg.vif;
endfunction

//////////////////////////////RUN PHASE//////////////////////////////////////////////

task uart_driver::run_phase(uvm_phase phase);
	@(vif.uart_cb);
	vif.uart_cb.wb_rst_i<=1;
	@(vif.uart_cb);
	vif.uart_cb.wb_rst_i<=0;
	forever begin
	seq_item_port.get_next_item(req);
	send_to_dut(req);
	seq_item_port.item_done;
	end
endtask
//////////////////////////////////SENT_TO_DUT///////////////////////////////////////////////////////////

task uart_driver::send_to_dut(uart_xtn xtn);
	@(vif.uart_cb);
	vif.uart_cb.wb_addr_i<=xtn.wb_addr_i;
	vif.uart_cb.wb_dat_i<=xtn.wb_dat_i;
	vif.uart_cb.wb_stb_i<=1;
	vif.uart_cb.wb_cyc_i<=1;
	vif.uart_cb.wb_sel_i<=1;
	vif.uart_cb.wb_we_i<=xtn.wb_we_i;
	wait(vif.uart_cb.wb_ack_o)
	vif.uart_cb.wb_cyc_i<=0;
	vif.uart_cb.wb_stb_i<=0;
//	@(vif.uart_cb);
	if(xtn.wb_addr_i==2 && xtn.wb_we_i==0)
	begin
	wait(vif.uart_cb.int_o);
	@(vif.uart_cb);
	@(vif.uart_cb);
	xtn.iir=vif.uart_cb.wb_dat_o;
	$display("iir %b",xtn.iir);
	seq_item_port.put_response(xtn);
	end
	
endtask

