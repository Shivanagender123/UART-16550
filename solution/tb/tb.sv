
class tb extends uvm_env;
`uvm_component_utils(tb);
wr_agent_top wr_top;
env_config m_cfg;
virtual_sequencer vseqrh;
scoreboard sb;

extern function new(string name="tb",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass
//////////////////////////////////NEW_PHASE//////////////////////////////////////////////////////////////////

function tb::new(string name="tb",uvm_component parent);
  super.new(name,parent);
endfunction

//////////////////////////////////BUILD_PHASE//////////////////////////////////////////////////////////
function void tb::build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 

if(m_cfg.has_wr_agent)
      
     wr_top=wr_agent_top::type_id::create("wr_top",this);



if(m_cfg.has_virtual_sequencer)
vseqrh=virtual_sequencer::type_id::create("vseqrh",this);



if(m_cfg.has_scoreboard)
sb=scoreboard::type_id::create("sb",this);
        endfunction


/////////////////////////////connect_phase/////////////////////////////////////




   		function void tb::connect_phase(uvm_phase phase);
                     if(m_cfg.has_virtual_sequencer) begin
                        if(m_cfg.has_wr_agent)
			begin
           		
                          	for(int i=0; i<m_cfg.no_of_wr_agents;i++)

		                       vseqrh.wr_seqrh[i] = wr_top.agent[i].m_sequencer;
			end
                                            end


                  if(m_cfg.has_scoreboard) begin
    		 if(m_cfg.has_wr_agent)
			begin
                                 	for(int i=0; i<m_cfg.no_of_wr_agents;i++)

		                     wr_top.agent[i].monh.monitor_port.connect(sb.fifo_wrh[i].analysis_export);
			end
                      			end
                                 


					      
			endfunction



