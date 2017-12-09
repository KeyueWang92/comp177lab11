class Line{
  private int firstId, secondId, spring;
  private float start_x, start_y, end_x, end_y;
  
  Line(int firstId, int secondId, int spring, float start_x, float start_y, float end_x, float end_y){
    this.firstId = firstId;
    this.secondId = secondId;
    this.spring = spring;
    this.start_x = start_x;
    this.start_y = start_y;
    this.end_x = end_x;
    this.end_y = end_y;
  }
  
  public void draw_line(){
    strokeWeight(1);
    line(start_x, start_y, end_x, end_y);
  }
  
  public void set_pos(float start_x, float start_y, float end_x, float end_y){
    this.start_x = start_x;
    this.start_y = start_y;
    this.end_x = end_x;
    this.end_y = end_y;
  }
  
  public int get_firstId(){
    return firstId;
  }
  
  public int get_secondId(){
    return secondId;
  }
  
  public int get_spring(){
    return spring;
  }
}