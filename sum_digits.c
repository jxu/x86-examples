int sum_digits2(char *str)
{
    char c;
    int sum = 0;
    while ((c = *str++))
        sum += c - '0';
    return sum;
}

int sum_digits(char *str)
{
    int sum = 0;
    do 
        sum += *str++ - '0';
    while (*str); // next char
    return sum;
}

int main(void) 
{
    return sum_digits("123");
}
