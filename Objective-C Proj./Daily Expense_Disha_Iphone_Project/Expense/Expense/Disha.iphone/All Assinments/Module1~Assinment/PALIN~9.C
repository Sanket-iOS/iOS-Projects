#include<stdio.h>
#include<conio.h>

void main()
{
	int num,sum=0,temp;
	clrscr();

	printf("\n Enter any Number:- ");
	scanf("%d",&num);
	temp = num;

	while(num>0)
	{
		sum = (sum*10) + (num%10);
		num = num/10;
	}

	if(temp==sum)
		printf("\n Given number is Palindrome");
	else
		printf("\n Given number is not Palindrome");
	getch();
}
