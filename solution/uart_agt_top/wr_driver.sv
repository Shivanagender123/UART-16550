class wr_driver extends uvm_driver #(wr_xtn);

`uvm_component_utils(wr_driver)
virtual uart_if.WR_DR vif;
wr_agent_config m_cfg;
extern function new(string name="wr_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
  extern task send_to_dut(wr_xtn xtn);
  extern task run_phase(uvm_phase phase);


endclass
//////////////////////////////////////CONSTUCTOR/////////////////////////////////////////////////
function wr_driver::new(string name="wr_driver",uvm_component parent);
  super.new(name,parent);
endfunction

///////////////////////////BUILD_PHASE////////////////////////////////////////////////////
function void wr_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db #(wr_agent_config)::get(this,"","wr_agent_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
   super.build();
        super.build_phase(phase);
        endfunction


////// ///////////////////////CONNECT_PHASE////////////////////////////////////////////////////////
function void wr_driver::connect_phase(uvm_phase phase);
 vif=m_cfg.vif;
endfunction


///////////////////////////START_OF_SIMULATION_PHASE//////////////////////////////////////////////////////////

function void wr_driver::start_of_simulation_phase(uvm_phase phase);
       uvm_top.print_topology;
endfunction

///////////////////////////////////////SEND_TO_DUT//////////////////////////////////////////////////////////////

 task wr_driver::send_to_dut(wr_xtn xtn);
   `uvm_info("WR_DRIVER",$sformatf("printing from write driver \n %s", xtn.sprint()),UVM_LOW) 

         @(vif.wr_cb);                 
  vif.wr_cb.wb_addr_i<=xtn.wb_addr_i;
   vif.wr_cb.wb_dat_i<=xtn.wb_dat_i;
    vif.wr_cb.wb_sel_i<=xtn.wb_sel_i;
     vif.wr_cb.wb_we_i<=xtn.wb_we_i;
        vif.wr_cb.wb_stb_i<=1'b1;
   vif.wr_cb.wb_cyc_i<=1'b1;
wait(vif.wr_cb.wb_ack_o)
  vif.wr_cb.wb_stb_i<=1'b0;
   vif.wr_cb.wb_cyc_i<=1'b0;
 @(vif.wr_cb);
if(xtn.wb_addr_i==2 && xtn.wb_we_i==1)
   wait(vif.wr_cb.int_o)
       xtn.iir=vif.wr_cb.wb_dat_o;
        seq_item_port.put_response(xtn);
        


    endtask






///////////////////////////////////RUN_PHASE//////////////////////////////////////////////////////////////
task wr_driver::run_phase(uvm_phase phase);
        @(vif.wr_cb);
      vif.wr_cb.wb_rst_i<=1'b1;
        @(vif.wr_cb);
     vif.wr_cb.wb_rst_i<=1'b0;
    @(vif.wr_cb);


       forever
            begin
              seq_item_port.get_next_item(req);
                    send_to_dut(req);
        seq_item_port.item_done;
               end

       
  `uvm_info("WR_DRIVER",$sformatf("printing from write driver \n %s", req.sprint()),UVM_LOW) 
   req.print();
           endtask
