#include<iostream.h>
#include<conio.h>
class Abc
	{
	protected:
	int m1,m2;
	public:
		void get()
			{
			cout<<"Enter m1 marks";
			cin>>m1;
			cout<<endl<<"Enter m2 marks";
			cin>>m2;
			}
	};
class Mno
	{
	protected:
		int cm;
	public:
		void getcm()
			{
			cout<<endl<<"Enter Computer marks";
			cin>>cm;
			}
	};
class Disha:public Abc,public Mno
	{

	int tot,avg;
	public:
	void display()
		{
		tot=m1+m2+cm;
		avg=tot/3;
		cout<<"m1="<<m1<<endl<<"m2="<<m2<<endl<<"cm="<<cm<<endl<<"total marks"
		<<tot<<endl<<"Average is"<<avg<<endl;
		}
	};
void main()
{
clrscr();
Disha d;
d.get();
d.getcm();
d.display();

getch();
}