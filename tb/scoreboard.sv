class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_tlm_analysis_fifo #(uart_xtn)fifo_wrh[];
uart_xtn uart_data1,uart_data2;
env_config m_cfg;
extern function new(string name="scoreboard",uvm_component parent=null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
endclass

function scoreboard::new(string name="scoreboard",uvm_component parent);
 super.new(name,parent);

endfunction


	function void scoreboard::build_phase(uvm_phase phase);
	// get the config object using uvm_config_db 
	  if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
				fifo_wrh=new[m_cfg.no_of_uart_agents];
					
foreach(fifo_wrh[i])
            begin
        fifo_wrh[i]=new($sformatf("fifo_wrh[%0d]*",i),this);  end 
         
endfunction

task scoreboard::run_phase (uvm_phase phase);
	fork
		forever fifo_wrh[0].get(uart_data1);
		forever fifo_wrh[1].get(uart_data2);
	join
endtask

function void scoreboard::check_phase(uvm_phase phase);
	foreach(uart_data1.thr[i]) 
		begin
		if(uart_data1.thr[i]!=uart_data2.rb[i])
			`uvm_fatal("SB","uart1 data mismatch")
		end
	foreach(uart_data2.thr[i]) 
		begin
		if(uart_data2.thr[i]!=uart_data1.rb[i])
			`uvm_fatal("SB","uart2 data mismatch")
		end
	$display("***************************uart1 and uart2 data match****************************");
endfunction


