float rectX, rectY;      // Position of square button
float circleX, circleY, circle2X, circle2Y;  // Position of circle button
int rectwidth;  // Diameter of rect
int rectheight;
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
float circleSize;  // Diameter of circle
color currentColor;
boolean rectOver = false;
boolean circleOver = false;



float logox;
float logoy;
float logosize;
float buttonsx;
float buttonsy;
float buttonssize;

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
  if (rectOver) {
    fill(#66000000);
  } else {
    fill(rectColor);
  }

  stroke(255);
  rect(rectX, rectY, rectwidth, rectheight);

  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
  ellipse(circle2X, circle2Y, width/20, width/20);
}
void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectwidth, rectheight) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (menu == true && circleOver) {
    currentColor = circleColor;
    mute = !mute;
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
