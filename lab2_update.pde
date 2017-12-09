String[] lines;
String[] headers;
String[] names;
int[] values;
float ratio = 0.85;
int maxvalue;
int count;
Bar[] bs;
public static final color nor_color = #FF0000;
public static final color light_color = #222222;
class Graph {
  float xor;
  float yor;
  float w;
  float h;
  float max_y;
  Graph(float x, float y, float wid, float hgt) {
    xor = x;
    yor = y;
    w = wid;
    h = hgt;
    max_y = Float.MAX_VALUE;
  }
  void drawGraph() {
    line(xor, height - yor, xor+w, height - yor);
    line(xor, height - yor, xor, height - yor - h);
  }
  void drawlines() {
    int value = maxvalue;
    float interval = 0;
    interval = ((height - yor) - max_y) / maxvalue;
    for(float curr_y = max_y; curr_y < (height - yor); curr_y = curr_y + interval * 10) {
      text(Integer.toString(value),xor - 40, curr_y);
      line(xor, curr_y, xor + w, curr_y);
      value = value  - 10;
    }
  }
}

class Bar {
  String text;
  String id;
  int value;
  float wid;
  float hgt;
  float xor;
  float yor;
  color c;
  Bar(String s, int v, int nth, int amount) {
    text = "";
    id = s;
    value = v;
    /* wid = (1-(1-ratio)*2) * width / amount /2;
    hgt = (1-(1-ratio)*2) * height * v / maxvalue ;
    xor = (width * (1-ratio) + width * ((1-(1-ratio)*2) / amount /2) * (nth * 2 - 1));
    yor = height * ratio - (1-(1-ratio)*2) * height * v / maxvalue ; */
    c = nor_color;
  }
  void updateBar(int amount, int nth) {
    wid = (1-(1-ratio)*2) * width / amount /2;
    hgt = (1-(1-ratio)*2) * height * value / maxvalue ;
    xor = (width * (1-ratio) + width * ((1-(1-ratio)*2) / amount /2) * (nth * 2 - 1));
    yor = height * ratio - (1-(1-ratio)*2) * height * value / maxvalue ; 
  }
  void drawlabel(){
    pushMatrix();
    translate(xor,height * ratio + 5);
    rotate(HALF_PI);
    translate(-xor,-(height * ratio + 5));
    text(id,xor, height * ratio + 5);
    popMatrix();
  }
  void drawhoverinfo() {
   text(text, xor + (wid/2), yor - 24); 
  }
  void drawbar(){
    rect(xor, yor, wid, hgt);
  }
}
void setup() {
   surface.setResizable(true);
   size(800,600);
   lines = loadStrings("./data.csv");
   headers = split(lines[0], ",");
   names = new String[lines.length - 1];
   values = new int[lines.length - 1];
   for(int i = 1; i < lines.length; i++){
      String[] data = split(lines[i], ",");
      names[i - 1] = data[0];
      values[i - 1] = int(data[1]);
   }
   bs = new Bar[names.length];
    for (int i = 0; i < names.length; i++){
      bs[i] = new Bar(names[i], values[i], i+1, count);
  }
}
void draw() {
  background(#ffffff);
  Graph g = new Graph(width * (1-ratio), height * (1-ratio), width-(1-ratio)*2*width, height-(1-ratio)*2*height);
  g.drawGraph();
  maxvalue = 0;
  count = names.length;
  for (int i = 0; i < names.length; i++){
    maxvalue = Math.max(maxvalue, values[i]);
  }
  for (int i = 0; i < names.length; i++){
      bs[i].xor = g.xor;
      bs[i].yor = g.yor;
      bs[i].updateBar(names.length, i + 1);
      fill(bs[i].c);
      bs[i].drawbar();
      textAlign(CENTER);
      bs[i].drawhoverinfo();
      textAlign(LEFT);
      fill(#000000);
      bs[i].drawlabel();
      if(bs[i].yor < g.max_y){
        g.max_y = bs[i].yor;
      }
  }
  textAlign(LEFT);
  g.drawlines();
}

void mouseMoved() {
 for(int i = 0; i < names.length; i++) {
  if(mouseX >= bs[i].xor && mouseX <= (bs[i].xor + bs[i].wid) && mouseY >= bs[i].yor && mouseY <= (bs[i].yor + bs[i].hgt)) {
    bs[i].c = light_color;
    textAlign(CENTER);
    bs[i].text = bs[i].id + '\n' + bs[i].value;
  }
  else {
    textAlign(LEFT);
    bs[i].c = nor_color; 
    bs[i].text = "";
  }
 }
}