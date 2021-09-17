int startX = 200;
int startY = 200;

int endX = 200;
int endY = 200;

int posX = 200;
int posY = 200;

int posX2 = 200;
int posY2 = 200;

int colorR = 100;
int colorG = 200;
int colorB = 100;
PGraphics pg;

void setup() {
  size(400, 400);
  strokeWeight(12);
  pg = createGraphics(400, 400);
}
void draw() {
  if (mouseX - posX > 0)
    posX = posX + 2;
  if (mouseX - posX < 0)
    posX = posX - 2;
  if (mouseY - posY > 0)
    posY = posY + 2;
  if (mouseY - posY < 0) {
    posY = posY - 2;
  }
  posX2 = 400 - posX;
  posY2 = 400 - posY;
  colorR = colorR + (int) (Math.random()*20-10);
  if (colorR > 100) {
    colorR -= 10;
  }
  if (colorR < 0){
    colorR = 0;
  }
  colorG = colorG + (int) (Math.random()*40-20);
  if (colorG > 200) {
    colorG -= 20;
  }
  if (colorG < 0){
    colorG = 0;
  }
  colorB = colorB + (int) (Math.random()*20-10);
  if (colorB > 100) {
    colorB -= 10;
  }
  if (colorB < 0){
    colorB = 0;
  }
  pg.beginDraw();
  pg.background(0, 10);
  pg.fill(colorR, colorG, 255);
  pg.noStroke();
  pg.ellipse(posX, posY, 10, 10);
  pg.fill(255,colorG,colorB);
  pg.ellipse(posX2, posY2, 10,10);
  pg.stroke(colorR, colorG, 255);
  pg.endDraw();
  image(pg, 0, 0);
  stroke(colorR, colorG, 255);
}

void mousePressed() {
  startX = posX;
  startY = posY;
  endX = mouseX;
  endY = mouseY;
  while (startX != mouseX || startY != mouseY) {
    if (mouseX - startX > 0) {
      endX = startX + (int) (Math.random()*20);
    } else {
      endX = startX - (int) (Math.random()*20);
    }
    if (mouseY - startY > 0) {
      endY = startY + (int) ((Math.random()*20));
    } else {
      endY = startY  - (int) ((Math.random()*20));
    }
    stroke(colorR,colorG,255);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
  startX = posX2;
  startY = posY2;
  endX = 400 - mouseY;
  endY = 400 - mouseY;
  while (startX != 400 - mouseX || startY != 400 - mouseY) {
    if (400 - mouseX - startX > 0) {
      endX = startX + (int) (Math.random()*20);
    } else {
      endX = startX - (int) (Math.random()*20);
    }
    if (400 - mouseY - startY > 0) {
      endY = startY + (int) ((Math.random()*20));
    } else {
      endY = startY  - (int) ((Math.random()*20));
    }
    stroke(255,colorG,colorB);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
  posX = mouseX;
  posY = mouseY;
  posX2 = 400 - mouseX;
  posY2 = 400 - mouseY;
  stroke(colorR,colorG,255);
  fill(colorR, colorG, 255);
  ellipse(posX, posY, 25, 25);
  stroke(255,colorG,colorB);
  fill(255,colorG,colorB);
  ellipse(posX2,posY2,25,25);
}
