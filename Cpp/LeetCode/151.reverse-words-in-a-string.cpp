/*
 * @lc app=leetcode id=151 lang=cpp
 *
 * [151] Reverse Words in a String
 */

// @lc code=start
class Solution
{
public:
    string reverseWords(string s)
    {
        istringstream ss(s);
        string word;
        vector <string> res;

        while(ss>>word){
            res.push_back(word);
        }
        string ans;
        for(int i = res.size()-1; i >= 0; i--){
            if(i == res.size()-1){
                ans += res[i];
            }
            else{
                ans += " " + res[i];
            }   
            
        }
        return ans;
    }
};
// @lc code=end
