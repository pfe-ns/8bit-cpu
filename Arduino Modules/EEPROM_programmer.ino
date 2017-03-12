//
//  EEPROM_programmer.ino
//  EEPROM Programmer
//
//  Created by Lazar Djurovic on 3/12/17.

/*
  
Mode  CE  OE  WE  I/O 
Read  VIL VIL VIH DOUT
Write VIL VIH VIL DIN
 
 */

#include <StackArray.h>

#define WE 0
#define OE 1

StackArray<int> s;
                 
void toBinary(int num){
    
    int rem;
    int brojac=0;
    
    while (num != 0)
    {
        rem = num % 2;
        num /= 2;
        s.push(rem);
        brojac++;
    }
    
    for(int i = 1 ; i<= 8-brojac;i++){
        s.push(0);
    }
    
}

byte data[] = {0x0F, 0xAA, 0xE};

int size(byte data[]){

     return sizeof(data)/sizeof(byte);
    
}

void setup() {

  Serial.begin(9600); 
  pinMode(WE,OUTPUT);
  pinMode(OE,OUTPUT);

  pinMode(2,OUTPUT); // DATA 0
  pinMode(3,OUTPUT); // DATA 1
  pinMode(4,OUTPUT); // DATA 2
  pinMode(5,OUTPUT); // DATA 3
  pinMode(6,OUTPUT); // DATA 4
  pinMode(7,OUTPUT); // DATA 5
  pinMode(8,OUTPUT); // DATA 6
  pinMode(9,OUTPUT); // DATA 7
  
  

}

void loop() {
  

}
