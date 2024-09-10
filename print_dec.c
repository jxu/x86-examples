#include <stdint.h>
#include <stdio.h>
#include <unistd.h>

// print non-negative 64-bit integer in decimal
void print_dec(uint64_t x) 
{
    char stack[20]; // simulated stack
    char* sp = stack; // not actual rsp
    char* bp = sp;

    // push digits LSD to MSD
    do  // run at least once to print 0
    {
        char d = (x % 10) + '0';
        *(sp++) = d;  // ugly terse C syntax for push
        x /= 10;
    } while (x);

    // pop and write digits MSD to LSD
    do 
    {
        char d; // for clarity
        d = *(--sp); // pop
        putc(d, stdout);
    } while (sp != bp);
}

// print non-negative 64-bit integer in decimal
// with one call on a stack reading bottom-up
void print_dec2(uint64_t x) 
{
    char stack[20];
    char *sp = stack + 20; // end of array
    char digits = 0;

    do  // run at least once to print 0
    {
        *(--sp) = (x % 10) + '0';  // push from end
        x /= 10;
        ++digits;
    } while (x);

    // one write call in C. credit chux
    // can't push single bytes to actual x86 stack though
    write(1, sp, digits);
}


int main() 
{ 
    //print_dec(1234); 
    print_dec2(1234);
}
