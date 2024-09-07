// 32-bit C call testing
// https://godbolt.org/z/cqPjsozeY 

#include <assert.h>

__attribute__((fastcall)) int parse(char* varint) 
{
    char byte;
    int result = 0;
    int shift = 0;
    
    do 
    {
        byte = *varint;
        result |= (byte & 0x7F) << shift;
        shift += 7;
        ++varint;
    } while (byte & 0x80);

    return result;
}


int main() 
{
    assert(parse("\x00") == 0);
    assert(parse("\x81\x00") == 1);
    assert(parse("\x7f\x00\x34") == 127);
    assert(parse("\xdd\xc7\x01") == 25565);
}
