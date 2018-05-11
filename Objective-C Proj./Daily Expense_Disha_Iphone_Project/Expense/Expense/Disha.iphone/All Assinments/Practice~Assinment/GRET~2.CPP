#include<iostream.h>
#include<conio.h>
void main()
	{
	int a,b,c;
	clrscr();
	cout<<"Enter value of A:-";
	cin>>a;
	cout<<endl<<"Enter Value of b;-";
	cin>>b;
	cout<<endl<<"Enter Value of c:-";
	cin>>c;
	cout<<endl<<"A="<<a<<endl<<"B="<<b<<endl<<"C="<<c<<endl<<endl;
	if(a>b)
		{
		if(a>c)
			cout<<"A is Gretest";
		else
			cout<<"C is Gretest";
		}
	else
		{
		if(b>c)
			cout<<"B is Gretest";
		else
			cout<<"C is Gretest";
		}
	getch();

	}