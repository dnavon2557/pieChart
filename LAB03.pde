

//determine percentage for each data point
// then map to an angle radians or degrees?


//read in data
//keep a running tab of the sum of all of the data 
//qq - do we have to read in negative values? 
PieChart chart;
boolean drawDonut;
Button b;

void setup(){
  size(800,800);
  surface.setResizable(true);
  pixelDensity(displayDensity());
  colorMode(HSB);
  String[] lines = loadStrings("./data.csv");
  String[] headers = split(lines[0], ",");
 
  float sum = 0;
  if(lines.length > 1){
    DataPoint[] points = new DataPoint[lines.length-1];
    for(int i = 1; i < lines.length; i++){
       String[] row = lines[i].split(",");
       String name = row[0];
       float value = float(row[1]); 
       DataPoint point = new DataPoint();
       point.label = name;
       point.value = value;
       points[i-1] = point;
       sum += value;
     }
     for(int j = 0; j < points.length; j++){
       points[j].percentage = points[j].value/sum;  
     }

     chart = new PieChart();
     chart.data = points; 
     b = new Button(int(width * 0.20), int(height * 0.1), int(width * 0.25), int(height *0.075));
     
  }
  drawDonut = false;
}

void keyPressed(){
  //drawDonut = !drawDonut;  
}

void mouseClicked() {
  if (mouseX > b.leftBound && mouseX < b.rightBound && mouseY > b.upperBound && mouseY < b.lowerBound) {
    b.toggle();
    drawDonut = !drawDonut;
  }
}
//color backgroundColor = color(255, 80, 50);
color backgroundColor = color(255, 255, 255);
void draw(){
  background(backgroundColor);
  chart.draw(width/2, height/2, .75 * min(width, height), backgroundColor, drawDonut);
  b.render();
}