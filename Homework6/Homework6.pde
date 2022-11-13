// Size of cells
int cellSize = 10;
// Moore radius
int r = 1;

// How likely for a cell to be fox at start (in percentage)
float probabilityOfFoxAtStart = 5;
// How likely for a cell to be rabbit at start (in percentage)
float probabilityOfRabAtStart = 90;

// Population dynamics
float dr = 0.2; // prey death rate
float br = 0.8; // prey birth rate
float df = 0.2; // predator death rate
float bf = 0.8; // predator birth rate

// Variables for timer
int interval = 100;
int lastRecordedTime = 0;

// Colors for predator, prey and empty cells
color fox = color(200, 0, 0);
color rab = color(0, 200, 0);
color empt = color(30, 144, 255);

// Array of cells
int[][] cells;
// Buffer to record the state of the cells and use this while changing the others in the interations
int[][] cellsBuffer;

// Pause
boolean pause = false;

void setup() {
 size(600, 600);

 // Instantiate arrays 
 cells = new int[width / cellSize][height / cellSize];
 cellsBuffer = new int[width / cellSize][height / cellSize];

 // This stroke will draw the background grid
 stroke(255);
 noSmooth();

 // Initialization of cells
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   float state = random(100);
   if (state > probabilityOfFoxAtStart + probabilityOfRabAtStart) {
    state = 0; // empty
   } else if (state < probabilityOfFoxAtStart) {
    state = 1; // fox
   } else {
    state = 2; // rabbit
   }
   cells[x][y] = int(state); // Save state of each cell
  }
 }
 background(255);
}


void draw() {
 //Draw grid
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   if (cells[x][y] == 1) {
    fill(fox); // If fox
   } else if (cells[x][y] == 2) {
    fill(rab); // If rabbit
   } else {
    fill(empt); // If empty
   }
   rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
 }
 // Iterate if timer ticks
 if (millis() - lastRecordedTime > interval) {
  if (!pause) {
   iteration();
   lastRecordedTime = millis();
  }
 }
}


void iteration() { // When the clock ticks
 // Save cells to buffer (so we operate with one array keeping the other intact)
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   cellsBuffer[x][y] = cells[x][y];
  }
 }

 // Visit each cell:
 for (int x = 0; x < width / cellSize; x++) {
  for (int y = 0; y < height / cellSize; y++) {
   // And visit all the neighbours of each cell
   int nFox = 0; // We'll count the neighbours
   int nRab = 0;
   for (int xx = x - 1; xx <= x + 1; xx++) {
    for (int yy = y - 1; yy <= y + 1; yy++) {
     if (((xx >= 0) && (xx < width / cellSize)) && ((yy >= 0) && (yy < height / cellSize))) { // Make sure you are not out of bounds
      if (!((xx == x) && (yy == y))) { // Make sure to to check against self
       if (cellsBuffer[xx][yy] == 1) {
        nFox++; // Check alive neighbours and count them
       } else if (cellsBuffer[xx][yy] == 2) {
        nRab++;
       }
      }
     }
    } 
   } 
   // We've checked the neigbours: apply rules!
   if (cellsBuffer[x][y] == 2) { // The cell is a rabbit
    if (random(1) < pow((1 - df), nFox)) {
     cells[x][y] = 2; // Hunt failed, cell stays as prey
    } else {
     if (random(1) < bf) {
      cells[x][y] = 1; // Cell becomes predator by breeding
     }
    }
   } else if (cellsBuffer[x][y] == 1) { // The cell is a fox
    if (random(1) < df) {
     cells[x][y] = 0; // predator death
    } else {
     cells[x][y] = 1; // remain predator
    }
   } else if (cellsBuffer[x][y] == 0) { // The cell is empty 
    //println(random(1) > pow((1-br), nRab));
    //println(nRab);
    if (nFox != 0 || nRab == 0) {
     cells[x][y] = 0; // cell remains empty
     //println(nFox, nRab);
    } else {
     if (random(1) > pow((1 - br), nRab)) {
      cells[x][y] = 2; // becomes prey by breeding
     }
    }
   }
  }
 }
}
