#include<stdio.h>
#include<conio.h>
#include<string.h>

void main()
	{
	char ch[10];
	int v=0,c=0,i;
	clrscr();
	printf("Enter Any String:-");
	gets(ch);
	i=0;
	while(ch[i]!='\0')
		{

		if(ch[i]=='A'||ch[i]=='E'||ch[i]=='I'||ch[i]=='O'||ch[i]=='U'||ch[i]=='a'||ch[i]=='e'||ch[i]=='i'||ch[i]=='o'||ch[i]=='u')
			v++;
		else
			c++;
		i++;
		}
	printf("\nVowels is %d",v);
	printf("\nConstant is %d",c);
	getch();
	}
