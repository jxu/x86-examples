int sumdig2(unsigned int n) 
{
    char stack[10];
    int sum = 0;
    char* sp = stack;
    do
    {
        *sp = n % 10; ++sp; // push
        n /= 10;
    } while (n);

    while (1) 
    {
        --sp; // pop
        if (sp == stack) break;
        --sp; sum += *sp; //pop
        if (sp == stack) break;
    }

    return sum;
}


int main() 
{
    return sumdig2(1234);
}
