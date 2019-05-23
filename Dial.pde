public class Dial {
  int colorHex;
  
  public Dial(int colorHex) {
    this.colorHex = colorHex;
  }
  
  public Dial() {
    this(0x00FF00);
  }
  
  public void print() {
    strokeWeight(3);
    stroke(
      (this.colorHex>>16) & 0xFF,
      (this.colorHex>>8)  & 0xFF,
       this.colorHex      & 0xFF
    );
    for (int i = 0; i < 12; ++i) {
      if (i % 3 == 0) strokeWeight(6);
      else strokeWeight(3);
      
      line(0, 150, 0, 160);
      rotate(PI / 6);
    }
    strokeWeight(1);  // set to default
  }
  
  public void setColorHex(int colorHex) {
    this.colorHex = colorHex;
  }
}

public class Dial_3_6_9_12 extends Dial {
  public Dial_3_6_9_12(int colorHex) {
    super(colorHex);
  }
  
  public Dial_3_6_9_12() {
    super();
  }
  
  @Override
  public void print() {
    // edge
    strokeWeight(3);
    stroke(
      (colorHex>>16) & 0xFF,
      (colorHex>>8)  & 0xFF,
       colorHex      & 0xFF
    );
    
    for (int i = 0; i < 12; ++i) {
      if (i % 3 != 0) {
        strokeWeight(3);
        line(0, 150, 0, 160);
      }
      rotate(PI / 6);
    }
    strokeWeight(1);  // set to default
    
    
    // number 3, 6, 9, 12
    fill(
      (this.colorHex>>16) & 0xFF,
      (this.colorHex>>8)  & 0xFF,
       this.colorHex      & 0xFF
    );
    
    textAlign(CENTER);
    textSize(35);
    text("12",   0, -145); 
    text("3",  145,    0); 
    text("6",    0,  145); 
    text("9", -145,    0); 
  }
}
