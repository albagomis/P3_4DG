void setup() {
  size(600, 600);
  background(33, 39, 58); // Blau obscur
  //background (59, 166, 177);  // Blau cel
  //background (210, 215, 70);  // Verd
  fill (250, 112, 104);  // Rosa
  noStroke();
  noLoop();
}

void draw() {
  float modulsize = width / 3;
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      
      float x = j * moduleSize + moduleSize / 2;
      float y = i * moduleSize + moduleSize / 2;
      
      arc(x - moduleSize / 2, y - moduleSize / 2, moduleSize * 2, moduleSize * 2, 0, HALF_PI);  
    }
  }
}
