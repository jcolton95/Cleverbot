class checkergrid {

  int rows;
  int columns;
  int sqsizex;
  int sqsizey;

  int r;
  int b;
  int g;

  checkergrid (int tempRows, int tempColumns, int tempSqSizeX, int tempSqSizeY) {
    rows = tempRows;
    columns = tempColumns;
    sqsizex = tempSqSizeX;
    sqsizey = tempSqSizeY;
  }

  void grid() {
    // translate(width/2, height/2);
    for ( int i = 0; i < width; i+=sqsizex) {
      for ( int j = 0; j < height; j+=sqsizey) {
        line(i, j, i+rows, j);
        line(i, j, i, j+columns);     
        line(i+rows, j, i+rows, j+columns);
        line(i, j+columns, i+rows, j+columns);
        //line(i, j, 10, 10);
      }
    }
  }

  void fills(int tempRed, int tempGreen, int tempBlue) {
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
    for ( int i = 0; i < width; i+=sqsizex) {
      for ( int j = 0; j < height; j+=sqsizey) {
        fill(r%50,g%25,b%75,10);
        rect(i,j,rows,columns);
      }
    }
  }
}