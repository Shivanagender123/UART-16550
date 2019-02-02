package test_pkg;


//import uvm_pkg.sv
	import uvm_pkg::*;
//include uvm_macros.sv
	`include "uvm_macros.svh"

`include "wr_xtn.sv"
`include "wr_agent_config.sv"
`include "env_config.sv"
`include "wr_driver.sv"
`include "wr_monitor.sv"
`include "wr_sequencer.sv"
`include "wr_agent.sv"
`include "wr_agent_top.sv"
`include "wr_seq.sv"

`include "virtual_sequencer.sv"
`include "virtual_seq.sv"
`include "scoreboard.sv"

`include "tb.sv"


`include "vtest_lib.sv"
endpackage
