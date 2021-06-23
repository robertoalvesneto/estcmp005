#include <stdio.h>

int main()
{
    int val1, val2;
    scanf("%d", &val1);
    scanf("%d", &val2);
    for (int i = val1 + 1; i < val2; i++)
        printf("%d ", i);

    return 0;
}

