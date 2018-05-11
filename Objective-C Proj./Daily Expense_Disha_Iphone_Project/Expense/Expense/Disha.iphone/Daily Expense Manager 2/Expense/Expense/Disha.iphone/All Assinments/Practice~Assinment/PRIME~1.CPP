#include<iostream.h>
#include<conio.h>
void main()
	{
	int c=0,i,n;
	clrscr();
	cout<<"Enter Any number:";
	cin>>n;
	for(i=1;i<=n;i++)
		{
		if(n%i==0)
			c++;
		}
	if(c==2)
		cout<<"This is Prime Number";
	else
		cout<<"Thid is'nt Prime Number";

	getch();
	}