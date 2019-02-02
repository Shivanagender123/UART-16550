class uart_monitor extends uvm_monitor;

`uvm_component_utils(uart_monitor)

uvm_analysis_port #(uart_xtn) monitor_port;
 uart_agent_config m_cfg;
   uart_xtn xtn;
    

virtual uart_if.WR_MON vif;

extern function new(string name = "uart_monitor",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void report_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task collect_data();
extern task run_phase(uvm_phase phase);
 
endclass
///////////////////////////////////////////////NEW_CONSTRUCTOR///////////////////////////////////////////////////////////////////////////

function uart_monitor:: new(string name = "uart_monitor",uvm_component parent);
     super.new(name,parent);
		monitor_port=new("monitor_port",this);
endfunction

/////////////////////////////////////////////BUILD_PHASE//////////////////////////////////////////////////////////////////////////////////
function void uart_monitor::build_phase(uvm_phase phase);
                if(!uvm_config_db #(uart_agent_config)::get(this,"","uart_agent_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
 super.build();
        endfunction

//////////////////////////////////CONNECT_PHASE////////////////////////////////////////////////////////////
function void uart_monitor::connect_phase(uvm_phase phase);
vif=m_cfg.vif;
endfunction         
////////////////////////////////////RUN PHASE////////////////////////////////////////////////////////////

task uart_monitor::run_phase(uvm_phase phase);
	xtn=uart_xtn::type_id::create("WR_MONITOR");
	forever collect_data;
endtask

//////////////////////////////////COLLECT_DATA////////////////////////////////////////////////////////
task uart_monitor::collect_data;
	@(vif.uart_mon_cb);
	wait(vif.uart_mon_cb.wb_ack_o)
	xtn.wb_addr_i=vif.uart_mon_cb.wb_addr_i;
	xtn.wb_dat_i=vif.uart_mon_cb.wb_dat_i;
	
	if(vif.uart_mon_cb.wb_addr_i==0 && vif.uart_mon_cb.wb_we_i==1 && xtn.lcr[7]==1 )
		xtn.dlb1=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==1 && vif.uart_mon_cb.wb_we_i==1 && xtn.lcr[7]==1 )
		xtn.dlb2=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==0 && vif.uart_mon_cb.wb_we_i==0 && xtn.lcr[7]==0 )
		xtn.rb.push_back(vif.uart_mon_cb.wb_dat_o);

	if(vif.uart_mon_cb.wb_addr_i==0 && vif.uart_mon_cb.wb_we_i==1 && xtn.lcr[7]==0 )
		xtn.thr.push_back(vif.uart_mon_cb.wb_dat_i);

	if(vif.uart_mon_cb.wb_addr_i==1 && vif.uart_mon_cb.wb_we_i==1 )
		xtn.ier=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==2 && vif.uart_mon_cb.wb_we_i==1 )
		xtn.fcr=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==2 && vif.uart_mon_cb.wb_we_i==0 &&xtn.ier )
		xtn.iir=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==3 && vif.uart_mon_cb.wb_we_i==1 )
		xtn.lcr=vif.uart_mon_cb.wb_dat_i;

	if(vif.uart_mon_cb.wb_addr_i==5 && vif.uart_mon_cb.wb_we_i==0 )
		xtn.lsr=vif.uart_mon_cb.wb_dat_i;

	@(vif.uart_mon_cb);
	xtn.print;
	monitor_port.write(xtn);
endtask

