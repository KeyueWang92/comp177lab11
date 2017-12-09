class Button {
  public String label;
  public Float x;
  public Float y;
  public Float wid = 55.0;
  public Float hgt = 30.0;
  public Button(String text, float x, float y) {
    this.label = text;
    this.x = x;
    this.y = y;
  }
  public void buttondraw(){
    strokeWeight(1);
    fill(50);
    rect(x,y,wid,hgt,5);
    fill(255);
    text(label,x+5,y+20);
  }   
}