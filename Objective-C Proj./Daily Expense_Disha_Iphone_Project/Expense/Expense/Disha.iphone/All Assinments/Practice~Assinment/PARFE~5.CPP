#include<iostream.h>
#include<conio.h>
void main()
	{
	int sum=0,i,n;
	clrscr();
	cout<<"Enter Number:-";
	cin>>n;
	for(i=1;i<n;i++)
		{
		if(n%i==0)
		sum=sum+i;
		}
	if(sum==n)
		cout<<n<<" is Parfect";
	else
		cout<<n<<" is not Parfect";
	getch();
	}