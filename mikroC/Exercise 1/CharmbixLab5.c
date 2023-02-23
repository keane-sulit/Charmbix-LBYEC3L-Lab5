int num[10];
int i, j;
// This code drives two 7-segment displays with a PIC16F877A that counts from 00 to 99
void main() 
{
    // Declare variables for PIC16F877A
    TRISB = 0x00; // Set PORTB as output
    TRISC = 0x00; // Set PORTC as output

    // Create an array of numbers to display on the 7-segment displays
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

    // Create a loop to count from 00 to 99
    while(1)
    {
        for(i = 0; i < 10; ++i)
        {
            for(j = 0; j < 10; ++j)
            {
                PORTC = num[i]; // Display the first digit
                PORTB = num[j]; // Display the second digit

                delay_ms(1000);
            }
        }
    }
}