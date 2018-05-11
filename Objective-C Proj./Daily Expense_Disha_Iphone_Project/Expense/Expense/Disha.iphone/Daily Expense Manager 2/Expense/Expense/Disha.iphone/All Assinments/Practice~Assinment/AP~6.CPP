#include<iostream.h>
#include<conio.h>
void main()
	{
	int area,height,width,peri;
	clrscr();
	cout<<"     Enter Height  ";
	cin>>height;
	cout<<endl<<"     Enter Width   ";
	cin>>width;
	cout<<"  -----------------------------"<<endl<<"  ************ANSWER************"<<endl<<"  ------------------------------";
	area=height*width;
	peri=2*(height+width);
	cout<<endl<<"    Area of Rectangle=>"<<area<<endl<<endl;
	cout<<"    Perimeter of Rectangle=>"<<peri;
	getch();
	}