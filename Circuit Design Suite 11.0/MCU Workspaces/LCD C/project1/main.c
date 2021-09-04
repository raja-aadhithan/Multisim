#include <htc.h>
#define lcd P0
sbit rs = P0^4;
sbit rw = P0^5;
sbit en = P0^3;
void lcd_string(char *str);
void lcd_init();
void cmd(unsigned char a);
void lcd_data(unsigned char b);
void delay(int t);

void main()
{
lcd _init()
while(1)
{
cmd(0x01);
cmd(0x80);
lcd_string("RAJA AAD");
cmd(0xc0);
lcd_string("HITHAN");
}
}

void lcd_string(char *str)
{
while(*str)
{
lcd_data(*str);
str++;
}

void lcd_init()
{
cmd(0x02);
cmd(0x28);
cmd(0x0e);
cmd(0x01);
}

void cmd(unsigned char a)
{
lcd  =  a&0xf0;
rs = 0;
rw = 0;
en = 1;
delay(1);
en = 0;
lcd = (a<<4)&0xf0;
rs = 0;
rw = 0;
en = 1;
delay(1);
en = 0;
}

void lcd_data(unsigned char b)
{
lcd  =  b&0xf0;
rs = 1;
rw = 0;
en = 1;
delay(1);
en = 0;
lcd = (b<<4)&0xf0;
rs = 1;
rw = 0;
en = 1;
delay(1);
en = 0;
}

void delay(int t)
{
int i,j;
for (i=0;i<t;i++)
{
for(j=0;j<1000;j++);
}
}