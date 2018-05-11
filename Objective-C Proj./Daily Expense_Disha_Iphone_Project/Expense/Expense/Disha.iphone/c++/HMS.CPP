#include<iostream.h>
#include<conio.h>
void main()
	{
	int hour,minute,second;
	clrscr();
	cout<<"Enter hour";
	cin>>hour;
	cout<<endl<<"Enter Minute";
	cin>>minute;
	cout<<endl<<"Enter Second";
	cin>>second;
	cout<<"24 hour format"<<endl;
	if(hour>24)
		cout<<"not entry";
	else
		cout<<endl<<"Hour: Minute: Second: "<<endl<<hour<<"    "<<minute<<"      "<<second<<"      "<<endl;
	cout<<"12 hour format"<<endl;

	if(hour>12)
		{
		hour=hour-12;
		cout<<"Hour:  Minute:  Second:  "<<endl<<hour<<"     "<<minute<<"     "<<second<<"      "<<endl;
		}
	else
		{
	       cout<<"Hour:  Minute:  Second:  "<<endl<<hour<<"     "<<minute<<"     "<<second<<"      "<<endl;
	       }
	getch();
	}
