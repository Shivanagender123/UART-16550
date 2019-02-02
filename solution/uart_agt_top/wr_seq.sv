class wr_seq extends uvm_sequence #(wr_xtn);

`uvm_object_utils(wr_seq); 



extern function new(string name="wr_seq");
endclass

function wr_seq::new(string name="wr_Seq");
super.new(name);
endfunction



class wr_seq1 extends wr_seq;
`uvm_object_utils(wr_seq1); 


extern function new(string name="wr_seq1");
extern task body();

endclass

function wr_seq1::new(string name="wr_seq1");
super.new(name);
endfunction

	task wr_seq1::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   

//////////////////////////////////////PASS THE DLV VALUE ////////////////////////////////////////////////////////////////////
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==56 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////DIVISOR LATCH BYTE ADDR==0///////////////////////////////////////////////////    

	   start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i[7]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i[1:0]==2'b11 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i[7:6]==2'b00 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[2]==1'b1 ; wb_dat_i[0]==1'b1;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
    	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1; wb_dat_i==36 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1; wb_dat_i==42 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    get_response(req);
    
   if(req.iir)
     $display("the value stored in iir is %d",req.iir);
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0; wb_dat_i==84 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	



		end
    	
    endtask
///////////////////////////////////INTERUUPT IDENTIFICATIOBN REGISTER/////////////////////////////////////
           



class wr_seq2 extends wr_seq;
`uvm_object_utils(wr_seq2); 


extern function new(string name="wr_seq2");
extern task body();

endclass

function wr_seq2::new(string name="wr_seq2");
super.new(name);
endfunction

	task wr_seq2::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   

//////////////////////////////////////PASS THE DLV VALUE ////////////////////////////////////////////////////////////////////
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==64;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////DIVISOR LATCH BYTE ADDR==0///////////////////////////////////////////////////    

	   start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i[7]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i[1:0]==2'b11 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i[7:6]==2'b00 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[2]==1'b1 ; wb_dat_i[0]==1'b1;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
    	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1; wb_dat_i==36 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
    get_response(req);
   if(req.iir[3:1]==010)
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

		end
    	
    endtask
             
