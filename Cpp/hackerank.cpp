#include <cstdio>
#include <bits/stdc++.h>
#include <iostream>
#include <algorithm>
using namespace std;

int main()
{
    // There goes solution :)
    int n;
    string dataStream, sRev;
    // input string
    cin >> dataStream;
    sRev = dataStream;
    int answer=0;
    reverse(sRev.begin(), sRev.end());
    for (int i = 0; i < dataStream.size(); i++)
    {
        if (dataStream[i] == sRev[i])
        {
            answer++;
        }
    }
    return 0;
}