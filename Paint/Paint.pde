boolean painted = true;
boolean bGrid = false, bEraser = false;
boolean bGrey = true, bRed = false, bGreen = false, bBlue = false;

PImage eraser, grid, pencil, gridSlate;
PFont mono;

color c = color(74, 74, 74);

void setup(){
  size(1000, 600);
  background(255);
  noStroke();
  init();
}

void draw(){
  fill(180);
  drawUI();
  UIActions();
}

void drawUI(){
  fill(#E7E7E7);
  noStroke();
  rect(10, 10, 980, 80, 10);
  fill(0);
  textFont(mono);
  text("GraphicDraw", 50, 55);
  
  //Grid
  image(grid, 550, 32);
  
  //Eraser
  image(eraser, 720, 35);
  
  //Colors
  fill(c);
  stroke(0);
  strokeWeight(2);
  circle(630, 50, 35);
  
  noStroke();
  fill(74, 74, 74);
  circle(780, 50, 30);
  
  fill(200, 43, 43);
  circle(820, 50, 30);
  
  fill(72, 218, 72);
  circle(860, 50, 30);
  
  fill(45, 45, 236);
  circle(900, 50, 30);
}

void UIActions(){
  //Grid
  if(bGrid){
    image(gridSlate, 0, 108, width, height);
  }
  //
  if (bEraser) {
    colliderSlate(mouseY);
    pushMatrix();
    noStroke();
    fill(255);
    cursor(eraser);
    circle(pmouseX, pmouseY, 30);
    popMatrix();
  }
  //Colors
  if(bGrey) c = color(74, 74, 74);
  if(bRed) c = color(200, 43, 43);
  if(bGreen) c = color(72, 218, 72);
  if(bBlue) c = color(45, 45, 236);
}

void colliderSlate(int y){
  if(y < 120) painted = false;
  if(y > 120 && !bEraser) painted = true;
}

void mouseDragged(){
  stroke(c);
  colliderSlate(mouseY);
  if (painted) {
    pushMatrix();
    cursor(pencil);
    line(mouseX, mouseY, pmouseX, pmouseY);
    popMatrix();
  }
  if(!painted && !bEraser) {
    noCursor();
  }
}

void mouseMoved() {
  colliderSlate(mouseY);
  if(!painted && !bEraser) cursor(HAND);
  if(painted && !bEraser) cursor(pencil);
}

void mousePressed(){
  //
  if(mouseX>547 && mouseX<586 && mouseY>33 && mouseY<66)
    bGrid = !bGrid;
  //Borrador
  if(mouseX>719 && mouseX<749 && mouseY>33 && mouseY<66){
    bEraser = true;
    bGrey = false;
    bRed = false;
    bGreen = false;
    bBlue = false;
    painted = false;
  }
  
  //
  if(mouseX>765 && mouseX<793 && mouseY>33 && mouseY<66){
    bEraser = false;
    bGrey = true;
    bRed = false;
    bGreen = false;
    bBlue = false;
  }
  if(mouseX>805 && mouseX<835 && mouseY>33 && mouseY<66){
    bEraser = false;
    bGrey = false;
    bRed = true;
    bGreen = false;
    bBlue = false;
  }
  if(mouseX>846 && mouseX<875 && mouseY>33 && mouseY<66){
    bEraser = false;
    bGrey = false;
    bRed = false;
    bGreen = true;
    bBlue = false;
  }
  if(mouseX>887 && mouseX<915 && mouseY>33 && mouseY<66){
    bEraser = false;
    bGrey = false;
    bRed = false;
    bGreen = false;
    bBlue = true;
  }
  println(mouseX, mouseY);
}

void init(){
  eraser = loadImage("eraser.png");
  grid = loadImage("grid.png");
  pencil = loadImage("pencil.png");
  gridSlate = loadImage("gridSlate.png");
  mono = createFont("OperatorMono.otf", 24);
}
