#line 1 "//Mac/Home/Documents/GitHub/Charmbix-LBYEC3L-Lab5/mikroC/Lab5Compiler.c"
int count[] = {63,6,91,79,102,109,125,7,127,111};
int a = 0;
int b = 0;


void inc() {
 if(PORTB.F7 == 0) {
 a++;
 delay_ms(250);
 }
 if(a == 10) {
 a = 0;
 b++;
 }
}

void reset() {
 if(b == 10) {
 a = 0;
 b = 0;
 }
}

void main() {
 TRISB = 0x80;
 TRISC = 0x00;
 while(1) {
 PORTB = count[a];
 PORTC = count[b];
 inc();
 reset();
 }
}
