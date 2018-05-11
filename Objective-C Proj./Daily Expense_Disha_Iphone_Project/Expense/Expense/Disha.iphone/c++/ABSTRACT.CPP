#include<iostream.h>
#include<conio.h>
class A                        //abstract class
	{
	public:
	virtual void show()=0;    //pure virtual
	};
class B:public A
	{
	public:
		void show()
			{
			cout<<"Virtual function of derived";
			}
	};
void main()
	{
	clrscr();
//	A obja;       //
	A *a;
	B b;
	a=&b;
	a->show();
	getch();
	}