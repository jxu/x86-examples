#include <stdio.h>

void to_lower(char s[]) 
{
     // do-while doesn't handle empty string
    while (*s) {
        if (*s >= 'A' && *s <= 'Z')
            *s += 0x20;
        ++s;
    }
}

int main(void) 
{
    char s[] = "ABCZ abcz 012 @[!";
    to_lower(s);
    puts(s);
}

