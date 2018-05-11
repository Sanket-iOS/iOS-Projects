#include<iostream.h>
#include<conio.h>
void main()
	{
	int num,c=0,i;
	clrscr();
	cout<<"enter number";
	cin>>num;
	for(i=1;i<=num;i++)
		{
		if(num%i==0)
			{
		       c++;
			}
		}
	if(c==2)
		cout<<"Prime";
	else
		cout<<"n	ot Prime";
	getch();
	}
