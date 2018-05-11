#include<iostream.h>
#include<conio.h>
void main()
	{
	int a,b;
	clrscr();
	cout<<"Enter Value  of 'A':-";
	cin>>a;
	cout<<endl<<"Enter Value of 'B':-";
	cin>>b;
	a=a+b;
	b=a-b;
	a=b-a;
	cout<<endl<<"**Swapped Value**"<<endl;
	cout<<"'A':-"<<a<<endl<<"'B':-"<<b;
	getch();
	}
