#include<iostream.h>
#include<conio.h>
class A
	{
	public:
		int w,h;
		void area(int w,int h)
			{
			cout<<"Area is "<<w*h<<endl;
			}
	};
class B
	{
	public:
	int kg,k;
		void convert(int kg,int k)
			{
			cout<<"kilo gram is "<<kg/k<<endl;
			}

	};

class C:public A,public B
	{
	public:
		int a,b;
		void sum(int a,int b)
			{
			cout<<"sum is "<<a+b<<endl;
			}
	};
void main()
	{
	clrscr();
	C objc;
	objc.sum(10,2);
	objc.convert(4000,1000);
	objc.area(4,5);
	getch();
	}
