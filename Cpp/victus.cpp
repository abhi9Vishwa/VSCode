#include <stdio.h>
int main()
{
    //width is total resolution
    //thicc is width of V logo

    double width = 19;
    double thicc = 2;
    for (int i = 0; i <= width; i++)
    {
        for (int j = 0; j <= i; j++)
        {

            /* code */
            printf("  ");

            for (int k = 0; k <= j; k++)
            {
                /* code */
            }
        }

        for (int m = 0; m < (width * thicc); m++)
        {
            printf("\\");
            /* code */
        }
        for (int m = 0; m < (width - i); m++)
        {
            /* code */
            printf("    ");
        }
        for (int m = 0; m < (width * thicc); m++)
        {
            printf("/");
            /* code */
        }

        printf("\n");
    }
    for (int i = 0; i < width; i++)
    {
        printf("    ");
        for (int j = 0; j < (width); j++)
        {
            printf("  ");
        }
        for (int h = 0; h < i; h++)
        {
            /* code */
            printf("  ");
        }

        for (int j = 0; j < (width * thicc) - 2 - 2 * i; j++)
        {
            printf("\\");
        }
        for (int j = 0; j < ((width * thicc) - 2 - 2 * i); j++)
        {
            printf("/");
        }
        printf("\n");
    }

    return 0;
}