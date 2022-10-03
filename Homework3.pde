//Created by GSC for Homework3
//2022.10.3
void setup()
{
  size(700,800);
  noFill();
  background(255);
  colorMode(HSB, 360, 100, 100);
  
}
void draw()
{
  color origcolor=30;
  fill(0,100,100);
  rect(100,100,500,600);
  line(100,390,600,390);
  line(100,410,600,410);
  for(int i=100;i<600;i+=20)
  {
    fill((origcolor+(i/100)%4*90)%360,80,80);
    rect(i,390,20,20);
  }
  for(int j=100;j<700;j+=20)
  {
    fill((origcolor+(j/100)%4*90)%360,80,80);
    rect(340,j,20,20);
  }
  fill(60,80,70);
  rect(260,410,80,120);
  stroke(0);
  line(260,490,340,490);
  for(int w=100;w<360;w+=40)
  {
    fill(50,80,80);
    rect(160,w,15,30);
  }
  fill(240,50,100);
  quad(500,130,520,130,550,360,530,360);
  quad(500,670,520,670,550,440,530,440);
  stroke(100);
  line(506,624,360,510);
  line(506,176,360,290);
}
