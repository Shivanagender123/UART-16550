
class wr_xtn extends uvm_sequence_item;
`uvm_object_utils(wr_xtn)


rand logic [4:0] wb_addr_i;
 rand logic [7:0] wb_dat_i;
 rand logic wb_we_i;
 rand logic wb_stb_i;
 rand logic wb_cyc_i;
  rand logic wb_sel_i;
   logic wb_rst_i;

///////////////////////INTERNAL_REGISTERS///////////////////////////////////


     
bit [7:0] 								ier;///////////////////////INTERRUPT_ENABLE_REGISTER
bit [7:0] 								iir;////////////////////INTERUPT IDENTIFICATION REGISTER
bit [7:0] 								fcr;///////////////////////FIFO_CONTROL_REGISTER
bit [7:0] 								mcr;/////////////////MODEM_CONTROL_REGISTER
bit [7:0] 								lcr;//////////////////////////////LINE_CONTROL_REGISTER
bit [7:0] 								msr;//////////////////////////MODEM_STATUS_REGISTER
       bit[7:0]                                                             thr[$];///TRANSMITTER HOLDING REGISTER
bit [7:0]    								dlv;/////////////DLV REGISTER
bit [7:0]                                                                          rb;
bit [7:0]                                                                          lsr;
//bit [7:0] msr;
 bit[7:0]                                                                               dlb1;
bit[7:0]                                                                                  dlb2;

/////////////////////////////CONSTRAINTS//////////////////////////////////////////////





/////////////////METHODS/////////////////////////////////////////////

extern function new(string name="wr_xtn");
extern  function void do_print(uvm_printer printer);
endclass

/////////////////FUNCTION_NEW////////////////////////////////////////
function wr_xtn::new(string name="wr_xtn");
super.new(name);
endfunction


//////////////////////DO_PRINT///////////////////////////////////
  function  void wr_xtn::do_print (uvm_printer printer);
    super.do_print(printer);

   
      printer.print_field( "wb_dat_i", 		this.wb_dat_i, 	    64,		 UVM_DEC);
       printer.print_field( "wb_addr_i", 		this.wb_addr_i, 	    12,		 UVM_DEC);
  printer.print_field( "wb_stb_i", 		this.wb_stb_i, 	    12,		 UVM_DEC);
  printer.print_field( "wb_we_i", 		this.wb_we_i, 	    12,		 UVM_DEC);
     printer.print_field( "wb_rst_i", 		this.wb_rst_i, 	    12,		 UVM_DEC);
     printer.print_field( "wb_cyc_i", 		this.wb_cyc_i, 	    12,		 UVM_DEC);
     printer.print_field( "lcr", 		this.lcr, 	    64,		 UVM_DEC);
     printer.print_field( "fcr", 		this.fcr, 	    12,		 UVM_DEC);
   printer.print_field( "rb", 		this.rb, 	    12,		 UVM_DEC);
 printer.print_field( "lsr", 		this.lsr, 	    12,		 UVM_DEC);

printer.print_field( "mcr", 		this.mcr, 	    12,		 UVM_DEC);

printer.print_field( "iir", 		this.iir, 	    12,		 UVM_DEC);

printer.print_field( "ier", 		this.ier, 	    12,		 UVM_DEC);




printer.print_field( "msr", 		this.msr, 	    12,		 UVM_DEC);


printer.print_field( "dlb1", 		this.dlb1, 	    12,		 UVM_DEC);

printer.print_field( "dlb2", 		this.dlb2, 	    12,		 UVM_DEC);

foreach(thr[i])
  begin
printer.print_field($sformatf("thr[%0d]",i),		this.thr[i], 	    12,		 UVM_DEC);
end

     endfunction

