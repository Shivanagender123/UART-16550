
class vbase_seq extends uvm_sequence #(uvm_sequence_item);

	
  // Factory registration
	`uvm_object_utils(vbase_seq) 

///////////handles 
         wr_sequencer wr_seqrh[];
   	         virtual_sequencer vsqrh;
		env_config m_cfg;


  // Declare dynamic array of Handles for all the sequences
	wr_seq1  wseq;
         wr_seq2 wseq1;
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
  wr_seqrh = new[m_cfg.no_of_wr_agents];
  
  
  assert($cast(vsqrh,m_sequencer)) else begin
    `uvm_error("BODY", "Error in $cast of virtual sequencer")
  end

 foreach(wr_seqrh[i])
  wr_seqrh[i] = vsqrh.wr_seqrh[i];
endtask: body



	class vseq extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq)

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq::new(string name ="vseq");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq::body();
                 super.body();
            	                 	wseq=wr_seq1::type_id::create("wseq");
					  wseq1=wr_seq2::type_id::create("wseq1");	
	  
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                	                    	wseq.start(wr_seqrh[0]);
  						wseq1.start(wr_seqrh[1]);
						end
                
   

       endtask


   






