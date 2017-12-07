
class PieChart{
 
  DataPoint[] data;
  float MAX_RAD = 2 * PI;
  float DONUT_RADIUS;
  float ANIMATION_FRAMES = 50;
  float innerRad = 0.0;
  
  void draw(float centerX, float centerY, float diameter, color backgroundColor, boolean drawDonut){
    float hueIncrement = 255 / data.length;
    float arcHue = 0;
    float startAngle = 0;
    int j = -1;
    //float innerRad = drawDonut ? diameter/3.0 : 0.0;
    for(int i = 0; i < data.length; i++){      
      float nextAngle = data[i].percentage * MAX_RAD + startAngle;
      DONUT_RADIUS = diameter/ 3.0;
      data[i].startAngle = startAngle;
      data[i].endAngle = nextAngle;
      data[i].centerX = centerX;
      data[i].centerY = centerY;
      data[i].rad = diameter/2.0;
      data[i].innerRad = innerRad/2.0;
      if(data[i].contains(mouseX, mouseY)){
        fill(255.0/2.0);
        j = i;       
        arc(centerX, centerY, diameter*1.1, diameter*1.1, startAngle, nextAngle, PIE);
      }else{        
        fill(color(arcHue+hueIncrement*i, 100, 255));
        arc(centerX, centerY, diameter, diameter, startAngle, nextAngle, PIE);
        //fill(255);
      }
      //todo - update this to draw more efficiently
      
      //arc(centerX, centerY, diameter, diameter, startAngle, nextAngle, PIE);  
      startAngle = nextAngle; 
    }
    if(drawDonut){
      fill(backgroundColor);
      if (innerRad < DONUT_RADIUS) {
        innerRad += DONUT_RADIUS / ANIMATION_FRAMES;
      }
      ellipse(centerX, centerY, innerRad, innerRad); 
    } else if (innerRad > 0){
      fill(backgroundColor);
      innerRad -= DONUT_RADIUS / ANIMATION_FRAMES;
      ellipse(centerX, centerY, innerRad, innerRad);
    }
    if(j >= 0){
       drawLabel(data[j]);  
    }
  }
  
  void drawLabel(DataPoint point){
    int fontSize = 12;
    textSize(fontSize);
    String label = "("+point.label+" - "+point.value+")";
    rectMode(CENTER);
    fill(255);
    float rectHeight = 1.25 * fontSize;
    rect(mouseX,mouseY - rectHeight/2, textWidth(label) * 1.05, rectHeight);
    textAlign(CENTER,BOTTOM);
    fill(0);
    text(label, mouseX, mouseY);
  }
  
}