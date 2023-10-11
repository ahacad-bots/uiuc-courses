#include <iostream>
#include <iomanip>
#include <bitset>
using std::bitset;
using std::hex;
using std::oct;
using std::cout;
using std::cin;
using std::endl;


using namespace std;
typedef unsigned int uint32_t;
int main()
{
	uint32_t x = 0x250220d7;
	x = x | 0x17289bf6;
	uint32_t y = (x >> 28) & 0xff000000;
	cout << y<< endl;
	cout<<hex<<"Hex:"<<y<<endl;
return 0;
}
