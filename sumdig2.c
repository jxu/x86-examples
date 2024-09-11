int sumdig2(unsigned int n) 
{
    char stack[10];
    int sum = 0;
    char* sp = stack;
    int i = 0;
    do
    {
        *sp = n % 10; ++sp; // push
        n /= 10;
        ++i;
    } while (n);

    do
    {
        --sp; // pop
        if (!--i) break;
        --sp; sum += *sp; //pop
    } while (--i);

    return sum;
}


int main() 
{
    return sumdig2(1234);
}
