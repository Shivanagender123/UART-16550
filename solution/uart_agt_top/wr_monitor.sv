class wr_monitor extends uvm_monitor;

`uvm_component_utils(wr_monitor)

uvm_analysis_port #(wr_xtn) monitor_port;
 wr_agent_config m_cfg;
   wr_xtn xtn;
    

virtual uart_if.WR_MON vif;

extern function new(string name = "wr_monitor",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task collect_data();
extern task run_phase(uvm_phase phase);
 
endclass
///////////////////////////////////////////////NEW_CONSTRUCTOR///////////////////////////////////////////////////////////////////////////

function wr_monitor:: new(string name="wr_monitor",uvm_component parent);
     super.new(name,parent);
		monitor_port=new("monitor_port",this);
endfunction

/////////////////////////////////////////////BUILD_PHASE//////////////////////////////////////////////////////////////////////////////////
function void wr_monitor::build_phase(uvm_phase phase);
                if(!uvm_config_db #(wr_agent_config)::get(this,"","wr_agent_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
 super.build();
        endfunction

//////////////////////////////////CONNECT_PHASE////////////////////////////////////////////////////////////
function void wr_monitor::connect_phase(uvm_phase phase);
vif=m_cfg.vif;
endfunction         

////////////////////////////////////////////REPORT_PHASE///////////////////////////////////////////////////////
function void wr_monitor::report_phase(uvm_phase phase);
`uvm_info(get_type_name(), $sformatf("Report: write monitor sent %0d transactions", m_cfg.drv_data_sent_cnt), UVM_LOW)
  endfunction

//////////////////////////////////COLLECT_DATA//////////////////////////////////////////////////////////
  task wr_monitor::collect_data();
                 @(vif.wr_mon_cb);
wait(vif.wr_mon_cb.wb_ack_o);
            //   $display("%d",vif.wr_mon_cb.wb_ack_o); 
xtn.wb_rst_i= vif.wr_mon_cb.wb_rst_i;
xtn.wb_stb_i= vif.wr_mon_cb.wb_stb_i;
xtn.wb_cyc_i=   vif.wr_mon_cb.wb_cyc_i;
xtn.wb_addr_i=vif.wr_mon_cb.wb_addr_i;
xtn.wb_dat_i=vif.wr_mon_cb.wb_dat_i;
xtn.wb_we_i=vif.wr_mon_cb.wb_we_i;

           /* 	if(xtn.wb_addr_i==3 && xtn.wb_we_i==0)
               
   xtn.rb  = vif.wr_mon_cb.wb_dat_i ;

      	if(xtn.wb_addr_i==0 && xtn.wb_we_i==1 && xtn.lcr==1 )
   xtn.dlv = vif.wr_mon_cb.wb_dat_i;*/
             

       if(xtn.wb_addr_i==0 && xtn.wb_we_i==0 && xtn.lcr[7]==0)
          xtn.rb.push_back(vif.wr_mon_cb.wb_dat_o);

              if(xtn.wb_addr_i==0 && xtn.wb_we_i==1 && xtn.lcr[7]==0)
               xtn.thr.push_back(vif.wr_mon_cb.wb_dat_i);

       if(xtn.wb_addr_i==1 && xtn.wb_we_i==1 )
           xtn.ier=vif.wr_mon_cb.wb_dat_i;

       if(xtn.wb_addr_i==2 && xtn.wb_we_i==0 )
           xtn.iir=vif.wr_mon_cb.wb_dat_i;

       if(xtn.wb_addr_i==2 && xtn.wb_we_i==1 )
           xtn.fcr=vif.wr_mon_cb.wb_dat_i;

       if(xtn.wb_addr_i==3 && xtn.wb_we_i==1 )
           xtn.lcr=vif.wr_mon_cb.wb_dat_i;

       if(xtn.wb_addr_i==4 && xtn.wb_we_i==1)
           xtn.mcr=vif.wr_mon_cb.wb_dat_i;

       if(xtn.wb_addr_i==5 && xtn.wb_we_i==0)
           xtn.lsr=vif.wr_mon_cb.wb_dat_i;

      if(xtn.wb_addr_i==6 && xtn.wb_we_i==1)
          xtn.msr=vif.wr_mon_cb.wb_dat_i;

      if(xtn.wb_addr_i==0 && xtn.wb_we_i==1 && xtn.lcr[7]==1)
           xtn.dlb1=vif.wr_mon_cb.wb_dat_i;

      if(xtn.wb_addr_i==1 && xtn.wb_we_i==1 && xtn.lcr[7]==1)
           xtn.dlb2=vif.wr_mon_cb.wb_dat_i;



  `uvm_info("WR_MONITOR",$sformatf("printing from write monitor \n %s", xtn.sprint()),UVM_LOW) 


  	monitor_port.write(xtn);


endtask



task wr_monitor::run_phase(uvm_phase phase);
   xtn=wr_xtn::type_id::create("xtn");
     
 
forever
     begin
 collect_data();
  end
     endtask

