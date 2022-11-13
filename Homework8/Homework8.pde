int generation = 1;
float r = 121;
float g = 226; 
float b = 133;
int whichShape = 0;
float w = 10;
float h = 10;
float driftx = 0;
float drifty = 0;
float shape = 0;
float wide = 0;
float tall = 0;
int rand = 0;
int rand2 = 0;
void setup(){
  //size(500,500);
  size(650,650);
  frameRate(500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER);
 
}
void draw(){
  background(0);
  
  
  
  rand = floor(random(6));
  rand2 = floor(random(6));
if(w>0 &&h>0){  
  //color
  if(rand == 0 || rand == 1){
    rand2 = floor(random(6));
    if(rand2 == 0){
      r+=1;
    }else if(rand2 == 1){
      r-=1;
      drifty++;
    }else if(rand2 == 2){
      r+=2;
      driftx--;
    }else if(rand2 == 3){
      r-=2;
    }else if(rand2 == 4){
      r+=2.5;
    }else if(rand2 == 5){
      r-=2.5;
      w++;
    }
  }else if(rand == 2 || rand == 3){
    rand2 = floor(random(6));
    if(rand2 == 0){
      g+=1;
    }else if(rand2 == 1){
      g-=1;w--;
    }else if(rand2 == 2){
      g+=2;
    }else if(rand2 == 3){
      g-=2;h--;
    }else if(rand2 == 4){
      g+=1.3;
      drifty--;
    }else if(rand2 == 5){
      g-=1.3;h++;
    }
  }else{
    rand2 = floor(random(6));
    if(rand2 == 0){
      b+=1;
    }else if(rand2 == 1){
      b-=1;
    }else if(rand2 == 2){
      b+=3.1;
      driftx++;
    }else if(rand2 == 3){
      b-=3.1;
    }else if(rand2 == 4){
      b+=.5;
    }else if(rand2 == 5){
      b-=.5;
    }
  }
}
  
  
  if(w>0 &&h>0){
  if(driftx>100){
    driftx =100;
  }else if(driftx <= 0){
    driftx = 1;
  }
  }
  
  if(w>0 &&h>0){
  
    rand2 = floor(random(4));
    if(rand2 == 0){
      shape+=13;
    
    }else if(rand2 == 1){
      shape-=13;
      
    }else if(rand2 == 2){
      shape+=1;
      
    }else if(rand2 == 3){
      shape-=1;
      
    }

  }
  
  fill(r,g,b);
  stroke(r,g,b);
  if(w>0 &&h>0){
    if(shape<=100){
      strokeWeight(abs((driftx/3)+(drifty/3)+(w/3)+(h/3))+1);
       point(width/2,height/2);
       whichShape = 0;
    }else if(shape >100 &&shape <= 130){
      ellipse(width/2,height/2,w+driftx,h+drifty);
      whichShape = 1;
    }else if(shape >130 &&shape <= 300){
      rect(width/2,height/2,w-h+driftx,w+h,w+drifty);
      whichShape = 2;
    }else if(shape >300){
      rect(width/2,height/2,w+h+driftx,w-h+drifty);
      whichShape = 2;
    }
  }
  strokeWeight(1);
  
 if(w>0 &&h>0){
  if(shape<0){shape=0;}
  if(shape>500){shape=500;}
 }
  if(w<0){w=0;}
  if(w>255){w=255;}
  if(h<0){h=0;}
  if(h>255){h=255;}
  
  if(w>0 &&h>0){
    if(r<0){r=0;}
    if(r>255){r=255;}
    if(g<0){g=0;}
    if(g>255){g=255;}
    if(b<0){b=0;}
    if(b>255){b=255;}
  }
  fill(255);
  textSize(15);
  
  textSize(20);
  if(w>0 &&h>0){
  if(shape<=100){
    text("DNA:   POINT["+whichShape+":"+floor(r)+":"+floor(g)+":"+floor(b)+":"+floor(shape)+":"+floor(w)+":"+floor(h)+"]",width/2,150);
  }else if(shape >100 &&shape <= 130){
    text("DNA:   ELLIPSE["+whichShape+":"+floor(r)+":"+floor(g)+":"+floor(b)+":"+floor(shape)+":"+floor(w)+":"+floor(h)+"]",width/2,150);
  }else if(shape >130 &&shape <= 300){
    text("DNA:   RECT["+whichShape+":"+floor(r)+":"+floor(g)+":"+floor(b)+":"+floor(shape)+":"+floor(w)+":"+floor(h)+"]",width/2,150);
  }else if(shape >300){
   text("DNA:   RECT["+whichShape+":"+floor(r)+":"+floor(g)+":"+floor(b)+":"+floor(shape)+":"+floor(w)+":"+floor(h)+"]",width/2,150);
  }
  }else{text("EXTINCT",width/2,height/2);}
  text("Generation: "+generation,width/2,height-30);
  if(w>0 &&h>0){
  generation++;
  }
}
