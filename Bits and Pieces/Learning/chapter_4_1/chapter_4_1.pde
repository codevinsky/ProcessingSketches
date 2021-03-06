FloatTable data;
float dataMin, dataMax;
float plotX1, plotY1, plotX2,plotY2;
int currentColumn = 0;
int columnCount;
int yearMin, yearMax;
int[] years;

PFont plotFont;

void setup() {
  size(720,405);
  data = new FloatTable("milk-tea-coffee.tsv");
  columnCount = data.getColumnCount();
  years = int(data.getRowNames());
  yearMin = years[0];
  yearMax = years[years.length-1];
 
  dataMin = 0;
  dataMax = data.getTableMax();
 
   //Corners of the plotted time series
  plotX1 = 50;
  plotX2 = width - plotX1;
  plotY1 = 60;
  plotY2 = height - plotY1;
  
  plotFont = createFont("SansSerif",20);
  textFont(plotFont);
  
  
  smooth();
}

void draw() {
  
  background(224);
  
  //show the plot areas a white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);
  
  //draw the title fo the current plot
  fill(0);
  textSize(20);
  String title = data.getColumnName(currentColumn);
  text(title,plotX1, plotY1 -10);
  
  
  strokeWeight(5);
  //draw the data for the first column
  stroke(#5679C1);
  drawDataPoints(currentColumn);
}

void keyPressed() {
  if (key == '[') {
    currentColumn--;
    if (currentColumn < 0) {
      currentColumn = columnCount - 1;
    }
  } else if (key == ']') {
    currentColumn++;
    if (currentColumn == columnCount) {
      currentColumn = 0;
    }
  }
}

void drawDataPoints(int col) {
 int rowCount = data.getRowCount();
for (int row = 0; row < rowCount; row++) {
   if (data.isValid(row,col)) {
       float value = data.getFloat(row,col);
       float x = map(years[row],yearMin,yearMax,plotX1, plotX2);
       float y = map(value, dataMin,dataMax, plotY2, plotY1);
       point(x,y);
     }
  } 
}


