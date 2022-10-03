void setup() 
{ 
  size(800, 600);    
  noFill(); 
  stroke(120); 
  background(0);
  frameRate(8); 
} 

int xstep=100;
int ystep=120;
void draw() 
{ 
  background(0); 
  for(int i=0; i<height; i+=ystep) { 
    for(int j=0; j<width; j+=xstep) { 
      int r = int(random(3));                 //随机绘制由3个pattern函数绘制的图形
      if(r == 0) 
      { 
        pattern0(j, i); 
      } 
      else if (r == 1)
      { 
        pattern1(j, i);        
      }
      else if (r==2)
      {
        pattern2(j,i);
      }
    } 
  } 
} 
//pattern0与pattern1绘制由两个半径不同的半圆和一个1/4圆构成的图形
//pattern2绘制由椭圆和一个圆形构成的图形
void pattern0(int xc,int yc)
{
  arc(xc+60,yc+60,120,120,HALF_PI,HALF_PI+PI);
  arc(xc+80,yc+40,40,40,0,PI);
  arc(xc+80,yc+80,40,40,PI,PI+PI);
  arc(xc+60,yc+40,80,80,PI+HALF_PI,PI+PI);
  arc(xc+60,yc+80,80,80,0,HALF_PI);
}
void pattern1(int xc,int yc)
{
  arc(xc+40,yc+60,120,120,0,HALF_PI);
  arc(xc+40,yc+60,120,120,HALF_PI+PI,PI+PI);
  arc(xc+20,yc+40,40,40,0,PI);
  arc(xc+20,yc+80,40,40,PI,PI+PI);
  arc(xc+40,yc+40,80,80,PI,HALF_PI+PI);
  arc(xc+40,yc+80,80,80,HALF_PI,PI);
}
void pattern2(int xc,int yc)
{
  ellipse(xc+50,yc+60,100,120);
  point(xc+50,yc+60);
  ellipse(xc+50,yc+60,50,50);
}
