// print non-negative integer in decimal
#include <stdio.h>

unsigned stack[20];

void print_dec(unsigned x)
{
    unsigned sp = 0; // not actual x86 sp
    unsigned bp = sp;
    unsigned d;

    do // run at least once to print 0
    {
        d = x % 10; 
        stack[sp++] = d; // push
        x /= 10;
    } while (x);

    do 
    {
        d = stack[--sp]; // pop
        putc(d + '0', stdout);
    } while (sp != bp);
}

int main() 
{
    print_dec(1234);
}
