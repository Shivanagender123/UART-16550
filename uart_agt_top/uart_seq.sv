class uart_seq extends uvm_sequence #(uart_xtn);

`uvm_object_utils(uart_seq); 



extern function new(string name="uart_seq");
endclass

function uart_seq::new(string name="uart_Seq");
super.new(name);
endfunction

class uart_seq1 extends uart_seq;
`uvm_object_utils(uart_seq1); 


extern task body;
extern function new(string name="uart_seq1");
endclass

function uart_seq1::new(string name="uart_Seq1");
super.new(name);
endfunction

task uart_seq1::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==28;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);

endtask

class uart_seq2 extends uart_seq;
`uvm_object_utils(uart_seq2); 


extern task body;
extern function new(string name="uart_seq1");
endclass

function uart_seq2::new(string name="uart_Seq1");
super.new(name);
endfunction

task uart_seq2::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
endtask
//////////////////////////////////////////////////////////////BREAK INTERRUPT////////////////////////////////////////////////////////////////
class uart_seq3 extends uart_seq;
`uvm_object_utils(uart_seq3); 


extern task body;
extern function new(string name="uart_seq3");
endclass

function uart_seq3::new(string name="uart_Seq3");
super.new(name);
endfunction


task uart_seq3::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==28;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0100_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask

class uart_seq4 extends uart_seq;
`uvm_object_utils(uart_seq4); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq4::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq4::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0100_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask


//////////////////////////////////////////////////////PARITY ERROR/////////////////////////////////////////////////////////////
class uart_seq5 extends uart_seq;
`uvm_object_utils(uart_seq5); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq5::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq5::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_1011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;$countones(wb_dat_i)%2==0;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask


class uart_seq6 extends uart_seq;
`uvm_object_utils(uart_seq6); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq6::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq6::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_1011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0001_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;$countones(wb_dat_i)%2==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask

///////////////////////////////////////////////////////OVER RUN//////////////////////////////////////////////////////////////

	
class uart_seq7 extends uart_seq;
`uvm_object_utils(uart_seq7); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq7::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq7::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b1100_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	repeat(20)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);
	end

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask


class uart_seq8 extends uart_seq;
`uvm_object_utils(uart_seq8); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq8::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq8::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0001_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0101;wb_we_i==1;});
	finish_item(req);

	repeat(20)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;});
	finish_item(req);
	end
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask

////////////////////////////////////////////////////////THR EMPTY INTERRUPT//////////////////////////////////////////////////
class uart_seq9 extends uart_seq;
`uvm_object_utils(uart_seq9); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq9::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq9::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0111;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;$countones(wb_dat_i)%2==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b001)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask


class uart_seq10 extends uart_seq;
`uvm_object_utils(uart_seq10); 


extern task body;
extern function new(string name="uart_seq4");
endclass

function uart_seq10::new(string name="uart_Seq4");
super.new(name);
endfunction

task uart_seq10::body;
	req=uart_xtn::type_id::create("req");
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b1000_0000;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_dat_i==14;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==3;wb_dat_i==8'b0000_0011;wb_we_i==1;});
	finish_item(req);
	
	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_dat_i==8'b0000_0110;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==1;wb_dat_i==8'b0000_0111;wb_we_i==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==1;$countones(wb_dat_i)%2==1;});
	finish_item(req);

	start_item(req);
	assert(req.randomize with {wb_addr_i==2;wb_we_i==0;});
	finish_item(req);

	get_response(req);
	if(req.iir[3:1]==3'b010)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==0;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b011)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
	if(req.iir[3:1]==3'b001)
	begin
	start_item(req);
	assert(req.randomize with {wb_addr_i==5;wb_we_i==0;});
	finish_item(req);
	end
endtask


