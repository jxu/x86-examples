// print non-negative integer in decimal
#include <stdio.h>

typedef unsigned long long ull;


void print_dec(ull x)
{    
    ull stack[20];
    ull sp = 0; // not actual x86 sp
    ull bp = sp;
    ull d;

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
