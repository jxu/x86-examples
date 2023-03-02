#include <stdio.h>

int sum_digits(char *str)
{
    int sum = 0;
    do
    {
        sum += *str - '0';
        ++str;
    } while (*str);
    return sum;
}

int main(void) 
{
    return sum_digits("123");
}

