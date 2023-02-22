int num[10];
int i, j;
// This code drives two 7-segment displays with a PIC16F877A that counts from 00 to 99
void main() 
{
    // Declare variables for PIC16F877A
    TRISB = 0x00; // Set PORTB as output
    TRISC = 0x00; // Set PORTC as output

    // Create an array of numbers to display on the 7-segment displays
    num[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    // Create a loop to count from 00 to 99
    while(1)
    {
        for(i = 0; i < 10; ++i)
        {
            for(j = 0; j < 10; ++j)
            {
                PORTB = num[i]; // Display the first digit
                PORTC = num[j]; // Display the second digit
                delay_ms(1000); // Wait 1 second
            }
        }
    }
}