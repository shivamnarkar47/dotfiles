#include <bits/stdc++.h>

#define endl "\n"


using namespace std;
int main()
{

	std::ios::sync_with_stdio(false);
	int T;
	cin >> T;
	while (T--) {
		int a,b;
		int sum,even=0;
		cin>>a>>b;
		for (int i = 1; i <= a; i++) {
			for (int j = 1; j <= b; j++) {
				sum = i+j;
				if (sum%2==0) {
					even++;
				}
			}
		}
	cout<<even<<endl;
	
	}

	return 0;
}
