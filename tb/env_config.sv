
class env_config extends uvm_object;


// Whether env analysis components are used:
bit has_functional_coverage = 0;
bit has_wagent_functional_coverage = 0;
bit has_scoreboard = 1;
// Whether the various agents are used:
bit has_uart_agent = 1;

// Whether the virtual sequencer is used:
bit has_virtual_sequencer = 1;

int no_of_uart_agents=2;
//dynamicc configh files
                 uart_agent_config m_uart_agent_cfg[];
	
`uvm_object_utils(env_config)




// Standard UVM Methods:
extern function new(string name = "env_config");

endclass
//-----------------  constructor new method  -------------------//

function env_config::new(string name = "env_config");
  super.new(name);
endfunction
