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
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      arc(j * 200 + 200 / 2 - 200 / 2, i * 200 + 200 / 2 - 200 / 2, 200 * 2, 200 * 2, 0, PI/2);
    }
  }
}
