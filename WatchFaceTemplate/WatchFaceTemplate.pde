DateTimeManager dateTimeManager;

void setup() {
  size(400,400);
  stroke(255);
  smooth();
  frameRate(30);
  
  dateTimeManager = new DateTimeManager();
}

void draw() {
  background(0);  // Black
  
  // Set (0, 0) to center of the round display 
  translate(width / 2, height / 2);

  dateTimeManager.printDateDigital();
  dateTimeManager.printTimeDigital();
  //dateTimeManager.printTimeAnalog(0xFFFFFF, 0xFF0000, new Dial_3_6_9_12(0x00FF00));
}
