void textWithOutline(String text, int x, int y, color outline, color inside, float textSize) {
  fill(outline);
  textSize(textSize);
  text(text, x+1.5, y+1.5);
  text(text, x-1.5, y+1.5);
  text(text, x-1.5, y-1.5);
  text(text, x+1.5, y-1.5);

  fill(inside);
  text(text, x, y);
}
void drawDartBoard() {

  //darts board
  fill(#181A18);
  circle(width/2, height/3, 615);

  for (int i = 0; i < 20; i++) {
    float a = (-HALF_PI - PI/20) + i * (TWO_PI/20);
    color c;
    if (i % 2 == 0) {
      c = color(#935B98);
    } else {
      c = color(#22C997);
    }
    drawWedge(width/2, height/3, 240, 260, a, TWO_PI/20, c);
    drawWedge(width/2, height/3, 130, 150, a, TWO_PI/20, c);
  }

  stroke(255);
  strokeWeight(5);
  fill(#BA8C63);

  line(418, 575, width/2, height/3);
  line(337, 576, width/2, height/3);
  drawTriangle(357, 187, 391, 187);

  line(260, 550, width/2, height/3);
  line(190, 500, width/2, height/3);
  drawTriangle(437, 202, 465, 222);

  line(145, 438, width/2, height/3);
  line(120, 358, width/2, height/3);
  drawTriangle(493, 262, 503, 291);

  line(118, 279, width/2, height/3);
  line(143, 202, width/2, height/3);
  drawTriangle(503, 340, 493, 371);

  line(191, 136, width/2, height/3);
  line(255, 87, width/2, height/3);
  drawTriangle(468, 410, 438, 431);

  line(334, 64, width/2, height/3);
  line(414, 62, width/2, height/3);
  drawTriangle(394, 445, 361, 446);

  line(490, 87, width/2, height/3);
  line(557, 134, width/2, height/3);
  drawTriangle(316, 431, 286, 409);

  line(607, 200, width/2, height/3);
  line(632, 272, width/2, height/3);
  drawTriangle(258, 374, 247, 341);

  line(633, 356, width/2, height/3);
  line(607, 432, width/2, height/3);
  drawTriangle(247, 295, 257, 261);

  line(561, 497, width/2, height/3);
  line(494, 548, width/2, height/3);
  drawTriangle(284, 222, 312, 203);

  quad(340, 76, 409, 76, 395, 167, 354, 168);
  quad(486, 103, 446, 183, 479, 207, 542, 144);
  quad(610, 272, 522, 288, 512, 253, 591, 213);
  quad(510, 380, 590, 420, 612, 356, 523, 342);
  quad(446, 448, 487, 528, 545, 486, 480, 423);
  quad(357, 465, 396, 465, 411, 553, 345, 553);
  quad(266, 530, 306, 449, 272, 425, 209, 489);
  quad(162, 425, 241, 384, 228, 345, 140, 360);
  quad(139, 279, 158, 214, 239, 254, 227, 291);
  quad(303, 186, 261, 105, 206, 146, 270, 209);

  textSize(32);
  fill(255);
  textAlign(CENTER, CENTER);
  text("20", 374, 30);
  text("1", 460, 45);
  text("5", 289, 47);
  text("12", 198, 86);
  text("9", 139, 155);
  text("14", 99, 233);
  text("11", 89, 318);
  text("8", 102, 405);
  text("16", 137, 479);
  text("7", 207, 546);
  text("19", 286, 586);
  text("3", 377, 602);
  text("17", 462, 586);
  text("2", 542, 546);
  text("15", 605, 483);
  text("10", 641, 400);
  text("6", 656, 314);
  text("13", 642, 231);
  text("4", 605, 152);
  text("18", 538, 80);
  noFill();
  strokeWeight(6.7);
  circle(width/2, height/3, 520);

  //bullseye
  stroke(0);
  fill(255);
  circle(width/2, height/3, 55);
  noStroke();
  fill(#E72D24);
  circle(width/2, height/3, 25);
}


void drawWedge(float x, float y, float r1, float r2, float startAngle, float angleAdded, color colour) {
  stroke(255);
  strokeWeight(5);
  fill(colour);
  arc(x, y, r2*2, r2*2, startAngle, startAngle+angleAdded, PIE);
  fill(#181A18);
  arc(x, y, r1*2, r1*2, startAngle, startAngle+angleAdded, PIE);
}

void drawTriangle(int x, int y, int x2, int y2) {
  //just to make it faster to type(time saver)
  strokeWeight(5);
  triangle(x, y, x2, y2, width/2, height/3);
}
void setup() {
  size(750, 950);
}
color warmYellow  = #FFDF00;
color coolYellow  = #F1FF5E;
color white       = #F9F6F0;
color cyan        = #00FFFF;
color warmBlue    = #180A8F;
color coolBlue    = #0055A4;
color pink        = #FF69B4;
color darkRed = color(139, 0, 0);
//Earth Tones
color brightRed   = #FF0000;
color brightOrange= #FF5F1F;
color warmGreen   = #7BB661;
color coolGreen   = #00A86B;
//black
color black  = #000000;
void draw() {

  // background
  drawGradientRect(width/2, height/2, width, height, #BA8C63, 0);

  //dart board decoration
  pushMatrix();
  scale(0.7);
  translate(width/2-200, -320);
  drawDartBoard();
  popMatrix();


 


}
void keyPressed() {
  if (key == 's' || key == 'S') {
    save("introScreen.png"); // Saves a single image to the sketch folder
  }
}

void drawGradientRect(float cx, float cy, float w, float h, color c1, color c2) {
  noStroke();
  float x = cx - w / 2.0;  //math !! to make center top left
  float y = cy - h / 2.0;
  for (int i = 0; i < h; i++) {
    float t = map(i, 0, h, 0, 1);
    color c = lerpColor(c1, c2, t);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}
