#include <stdio.h>

int main()
{
    int val1, val2;
    scanf("%d", &val1);
    scanf("%d", &val2);
    printf("%d", (val1 > val2) ? val1 : val2);

    return 0;
}