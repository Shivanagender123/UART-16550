///////////////////////////////////////////////////UART_TOP/////////////////////////////////////////////////////////////////////////////////
module top;
       import test_pkg::*;
   	import uvm_pkg::*;
//	import uart_defines.v::*;


/////////////////////////CLOCK_GENERATION////////////////////////////////
			bit clock;
                   bit clock1;    
  always
    
        #10 clock=~clock;
    
always
    //clock1=1'b0;
     
#8 clock1=~clock1;
    

//////////////////////////////////////INSTANTIATE THE TOP OF THE UART//////////////////////////////////////////////////////////////////////////





 uart_top DUT1(.wb_clk_i(clock1),.wb_rst_i(in1.wb_rst_i),.wb_adr_i(in1.wb_addr_i),.wb_dat_i(in1.wb_dat_i),.wb_dat_o(in1.wb_dat_o),.wb_we_i(in1.wb_we_i),.wb_stb_i(in1.wb_stb_i),.wb_cyc_i(in1.wb_cyc_i),.wb_ack_o(in1.wb_ack_o),.wb_sel_i(in1.wb_sel_i),.int_o(in1.int_o),.stx_pad_o(in1.stx_pad_o),.srx_pad_i(in1.srx_pad_i),.rts_pad_o(in1.rts_pad_o),.cts_pad_i(in1.cts_pad_i),.dtr_pad_o(in1.dtr_pad_o),.dsr_pad_i(in1.dsr_pad_i),.ri_pad_i(in1.ri_pad_i),.dcd_pad_i(in1.dcd_pad_i),.baud_o(in1.baud_o));



























 uart_top DUT2(.wb_clk_i(clock),.wb_rst_i(in2.wb_rst_i),.wb_adr_i(in2.wb_addr_i),.wb_dat_i(in2.wb_dat_i),.wb_dat_o(in2.wb_dat_o),.wb_we_i(in2.wb_we_i),.wb_stb_i(in2.wb_stb_i),.wb_cyc_i(in2.wb_cyc_i),.wb_ack_o(in2.wb_ack_o),.wb_sel_i(in2.wb_sel_i),.int_o(in2.int_o),.stx_pad_o(in2.stx_pad_o),.srx_pad_i(in2.srx_pad_i),.rts_pad_o(in2.rts_pad_o),.cts_pad_i(in2.cts_pad_i),.dtr_pad_o(in2.dtr_pad_o),.dsr_pad_i(in2.dsr_pad_i),.ri_pad_i(in2.ri_pad_i),.dcd_pad_i(in2.dcd_pad_i),.baud_o(in2.baud_o));






      
///////////////////CLOCK_FOR_INTERFACE/////////////////////////////////////////////

     uart_if in1(clock);
     uart_if in2(clock1);



///////////////////////////////////////////RUN_TEST//////////////////////////////////////////////////////////////////////////////////////////
initial
begin
	uvm_config_db #(virtual uart_if)::set(null,"*","vif_0",in1);
	uvm_config_db #(virtual uart_if)::set(null,"*","vif_1",in2);

	run_test();
     end
  
endmodule

