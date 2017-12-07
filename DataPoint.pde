class DataPoint{
  String label;
  float value;
  float percentage;
  
  float startAngle;
  float endAngle;
  
  float centerX, centerY, rad, innerRad;
  
  boolean contains(float x, float y){
    float deltaX = x - centerX;
    float deltaXSquared = deltaX * deltaX;
    float deltaY = y - centerY;
    float deltaYSquared = deltaY * deltaY;
    float radSquared = rad*rad;
    float innerRadSquared = innerRad * innerRad;
    if(innerRadSquared < deltaXSquared + deltaYSquared){
      if(radSquared >= deltaXSquared + deltaYSquared){
        double cos = deltaX / Math.sqrt(deltaXSquared + deltaYSquared);
        double theta = Math.acos(cos);
        if(deltaY < 0){
          theta = 2 * PI - theta;  
        }
        if(theta <= endAngle && theta >= startAngle){
          return true;
        }  
      }  
    }
    return false;
  }
}