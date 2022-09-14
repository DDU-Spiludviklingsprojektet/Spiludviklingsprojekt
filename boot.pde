//Bootscreen/loading screen at the start
void boot(){
  //noCursor();
  background(200); 
  rectColor = color(255, 255, 255, 0);
  rectHighlight = color(17,0.9);
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/2.547;
  circleY = height/1.9;
  circle2X = (width/1.643);
  circle2Y = (height/1.9);
  circleSize = width/20;
  rectX = width/1.99;
  rectY = height/1.37;
  rectwidth = 200;  // Diameter of rect
  rectheight = 60;
  rectMode(CENTER);
  ellipseMode(CENTER);
}
