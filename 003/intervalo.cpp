#include <iostream>

using namespace std;

int main()
{
    int val1, val2;
    cin >> val1;
    cin >> val2;
    for (int i = val1 + 1; i < val2; i++)
        cout << i << " ";
}