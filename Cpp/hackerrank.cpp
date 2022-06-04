// #include <cmath>
// #include <cstdio>
#include <vector>
#include <iostream>
// #include <algorithm>
using namespace std;

int main()
{
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */

    int row, query;
    cin >> row >> query;

    vector<vector<int>> vect(row);
    // cout << "starting input" << endl;
    for (int i = 0; i < row; i++)
    {
        int column;
        cin >> column;
        vect[i] = vector<int>(column);
        // cout << "in row" << i << endl;
        for (int j = 0; j < column; j++)
        {
            int input;
            cin >> input;
            vect[i][j] = input;
            // cout<< "in row"<<i<<endl;
        }
    }
    // cout << "starting taking input" << endl;
    for (int k = 0; k < query; k++)
    {
        int l, m;
        cin >> l >> m;
        cout << vect[l][m];
    }

    // cout << row << query;
    return 0;
}
