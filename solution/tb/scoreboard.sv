class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_tlm_analysis_fifo #(wr_xtn)fifo_wrh[];
wr_xtn wr_data;
env_config m_cfg;
extern function new(string name="scoreboard",uvm_component parent=null);
extern function void build_phase(uvm_phase phase);
//extern task run_phase(uvm_phase phase);

endclass

function scoreboard::new(string name="scoreboard",uvm_component parent);
 super.new(name,parent);

endfunction


	function void scoreboard::build_phase(uvm_phase phase);
	// get the config object using uvm_config_db 
	  if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
				fifo_wrh=new[m_cfg.no_of_wr_agents];
					
foreach(fifo_wrh[i])
            begin
        fifo_wrh[i]=new($sformatf("fifo_wrh[%0d]*",i),this);  end 
          
endfunction



/*


task scoreboard::run_phase(uvm_phase phase);
        fork
 begin


forever
    begin
         fifo_wrh.get(wr_data);
        end
end

      join
endtask
*/
