#include <bits/stdc++.h>
using namespace std;
// Remember, all submissions are being checked for plagiarism.
// Your recruiter will be informed in case suspicious activity is detected.

// you can use includes, for example:
// #include <algorithm>

// you can write to stdout for debugging purposes, e.g.
// cout << "this is a debug message" << endl;

int solution(vector<string> &R)
{
    // write your code in C++14 (g++ 6.2.0)
    int M = R[0].size();
    int N = R.size();
    vector<vector<vector<int>>> states(N, vector<vector<int>>(M, vector<int>(4, 0)));
    int dir[4][2] = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};
    int i = 0;
    int j = 0;
    int d = 0, count = 0;
    while (states[i][j][d] == 0)
    {
        cout << i << " " << j << " " << d << endl;
        states[i][j][d] = 1;
        i = i + dir[d][0];
        j += dir[d][1];
        int ans = 0;
        while (i < 0 || j < 0 || i >= N || j >= M || R[i][j] == 'X')
        {
            if(ans>=4)
            break;
            ans++;
            i -= dir[d][0];
            j -= dir[d][1];
            d++;
            d %= 4;
            // if (states[i][j][d] == 1)
            //     break;
            // states[i][j][d] = 1;
            i += dir[d][0];
            j += dir[d][1];
        }
        if (ans >= 4)
            break;
    }
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < M; j++)
        {
            vector<int> st = states[i][j];
            if (states[i][j][0] == 1 || states[i][j][1] == 1 || states[i][j][2] == 1 || states[i][j][3] == 1)
                count++;
        }
    }
    return count;
}

int main()
{
    vector<string> r = {"."};
    int ans = solution(r);
    cout << ans << endl;
}