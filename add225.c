// comparison: proper calling convention
int add225(int x, int y) 
{
    if (x == 2 && y == 2) return 5;
    return x+y;
}

int main(void) 
{
    return add225(2, 2);
}
