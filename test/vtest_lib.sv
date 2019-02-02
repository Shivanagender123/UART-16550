	class base_test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(base_test)

  
         // Handles 
    		 tb envh;
        	 env_config m_tb_cfg;
        	uart_agent_config m_uart_cfg[];
		           
       		  int has_uart_agent = 1;
	         int no_of_uart_agents=2;
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
 	   if (has_uart_agent) begin
            m_uart_cfg=new[no_of_uart_agents];
		foreach(m_uart_cfg[i])
		begin
                      m_uart_cfg[i]=uart_agent_config::type_id::create($sformatf("m_uart_cfg[%0d]",i));


         	 if(!uvm_config_db #(virtual uart_if)::get(this,"",$sformatf("vif_%0d",i),m_uart_cfg[i].vif))
		`uvm_fatal("VIF CONFIG","cannot get()interface vif from uvm_config_db. Have you set() it?")
             m_uart_cfg[i].is_active = UVM_ACTIVE;

	                m_tb_cfg.m_uart_agent_cfg[i] = m_uart_cfg[i];
                
                end 
             end

//----------------------------------------------------------------------------------------------------------//
		
			                  m_tb_cfg.has_uart_agent = has_uart_agent;
                                   		endfunction

	function void base_test::build_phase(uvm_phase phase);
                // create the config object using uvm_config_db 
	        m_tb_cfg=env_config::type_id::create("m_tb_cfg");
              if(has_uart_agent)
     m_tb_cfg.m_uart_agent_cfg=new[no_of_uart_agents];
                     // Call function 
                config_uart(); 
	uvm_config_db #(env_config)::set(this,"*","env_config",m_tb_cfg);
		// call super.build()
     		super.build();
		// create the instance for ram_envh handle
		envh=tb::type_id::create("envh", this);
			endfunction

class test1 extends base_test;
`uvm_component_utils(test1)
vseq1 vs1;
extern function new(string name="test1",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function test1::new(string name="test1",uvm_component parent);
	super.new(name,parent);
endfunction

function void test1::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task test1::run_phase(uvm_phase phase);
phase.raise_objection(this);
vs1=vseq1::type_id::create("virtual_seq");
vs1.start(envh.vseqrh);
phase.drop_objection(this);
endtask

class test2 extends base_test;
`uvm_component_utils(test2)
vseq2 vs2;
extern function new(string name="test2",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function test2::new(string name="test2",uvm_component parent);
	super.new(name,parent);
endfunction

function void test2::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task test2::run_phase(uvm_phase phase);
phase.raise_objection(this);
vs2=vseq2::type_id::create("virtual_seq");
vs2.start(envh.vseqrh);
phase.drop_objection(this);
endtask

class test3 extends base_test;
`uvm_component_utils(test3)
vseq3 vs3;
extern function new(string name="test3",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function test3::new(string name="test3",uvm_component parent);
	super.new(name,parent);
endfunction

function void test3::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task test3::run_phase(uvm_phase phase);
phase.raise_objection(this);
vs3=vseq3::type_id::create("virtual_seq");
vs3.start(envh.vseqrh);
phase.drop_objection(this);
endtask

class test4 extends base_test;
`uvm_component_utils(test4)
vseq4 vs4;
extern function new(string name="test4",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function test4::new(string name="test4",uvm_component parent);
	super.new(name,parent);
endfunction

function void test4::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task test4::run_phase(uvm_phase phase);
phase.raise_objection(this);
vs4=vseq4::type_id::create("virtual_seq");
vs4.start(envh.vseqrh);
phase.drop_objection(this);
endtask

class test5 extends base_test;
`uvm_component_utils(test5)
vseq5 vs5;
extern function new(string name="test5",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

endclass

function test5::new(string name="test5",uvm_component parent);
	super.new(name,parent);
endfunction

function void test5::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task test5::run_phase(uvm_phase phase);
phase.raise_objection(this);
vs5=vseq5::type_id::create("virtual_seq");
vs5.start(envh.vseqrh);
phase.drop_objection(this);
endtask

