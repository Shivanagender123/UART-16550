	class base_test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(base_test)

  
         // Handles 
    		 tb envh;
        	 env_config m_tb_cfg;
        	wr_agent_config m_wr_cfg[];
		           
       		  int has_wr_agent = 1;
	         int no_of_wr_agents=2;
//////////////////////////////////  Standard UVM Methods: /////////////////////////////////////////////////////////////////

	extern function new(string name = "base_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void config_uart();
        
        endclass
        
////////////////////////////////////// constructor new method  //////////////////////////////////////////////////////

   	function base_test::new(string name = "base_test", uvm_component parent);
		super.new(name,parent);
	 endfunction
//----------------- function config_ram()  -------------------//

	function void base_test::config_uart();
 	   if (has_wr_agent) begin
            m_wr_cfg=new[no_of_wr_agents];
		foreach(m_wr_cfg[i])
		begin
                      m_wr_cfg[i]=wr_agent_config::type_id::create($sformatf("m_wr_cfg[%0d]",i));


         	 if(!uvm_config_db #(virtual uart_if)::get(this,"",$sformatf("vif_%0d",i),m_wr_cfg[i].vif))
		`uvm_fatal("VIF CONFIG","cannot get()interface vif from uvm_config_db. Have you set() it?")
             m_wr_cfg[i].is_active = UVM_ACTIVE;

	                m_tb_cfg.m_wr_agent_cfg[i] = m_wr_cfg[i];
                
                end 
             end

//----------------------------------------------------------------------------------------------------------//
		
			                  m_tb_cfg.has_wr_agent = has_wr_agent;
                                   		endfunction

	function void base_test::build_phase(uvm_phase phase);
                // create the config object using uvm_config_db 
	        m_tb_cfg=env_config::type_id::create("m_tb_cfg");
              if(has_wr_agent)
     m_tb_cfg.m_wr_agent_cfg=new[no_of_wr_agents];
                     // Call function 
                config_uart(); 
	uvm_config_db #(env_config)::set(this,"*","env_config",m_tb_cfg);
		// call super.build()
     		super.build();
		// create the instance for ram_envh handle
		envh=tb::type_id::create("envh", this);
			endfunction


	class uart_test extends base_test;

  
   // Factory Registration
	`uvm_component_utils(uart_test)

   // Declare the handle for  ram_single_vseq virtual sequence
         vseq seqh;
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "uart_test" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function uart_test::new(string name = "uart_test" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void uart_test::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task uart_test::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh=vseq::type_id::create("seqh");
 //start the sequence wrt virtual sequencer
          seqh.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   

