class DateTimeManager {
  /* ------ APIs ------ */
  /* --- Digital --- */
  public void printDateDigital(int textSize, float x, float y, int colorHex) {
    textAlign(CENTER);
    fill(
      (colorHex>>16) & 0xFF,
      (colorHex>>8)  & 0xFF,
       colorHex      & 0xFF
    );
    textSize(textSize);
    text(String.format("%4d年%2d月%2d日", year(), month(), day()), x, y);
  }
  
  public void printDateDigital() {
    this.printDateDigital(20, 0, -20, 0xFFFFFF);
  }
  
  public void printTimeDigital(int textSize, float x, float y, int colorHex) {
    textAlign(CENTER);
    fill(
      (colorHex>>16) & 0xFF,
      (colorHex>>8)  & 0xFF,
       colorHex      & 0xFF
    );
    textSize(textSize);
    text(String.format("%02d時%02d分%02d秒", hour(), minute(), second()), x, y);
  }
  
  public void printTimeDigital() {
    this.printTimeDigital(40, 0,  20, 0xFFFFFF);
  }
  
  public void printDateTimeDigital(int dateColorHex, int timeColorHex) {
    this.printDateDigital(20, 0, -20, dateColorHex);
    this.printTimeDigital(40, 0,  20, timeColorHex);
  }
  
  /* --- Analog --- */
  public void printTimeAnalog(int hourMinuteColorHex, int secondColorHex, Dial dial) {
    int hour = hour() % 12;
    int minute = minute();
    int second = second();
    
    dial.print();
    this.printHand(hour   / 12.0,  96,   5, hourMinuteColorHex);
    this.printHand(minute / 60.0, 128,   3, hourMinuteColorHex);
    this.printHand(second / 60.0, 160, 1.5, secondColorHex    );
    
  }
  
  public void printTimeAnalog() {
    this.printTimeAnalog(0xFFFFFF, 0xFF0000, new Dial(0x00FF00));
  }
  
  /* --- Helper methods --- */
  protected void printHand(float ratio, float len, float weight, int colorHex) {
    rotate(TWO_PI * ratio);
    strokeWeight(weight);
    stroke(
      (colorHex>>16) & 0xFF,
      (colorHex>>8)  & 0xFF,
       colorHex      & 0xFF
    );
    line(0, 0, 0, -len);
    strokeWeight(1);  // set to default
    rotate(-TWO_PI * ratio);
  }
}
