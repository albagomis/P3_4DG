//Gràfica Interactiva_Alba Gomis

import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
boolean toggleColors = false;
int[] rotations = {0, 0, 0, 0, 0, 0, 0, 0, 0};
color backgroundColor, moduleColor;
boolean savePDF = false;

void setup() {
  size(600, 600);
  //backgroundColor = color(59, 166, 177);  // Blau cel
  //backgroundColor = color(210, 215, 70);  // Verd
  backgroundColor = color(250, 112, 104);  // Rosa
  moduleColor = color(33, 39, 58);       // Blau obscur

  cp5 = new ControlP5(this);

  // Toggle. canvi de colors
  cp5.addToggle("toggleColors")
    .setPosition(20, 20)
    .setSize(35, 20)
    .setValue(false)
    .setCaptionLabel("Color");

  // Sliders. rotació de cada módul
  for (int i = 0; i < 9; i++) {
    cp5.addSlider("rotacion" + i)
      .setPosition(20, 80 + i * 30)
      .setSize(150, 15)
      .setRange(0, 3)  // 4 posicions
      .setValue(0)
      .setCaptionLabel("Rotar " + (i + 1))
      .setSliderMode(ControlP5.HORIZONTAL)
      .setNumberOfTickMarks(4);
  }

  // Botons de guardat en .png i .pdf
  int buttonWidth = 100;
  int buttonHeight = 30;
  int buttonY = height - buttonHeight - 20;

  cp5.addButton("savePNG")
    .setPosition(width / 2 - buttonWidth - 10, buttonY) 
    .setSize(buttonWidth, buttonHeight)
    .setCaptionLabel("Guardar  .PNG");

  cp5.addButton("savePDF")
    .setPosition(width / 2 + 10, buttonY)  
    .setSize(buttonWidth, buttonHeight)
    .setCaptionLabel("Guardar  .PDF");
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "modul_alba-####.pdf");
  }

  // Colors segons la posició del toggle
  background(toggleColors ? moduleColor : backgroundColor);
  color c = toggleColors ? backgroundColor : moduleColor;

  // Dibuix dels 9 móduls
  int cols = 3, rows = 3;
  float moduleSize = width / cols;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int idx = i * cols + j;
      pushMatrix();
      translate(j * moduleSize, i * moduleSize); 
      drawModule(moduleSize, c, rotations[idx]); 
      popMatrix();
    }
  }

  if (savePDF) {
    endRecord();
    savePDF = false;
  }
}

void drawModule(float size, color c, int rotationStep) {
  noStroke();
  fill(c);
  pushMatrix();
  
  // Posició del módul
  switch(rotationStep) {
    case 0:  // Cantó superior esquerre
      arc(0, 0, size * 2, size * 2, 0, HALF_PI);
      break;
    case 1:  // Cantó superior dret
      translate(size, 0);
      rotate(HALF_PI);  // Rotar 90°
      arc(0, 0, size * 2, size * 2, 0, HALF_PI);
      break;
    case 2:  // Cantó inferior dret
      translate(size, size);
      rotate(PI);  // Rotar 180°
      arc(0, 0, size * 2, size * 2, 0, HALF_PI); 
      break;
    case 3:  // Cantó inferior esquerre
      translate(0, size);
      rotate(-HALF_PI); // Rotar 270°
      arc(0, 0, size * 2, size * 2, 0, HALF_PI); 
      break;
  }
  
  popMatrix();
}

void controlEvent(ControlEvent theEvent) {
  String name = theEvent.getController().getName();

  // Detectar sliders de rotació
  if (name.startsWith("rotacion")) {
    int idx = int(name.substring(8));
    rotations[idx] = int(theEvent.getValue());
  }
}

void savePNG() {
  saveFrame("modul_alba-####.png");
}

void savePDF() {
  savePDF = true;
}
