void setup() {
  size(1000, 1000);
  background(0);
  frameRate(1);
}

void draw()
{
  
  push();
  translate(width/10,height/20); 
  color SquareColour = color(255,255,128,120);
  FractalCircle(200,200,400,SquareColour);
  pop();
}

void FractalCircle(int x,int y,int size,color rng)
{
  rng=color(random(255),random(255),random(255),100);
  fill(rng);
  circle(x,y,size);
  if(size > 8)
  {
  
    FractalCircle(x-size/4,y-size/4,size/2,rng);
    FractalCircle(x+size/4*3,y-size/4,size/2,rng);
    FractalCircle(x-size/4,y+size/4*3,size/2,rng);
    FractalCircle(x+size/4*3,y+size/4*3,size/2,rng);
    
  }
  
  
}
