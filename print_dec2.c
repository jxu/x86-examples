#include <stdint.h>
#include <unistd.h>

#define STACK_SIZE 20

// print non-negative 64-bit integer in decimal
void print_dec(uint64_t x)
{    
    unsigned char stack[STACK_SIZE];
    unsigned char sp = STACK_SIZE; // not actual x86 sp
    unsigned char digits = 0;

    do // run at least once to print 0
    {
        stack[--sp] = (x % 10) + '0'; // push
        x /= 10;
        ++digits;
    } while (x);

    // one write call. credit chux
    write(1, stack + sp, digits);
}

int main() 
{
    print_dec(1234);
}
