class Button {
  int c1;
  int x;
  int y;
  
  int colors[] = {#ff0000, #cc33ff, #ffff00};
  int cycle;
  String texts[] = {"Click for Donut Chart", "Click for Pie Chart"};
  int scale[] = {1, 1, 1};
  int upperBound;
  int lowerBound;
  int leftBound;
  int rightBound;
  int buttonWidth;
  int buttonHeight;
  
  Button (int x, int y, int buttonWidth, int buttonHeight) {
    cycle = 0;
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    setBounds(cycle);
    rectMode(CENTER);
    
  }
  
  void render() {
    pushStyle();
    
    fill(colors[cycle]);
    rect(x, y, buttonWidth / scale[cycle], buttonHeight / scale[cycle], 15.0);
    fill(0);
    textSize(14);
    textAlign(CENTER, CENTER);
    text(texts[cycle], x, y);   
    popStyle();
  }
  
  
  
  void toggle() {
    cycle = (cycle + 1) % 2;
    setBounds(cycle);
  }
  
  private void setBounds(int cycle) {
    int xLength = buttonWidth / scale[cycle];
    int yLength = buttonHeight / scale[cycle];
    upperBound = y - yLength / 2;
    lowerBound = y + yLength / 2;
    leftBound = x - xLength / 2;
    rightBound = x + xLength / 2;
  }
  
}