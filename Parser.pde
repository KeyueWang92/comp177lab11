import java.util.*;

class Parser{
  public HashMap<Integer, Integer> mass_map; //id - mass
  public int[][] edge_map; //[id, id] - spring
  public int maxid;
  public Parser(String filename){
    maxid = 0;
    mass_map = new HashMap<Integer, Integer>();
    String[] lines;
    int count1, count2;
    lines = loadStrings(filename);
    count1 = int(lines[0]);
    int iterate = 1;
    for (int i = 0; i < count1; i++) {
      String[] data = split(lines[iterate], ",");
      if (maxid < int(data[0])) maxid = int(data[0]);
      if (maxid < int(data[1])) maxid = int(data[1]);
      mass_map.put(int(data[0]), int(data[1]));
      iterate++;
    }
    count2 = int(lines[iterate]);
    iterate++;
    edge_map = new int[maxid+1][maxid+1];
    for (int i = 0; i < count2; i++) {
      String[] data = split(lines[iterate], ",");
      edge_map[int(data[0])][int(data[1])] = int(data[2]);
      iterate++;
    }
  }
}