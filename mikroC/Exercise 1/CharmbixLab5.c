// This code displays 00 to 99 on 2 seven-segment displays.

// Initialize variables
int count[] = {63,6,91,79,102,109,125,7,127,111};
int a = 0;
int b = 0;

// Increment the counter
void inc() {
    if(PORTB.F7 == 0) {         // If the button is pressed,
            a++;                // increment the ones digit.
            delay_ms(250);
        }
        if(a == 10) {           // If ones digit is 10, 
            a = 0;              // reset ones digit to 0,
            b++;                // and increment tens digit.
        }
}

// Reset the counter
void reset() {
    if(b == 10) {               // If tens digit is 10,
        a = 0;                  // reset ones digit to 0,
        b = 0;                  // and reset tens digit to 0.
    }
}

// Main function
void main() {
    TRISB = 0x80;               // Set RB7 as input, all others as output.
    TRISC = 0x00;               // Set all of PORTC as output.
    while(1) {                  // Infinite loop
        PORTB = count[a];       // Display the current count.
        PORTC = count[b];       // Display the current count.
        inc();                  // Increment the counter.
        reset();                // Reset the counter.
    }
}