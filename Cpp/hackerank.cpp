#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int main()
{
    // There goes solution :)
    int n, m;
    cin >> n >> m;
    vector<long long> vect(n, 0);

    for (int i = 0; i < m; i++)
    {
        int a, b, k;
        cin >> a >> b >> k;
        for (int j = a - 1; j < b; j++)
        {
            vect[j] += k;
        }
    }
    cout << *max_element(vect.begin(), vect.end()) << endl;
    return 0;
}