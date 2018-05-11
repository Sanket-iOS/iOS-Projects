#include<iostream.h>
#include<conio.h>
void main()
	{
	int a,b,c;
	clrscr();
	cout<<"Enter Value  of 'A':-";
	cin>>a;
	cout<<endl<<"Enter Value of 'B':-";
	cin>>b;
	c=a;
	a=b;
	b=c;
	cout<<endl<<"**Swapped Value**"<<endl;
	cout<<"'A':-"<<a<<endl<<"'B':-"<<b;
	getch();
	}
