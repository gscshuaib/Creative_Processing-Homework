int cellSize = 10;
int r = 1;

// How likely for a cell to be red at start (%)
float probabilityOfRedAtStart = 5;
// How likely for a cell to be green at start 
float probabilityOfGreAtStart = 90;

// Population dynamics
float dr = 0.2; 
float br = 0.8; 
float df = 0.2; 
float bf = 0.8; 

int interval = 100;
int lastRecordedTime = 0;


color red = color(200, 0, 0);
color gre = color(0, 200, 0);
color empt = color(30, 144, 255);

// Array of cells
int[][] cells;
int[][] cellsBuffer;

// Pause
boolean pause = false;

void setup() {
 size(600, 600);
 
 cells = new int[width / cellSize][height / cellSize];
 cellsBuffer = new int[width / cellSize][height / cellSize];

 stroke(255);
 noSmooth();

 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   float state = random(100);
   if (state > probabilityOfRedAtStart + probabilityOfGreAtStart) {
    state = 0; // empty
   } else if (state < probabilityOfRedAtStart) {
    state = 1; // red
   } else {
    state = 2; // green
   }
   cells[x][y] = int(state); // Save state of each cell
  }
 }
 background(255);
}


void draw() {
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   if (cells[x][y] == 1) {
    fill(red); 
   } else if (cells[x][y] == 2) {
    fill(gre); 
   } else {
    fill(empt); 
   }
   rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
 }
 if (millis() - lastRecordedTime > interval) {
  if (!pause) {
   iteration();
   lastRecordedTime = millis();
  }
 }
}

void iteration() { 
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   cellsBuffer[x][y] = cells[x][y];
  }
 }
 // Visit each cell:
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   //  visit all the neighbours of each cell
   int nRed = 0; 
   int nGre = 0;
   for (int xx = x - 1; xx <= x + 1; xx++) {
    for (int yy = y - 1; yy <= y + 1; yy++) {
     if (((xx >= 0) && (xx < width / cellSize)) && ((yy >= 0) && (yy < height / cellSize))) { 
      if (!((xx == x) && (yy == y))) { // Make sure to to check against self
       if (cellsBuffer[xx][yy] == 1) {
        nRed++; 
       } else if (cellsBuffer[xx][yy] == 2) {
        nGre++;
       }
      }
     }
    } 
   } 
   if (cellsBuffer[x][y] == 2) { // The cell is red
    if (random(1) < pow((1 - df), nRed)) {
     cells[x][y] = 2; 
    } else {
     if (random(1) < bf) {
      cells[x][y] = 1; 
     }
    }
   } else if (cellsBuffer[x][y] == 1) { 
    if (random(1) < df) {
     cells[x][y] = 0; 
    } else {
     cells[x][y] = 1; 
    }
   } else if (cellsBuffer[x][y] == 0) { // The cell is empty 
    if (nRed != 0 || nGre == 0) {
     cells[x][y] = 0; 
    } else {
     if (random(1) > pow((1 - br), nGre)) {
      cells[x][y] = 2; 
     }
    }
   }
  }
 }
}
