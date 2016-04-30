int CELL_NUM = 256;
int CELL_SIZE = 10;

void setup() {
  size(2048, 2048); 
  mousePressed();
  smooth(8);
}

void draw() {
}

void keyPressed() {
  if (key == 's') {
    saveFrame("###.png");
    exit();
  }
}
void mousePressed() {
  background(255);
  stroke(0);
  strokeWeight(4);
  fill(255);

  Cell[][] cellMap = new Cell[CELL_NUM][CELL_NUM];
  ArrayList<Cell> cells = new ArrayList<Cell>();
  for (int i = 0; i < CELL_NUM; i++) {
    for (int j = 0; j < CELL_NUM; j++) {
      Cell cell = new Cell(i, j);
      cellMap[i][j] = cell;
      cells.add(cell);
    }
  }

  while (!cells.isEmpty()) {
    Cell cell = cells.remove(int(random(cells.size())));
    int up = cell.col != 0 ? cell.col - 1: CELL_NUM - 1;
    int right = cell.row != CELL_NUM - 1 ? cell.row + 1: 0;
    int down = cell.col != CELL_NUM - 1 ? cell.col + 1: 0;
    int left = cell.row != 0 ? cell.row - 1: CELL_NUM - 1;
    if (cellMap[up][cell.row].isDecided) {
      cell.states[0] = cellMap[up][cell.row].states[2];
    } else {
      cell.states[0] = random(1) < 0.5 ? true: false;
    }
    if (cellMap[cell.col][right].isDecided) {
      cell.states[1] = cellMap[cell.col][right].states[3];
    } else {
      cell.states[1] = random(1) < 0.5 ? true: false;
    }
    if (cellMap[down][cell.row].isDecided) {
      cell.states[2] = cellMap[down][cell.row].states[0];
    } else {
      cell.states[2] = random(1) < 0.5 ? true: false;
    }
    if (cellMap[cell.col][left].isDecided) {
      cell.states[3] = cellMap[cell.col][left].states[1];
    } else {
      cell.states[3] = random(1) < 0.5 ? true: false;
    }
    cell.isDecided = true;
  }

  for (int i = 0; i < CELL_NUM; i++) {
    for (int j = 0; j < CELL_NUM; j++) {
      cellMap[i][j].display();
    }
  }
}

class Cell {

  int row, col;
  boolean isDecided;
  boolean[] states; // up left, up right, down right, down left

  Cell(int col, int row) {
    this.row = row;
    this.col = col;
    isDecided = false;
    states = new boolean[4];
    for (int i = 0; i < 4; i++) {
      states[i] = false;
    }
  }

  void display() {
    pushMatrix();
    float cellHalf = CELL_SIZE / 2.0;
    translate(row * CELL_SIZE + cellHalf, col * CELL_SIZE + cellHalf); 
    if (states[0]) {
      rect(0, 0, -cellHalf, -cellHalf);
    }
    if (states[1]) {
      rect(0, 0, cellHalf, -cellHalf);
    }
    if (states[2]) {
      rect(0, 0, cellHalf, cellHalf);
    }
    if (states[3]) {
      rect(0, 0, -cellHalf, -cellHalf);
    }
    popMatrix();
  }
}