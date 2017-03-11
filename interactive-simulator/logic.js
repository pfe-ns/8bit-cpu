var RAM = [];
var reg_A; 
var reg_B; 
var reg_C;
var BUS;
var Program_Counter=0;
reg_A = 0;
reg_B = 0;
reg_C = 0;


function add(){
	reg_C = parseInt(reg_A) + parseInt(reg_B);
	return parseInt(reg_A) + parseInt(reg_B);
}

function sub(){
	reg_C = parseInt(reg_A) - parseInt(reg_B);
	return parseInt(reg_A) - parseInt(reg_B);
}

function loda(x){
	reg_A = x;
}

function lodb(x){
	reg_B = x;
}

function reada(){
	BUS = parseInt(reg_A);
	return BUS;
}

function readb(){
	BUS = parseInt(reg_B);
	return BUS;
}

function jmp(x){
	Program_Counter = x;
}


function parse (instruction,operand){


		if(instruction == "LODA"){
			loda(operand);
		}else if(instruction == "LODB"){
			lodb(operand);
		}else if(instruction == "ADD"){
			add();
		}else if(instruction == "SUB"){
			sub();
		}else if(instruction == "READA"){
			reada();
		}else if(instruction == "READB"){
			readb();
		}else if(instruction == "JMP"){
			jmp(operand);
		}

		Program_Counter += 1;
}



