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

int data[] = {0x0F, 0xAA, 0xE0};

int size(int data[]){

     return sizeof(data)/sizeof(int);
    
}

void writeByte(int data , int address){
 // SETTING ADDRESS PINS

    toBinary(address);
    int pin=2;

    while(!s.isEmpty())
    {

        int a = s.pop();
        if(a==1)
        {
            digitalWrite(a,HIGH);
        }
        else
        {
            digitalWrite(a,LOW);
        }
        pin++;

    }

    //SETTING DATA PINS

    toBinary(data);
    pin = 10;

    while(!s.isEmpty())
    {

        int a = s.pop();
        if(pin<=13)
        {
            if(a==1)
            {
                digitalWrite(a,HIGH);
            }
            else
            {
                digitalWrite(a,LOW);
            }
        }
        else
        {

            if(pin == 14)
            {
                if(a==1)
                {
                    analogWrite(A0,HIGH);
                }
                else
                {
                    analogWrite(A0,LOW);
                }
            }
            else if(pin == 15)
            {
                if(a==1)
                {
                    analogWrite(A1,HIGH);
                }
                else
                {
                    analogWrite(A1,LOW);
                }

            }
            else if(pin == 16)
            {
                if(a==1)
                {
                    analogWrite(A2,HIGH);
                }
                else
                {
                    analogWrite(A2,LOW);
                }
            }
            else if(pin == 17)
            {
                if(a==1)
                {
                    analogWrite(A3,HIGH);
                }
                else
                {
                    analogWrite(A3,LOW);
                }

            }

        }
        pin++;
    }

    digitalWrite(OE,HIGH);
    digitalWrite(WE,LOW);
    delay(10);
    digitalWrite(OE,LOW);
    digitalWrite(WE,HIGH);
      
  
}

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
  
  for(int i = 0 ; i<size(data);i++){

       writeByte(data[i],i);
      
  }

}

void loop() {
  

}
