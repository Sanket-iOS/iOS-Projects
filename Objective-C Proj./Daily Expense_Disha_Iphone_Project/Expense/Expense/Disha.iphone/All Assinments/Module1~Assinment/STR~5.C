#include<stdio.h>
#include<conio.h>
#include<string.h>

void main()
	{
	char ch[10];
	clrscr();
	printf("Enter Any String:-");
	gets(ch);
	strrev(ch);
	printf("your String is %s",ch);
	getch();
	}
