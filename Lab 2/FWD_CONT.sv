//***********************************************************
// ECE 3058 Architecture Concurrency and Energy in Computation
//
// MIPS Processor System Verilog Behavioral Model
//
// School of Electrical & Computer Engineering
// Georgia Institute of Technology
// Atlanta, GA 30332
//
//  Engineer:   Brothers, Tim
//  Module:     SFORWARDING UNIT
//  Functionality:
//      implements the Forwardin unit for the MIPS pipelined processor
//
//  Inputs:
//      ip_opcode: The opcode from the fetch stage
//    
//  Outputs:

//    
//  Version History:
//***********************************************************

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Module Declaration
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

module FWD_CONT(
input logic ip_EX_MEM_RegWrite,  //EX/MEM regwrite
input logic ip_MEM_WB_RegWrite,  //MEM/WB regwrite
input logic [4:0] ip_EX_MEM_dest,//EX/MEM Dest Register
input logic [4:0] ip_MEM_WB_dest,//MEM/WB Dest Register
input logic [4:0] ip_DEC_DEST_RS, //Rs from decode stage
input logic [4:0] ip_DEC_DEST_RT, //Rt from decode stage
output logic  [1:0] op_FA, //select lines for forwarding muxes (Rs)
output logic  [1:0] op_FB,  //select lines for forwarding muxes (Rt)
output logic Stall_Pause_zero,
output logic Stall_Pause_one
);

always @ * begin

	if (ip_EX_MEM_RegWrite && ip_EX_MEM_dest && ip_EX_MEM_dest==ip_DEC_DEST_RS) begin
		assign op_FA=2'b10;
		end
	else if (ip_EX_MEM_RegWrite && ip_MEM_WB_dest && ip_MEM_WB_dest==ip_DEC_DEST_RS) begin
		assign op_FA=2'b01;
		end
	else begin
		assign op_FA=2'b00;
		end
		
end

always @ * begin

	if (ip_EX_MEM_RegWrite && ip_EX_MEM_dest && ip_EX_MEM_dest==ip_DEC_DEST_RT) begin
		assign op_FB=2'b10;
		end
	else if (ip_EX_MEM_RegWrite && ip_MEM_WB_dest && ip_MEM_WB_dest==ip_DEC_DEST_RT) begin
		assign op_FB=2'b01;
		end
	else begin
		assign op_FB=2'b00;
		end	
		
end

	assign Stall_Pause_zero= (op_FA || op_FB) ? 0: 1;
	logic Stall_Pause_one_B;
	logic Stall_Pause_one_A;
	assign Stall_Pause_one_A= op_FA[0]==1;
	assign Stall_Pause_one_B= op_FB[0]==1;
	assign Stall_Pause_one= Stall_Pause_one_A | Stall_Pause_one_B;

endmodule
