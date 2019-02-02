
class vbase_seq extends uvm_sequence #(uvm_sequence_item);

	
  // Factory registration
	`uvm_object_utils(vbase_seq) 

///////////handles 
         uart_sequencer uart_seqrh[];
   	         virtual_sequencer vsqrh;
		env_config m_cfg;


  // Declare dynamic array of Handles for all the sequences
	//uart_seq1  wseq;
         //uart_seq2 wseq1;
     	extern function new(string name ="vbase_seq");
	extern task body();
	endclass 
//-----------------  constructor new method  -------------------//

 
	function vbase_seq::new(string name ="vbase_seq");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//
 


task vbase_seq::body();
// get the config object env_config from database using uvm_config_db 
	  if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")

// initialize the dynamic arrays for write & read sequencers 
  uart_seqrh = new[m_cfg.no_of_uart_agents];
  
  
  assert($cast(vsqrh,m_sequencer)) else begin
    `uvm_error("BODY", "Error in $cast of virtual sequencer")
  end

 foreach(uart_seqrh[i])
  uart_seqrh[i] = vsqrh.uart_seqrh[i];
endtask: body



class vseq1 extends vbase_seq;
`uvm_object_utils(vseq1)

uart_seq1 seq1;
uart_seq2 seq2;

extern function new(string name ="vbase_seq");
extern task body();

endclass 
//-----------------  constructor new method  -------------------//

 
function vseq1::new(string name ="vbase_seq");
	super.new(name);
endfunction

task vseq1::body;
	super.body;
	seq1=uart_seq1::type_id::create("seq1");
	seq2=uart_seq2::type_id::create("seq2");
	fork
	seq1.start(uart_seqrh[0]);
	seq2.start(uart_seqrh[1]);
	join
endtask
	

class vseq2 extends vbase_seq;
`uvm_object_utils(vseq2)

uart_seq3 seq3;
uart_seq4 seq4;

extern function new(string name ="vbase_seq");
extern task body();

endclass 
//-----------------  constructor new method  -------------------//

 
function vseq2::new(string name ="vbase_seq");
	super.new(name);
endfunction

task vseq2::body;
	super.body;
	seq3=uart_seq3::type_id::create("seq3");
	seq4=uart_seq4::type_id::create("seq4");
	fork
	seq3.start(uart_seqrh[0]);
	seq4.start(uart_seqrh[1]);
	join
endtask
	
class vseq3 extends vbase_seq;
`uvm_object_utils(vseq3)

uart_seq5 seq5;
uart_seq6 seq6;

extern function new(string name ="vbase_seq");
extern task body();

endclass 
//-----------------  constructor new method  -------------------//

 
function vseq3::new(string name ="vbase_seq");
	super.new(name);
endfunction

task vseq3::body;
	super.body;
	seq5=uart_seq5::type_id::create("seq5");
	seq6=uart_seq6::type_id::create("seq6");
	fork
	seq5.start(uart_seqrh[0]);
	seq6.start(uart_seqrh[1]);
	join
endtask
	
class vseq4 extends vbase_seq;
`uvm_object_utils(vseq4)

uart_seq7 seq7;
uart_seq8 seq8;

extern function new(string name ="vbase_seq");
extern task body();

endclass 
//-----------------  constructor new method  -------------------//

 
function vseq4::new(string name ="vbase_seq");
	super.new(name);
endfunction

task vseq4::body;
	super.body;
	seq7=uart_seq7::type_id::create("seq7");
	seq8=uart_seq8::type_id::create("seq8");
	fork
	seq7.start(uart_seqrh[0]);
	seq8.start(uart_seqrh[1]);
	join
endtask
	
class vseq5 extends vbase_seq;
`uvm_object_utils(vseq5)

uart_seq9 seq9;
uart_seq10 seq10;

extern function new(string name ="vbase_seq");
extern task body();

endclass 
//-----------------  constructor new method  -------------------//

 
function vseq5::new(string name ="vbase_seq");
	super.new(name);
endfunction

task vseq5::body;
	super.body;
	seq9=uart_seq9::type_id::create("seq9");
	seq10=uart_seq10::type_id::create("seq10");
	fork
	seq9.start(uart_seqrh[0]);
	seq10.start(uart_seqrh[1]);
	join
endtask
	
