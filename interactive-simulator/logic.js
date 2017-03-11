var RAM = [];
var reg_A , reg_B , reg_C;
var BUS;
var Program_Counter=0;
reg_A = 0;
reg_B = 0;
reg_C = 0;


function add(reg_A,reg_B){
	reg_C = reg_A + reg_B;
	return reg_A + reg_B;
}

function sub(reg_A , reg_B){
	reg_C = reg_A - reg_B;
	return reg_A - reg_B;
}

function loda(x){
	reg_A = x;
}

function lodb(x){
	reg_B = x;
}

function reada(){
	BUS = reg_A;
	return BUS;
}

function readb(){
	BUS = reg_B;
	return BUS;
}

function jmp(x){
	Program_Counter = x;
}

function add_to_ram(instruction , operand){

	RAM[Program_Counter] = [];
	RAM[Program_Counter][0] = Program_Counter;
	RAM[Program_Counter][1] = instruction;
	RAM[Program_Counter][2] = operand;

}

function parse(instruction,operand){

		add_to_ram(instruction , operand);
		Program_Counter += 1;

		if(instruction = "loda"){
			loda(parseInt(operand));
		}else if(instruction = "lodb"){
			lodb(parseInt(operand));
		}else if(instruction = "add"){
			add(reg_A,reg_B);
		}else if(instruction = "sub"){
			sub(reg_A,reg_B);
		}else if(instruction = "reada"){
			reada();
		}else if(instruction = "readb"){
			readb();
		}else if(instruction = "jmp"){
			jmp(parseInt(operand));
		}

}



