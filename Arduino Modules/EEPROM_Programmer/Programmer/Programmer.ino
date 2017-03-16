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
#include <stdio.h>

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

void writeByte(int data){

    int pin,a;
        
    toBinary(data);
    pin = 10;

    while(!s.isEmpty())
    {
        int a = s.pop();
        if(pin<=13)
        {
            if(a==1)
            {
                digitalWrite(pin,HIGH);
            }
        }
        else
        {

            if(pin == 14)
            {
                if(a==1)
                {
                    analogWrite(A0,255);
                }
                else
                {
                    analogWrite(A0,0);
                }
            }
            else if(pin == 15)
            {
                if(a==1)
                {
                    analogWrite(A1,255);
                }
                else
                {
                    analogWrite(A1,0);
                }

            }
            else if(pin == 16)
            {
                if(a==1)
                {
                    analogWrite(A2,255);
                }
                else
                {
                    analogWrite(A2,0);
                }
            }
            else if(pin == 17)
            {
                if(a==1)
                {
                    analogWrite(A3,255);
                }
                else
                {
                    analogWrite(A3,0);
                }

            }

        }
        pin++;
    }
    pin=10;

    digitalWrite(OE,HIGH);
    digitalWrite(WE,LOW);
    delay(10);
    digitalWrite(OE,LOW);
    digitalWrite(WE,HIGH);
     
  
}


/* DATA THAT WE WILL WRITE TO EEPROM */
byte data[] = {0xFF,0x27,0xE1,0xAA,0xD5,0xCC,0xFF,0xFF,0xFF,0xFF,0xFF};

void setup() {

  Serial.begin(9600); 
  pinMode(WE,OUTPUT);
  pinMode(OE,OUTPUT);

  pinMode(2,OUTPUT); // ADDRESS 0
  pinMode(3,OUTPUT); // ADDRESS 1
  pinMode(4,OUTPUT); // ADDRESS 2
  pinMode(5,OUTPUT); // ADDRESS 3
  pinMode(6,OUTPUT); // ADDRESS 4
  pinMode(7,OUTPUT); // ADDRESS 5
  pinMode(8,OUTPUT); // ADDRESS 6
  pinMode(9,OUTPUT); // ADDRESS 7


  pinMode(10,OUTPUT); // DATA 0
  pinMode(11,OUTPUT); // DATA 1
  pinMode(12,OUTPUT); // DATA 2
  pinMode(13,OUTPUT); // DATA 3
  pinMode(A0,OUTPUT); // DATA 4
  pinMode(A1,OUTPUT); // DATA 5
  pinMode(A2,OUTPUT); // DATA 6
  pinMode(A3,OUTPUT); // DATA 7

  Serial.print("Bytes to write : ");
  Serial.println(sizeof(data)/sizeof(int));
  Serial.println();
  Serial.println("Address");
  Serial.println("----------");

  int pin = 2;
  int tmp;

  for(byte j = 0;j<(sizeof(data)/sizeof(byte));j++){   
    
   toBinary(j);

  Serial.print("0x");
  if(j<16){
    Serial.print("0");
  }
  Serial.print(j,HEX);
   
   while(!s.isEmpty()){
    
      tmp = s.pop();
      if(tmp == 1){
      digitalWrite(pin,HIGH);
      delay(1);
      }
      pin++;
   } 
   writeByte(data[j]);
   delay(500);
   
   for(int i = 2;i<=9;i++){
      digitalWrite(i,0);
   }
   for(int i = 10;i<=13;i++){
      digitalWrite(i,LOW); 
   }
   analogWrite(A0,0);
   analogWrite(A1,0);
   analogWrite(A2,0);
   analogWrite(A3,0);
   
   pin = 2;
   Serial.println();

  }
    
}



void loop() {
  

}
