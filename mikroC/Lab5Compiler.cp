#line 1 "//Mac/Home/Documents/GitHub/Charmbix-LBYEC3L-Lab5/mikroC/Lab5Compiler.c"
int num[10];
int i, j;

void main()
{

 TRISB = 0x00;
 TRISC = 0x00;


 num[0] = 0x3F;
 num[1] = 0x06;
 num[2] = 0x5B;
 num[3] = 0x4F;
 num[4] = 0x66;
 num[5] = 0x6D;
 num[6] = 0x7D;
 num[7] = 0x07;
 num[8] = 0x7F;
 num[9] = 0x6F;


 while(1)
 {
 for(i = 0; i < 10; ++i)
 {
 for(j = 0; j < 10; ++j)
 {
 PORTC = num[i];
 PORTB = num[j];

 delay_ms(1000);
 }
 }
 }
}
