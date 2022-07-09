#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int main()
{

    vector<int> A = {-584, -714, -895, -512, -718, -545, 734, -886, 701, 316, -329, 786, -737, -687, -645, 185, -947, -88, -192, 832, -55, -687, 756, -679, 558, 646, 982, -519, -856, 196, -778, 129, -839, 535, -550, 173, -534, -956, 659, -708, -561, 253, -976, -846, 510, -255, -351, 186, -687, -526, -978, -832, -982, -213, 905, 958, 391, -798, 625, -523, -586, 314, 824, 334, 874, -628, -841, 833, -930, 487, -703, 518, -823, 773, -730, 763, -332, 192, 985, 102, -520, 213, 627, -198, -901, -473, -375, 543, 924, 23, 972, 61, -819, 3, 432, 505, 593, -275, 31, -508, -858, 222, 286, 64, 900, 187, -640, -587, -26, -730, 170, -765, -167, 711, 760, -104, -333};
    int B = 32;
    long sum = 0;
    int x, y = 0;
    x = B;
    int size = A.size();
    int maxSum = INT_MIN;
    long totalSum = 0;
    for (int i = 0; i < size; i++)
    {
        totalSum += A[i];
    }
    long slidingWin;
    for (int j = y; j < size - x; j++)
    {
        slidingWin += A[j];
    }
    y++;
    x--;
    sum = totalSum - slidingWin;
    cout << sum << endl;
    if (sum > maxSum)
    {
        maxSum = sum;
    }

    cout << maxSum << endl;
    return 0;
}