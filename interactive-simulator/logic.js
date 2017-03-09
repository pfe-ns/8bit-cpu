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



