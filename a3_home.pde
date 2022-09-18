float rectX, rectY;      // Position of square button
float circleX, circleY, circle2X, circle2Y;  // Position of circle button
int rectwidth;  // Diameter of rect
int rectheight;
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
float circleSize;  // Diameter of circle
color currentColor;
boolean rectOver = false;
boolean circleOver1 = false;
boolean circleOver2 = false;


float logox;
float logoy;
float logosize;
float buttonsx;
float buttonsy;
float buttonssize;

void home_setup() {
  background(200);
  rectColor = color(255, 255, 255, 0);
  rectHighlight = color(#66000000);
  circleColor = color(255, 255, 255, 0);
  circleHighlight = color(#66000000);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/2.547;
  circleY = height/1.9;
  circle2X = (width/1.643);
  circle2Y = (height/1.9);
  circleSize = width/20;
  rectX = width/1.99;
  rectY = (height/1.37)+2;
  rectwidth = 200;  // Diameter of rect
  rectheight = 60;
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void home() {
  background();
  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      image(background_img, (x*background_img.width), (y*background_img.height));
    }
  }


  shapeMode(CENTER);
  imageMode(CENTER);
  //logo.resize(width/3,width/3);
  //image(logo,((width/2)-(logo.height/2)),((height/4)-(logo.height/2)));
  image(logo_img, width/2, height/4, width/3, width/3);
  shape(buttons_img, (width/2), (height*0.7), width/3, width/3);

  update(mouseX, mouseY);
  noStroke();
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  rect(rectX, rectY, rectwidth, rectheight);
  if (circleOver1) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(circleX, circleY, circleSize, circleSize);

  if (circleOver2) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(circle2X, circle2Y, circleSize, circleSize);
}


void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver1 = true;
    circleOver2 = false;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectwidth, rectheight) ) {
    rectOver = true;
    circleOver1 = false;
    circleOver2 = false;
  } else if (overCircle(circle2X, circle2Y, circleSize)) {
    rectOver = false;
    circleOver1 = false;
    circleOver2 = true;
  } else {
    circleOver1 = circleOver2 = rectOver = false;
  }
}

void mousePressed() {
  if (menu == true && circleOver1) {
    currentColor = circleColor;
    mute = !mute;
  }
  if (menu == true && circleOver2) {
    currentColor = circleColor;
    lb();
  }
  if (menu == true && rectOver) {
    currentColor = rectColor;
    println("Upgrade");
    clear();
    menu = false;
    upgrade_page = true;
  }
  for (int upg = 0; upg < upgrades.length; upg++) {
    for (int i = 0; i < buttons.length; i++) {
      buttons[upg][i].click(mouseX, mouseY, buttons, upg);
    }
  }
}

boolean overRect(float x, float y, float width1, float height1) {
  if (mouseX >= x-width1*0.5 && mouseX <= x+width1*0.5 &&
    mouseY >= y-height1*0.5 && mouseY <= y+height1*0.5) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
