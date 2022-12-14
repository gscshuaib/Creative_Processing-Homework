class Object {
  PVector pos, vel, acc, prev;
  float max = random(2, 8);
  
  Object() {
    pos  = new PVector(width/2, height/2);
    prev = new PVector(pos.x, pos.y);
    vel  = new PVector(0, 0);
    acc  = new PVector(0, 0);
  }
  
  void copy() {
    prev.x = pos.x;
    prev.y = pos.y;
  }

  void run() {
    follow();
    update();
    show();
  }

  void update() {
    pos.add(vel);
    vel.limit(max);
    vel.add(acc);
    acc.mult(0);
    if (pos.x > width) {
      pos.x = 0; 
      copy();
    }  
    if (pos.x < 0) {
      pos.x = width; 
      copy();
    } 
    if (pos.y > height) {
      pos.y = 0; 
      copy();
    }  
    if (pos.y < 0) {
      pos.y = height; 
      copy();
    }
  }
  void follow() {
    int x = floor(pos.x / spread);
    int y = floor(pos.y / spread);
    PVector force = vectors[x + y * cols];
    acc.add(force);
  }
  void show() {
   color c = img.get(int(pos.x),int(pos.y));
   stroke(c);
   line(pos.x, pos.y, prev.x, prev.y);
    
       copy();
  }
}
