ArrayList<Object> Objects;
float xoff, yoff, zoff, inc, col;
int spread, cols, rows, num;
int offset = 2;
PImage img;
PVector[] vectors;
void setup() {
  size(640, 480);
  background(0);
  frameRate(30);
  img = loadImage("test.jpg");
  init();
}


void init() {
 
  spread  = 10;
  inc  = random(0.1,0.8);
  num  = 4000;
  col  = random(255);
  cols = floor(width / spread) + 1;
  rows = floor(height / spread) + 1;
  vectors   = new PVector[cols * rows];
  Objects = new ArrayList<Object>();

  for (int i=0; i<num; i++)
    Objects.add(new Object());
}

void draw() {
  fill(0,20);
  rect(0,0,width,height);
  filter(DILATE);
  
  yoff = 0;
  for (int y = 0; y < rows; y++) {
    xoff = 0;
    for (int x = 0; x < cols; x++) {
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      PVector v = PVector.fromAngle(angle);
      v.setMag(2);
      vectors[x + y * cols] = v;
      xoff += inc;
    }
    yoff += inc;
  }
  zoff += 0.0005;
  if (col < 255)col += 0.5;
  else col = 0;
  for (Object p : Objects)p.run();
}
void mousePressed()
{
  background(255);
  init();
}
