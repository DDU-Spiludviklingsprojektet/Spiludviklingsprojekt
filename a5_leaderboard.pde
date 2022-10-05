//Creates the data for the leaderboard
//Due to time constraints, the implementation of this function is not complete.
final static String LBBACK_IMG = "data/svg/lb_background.svg";
PShape leadback_img;
Button_rect back_bt3;
StringList navne;

//setup to leaderboard
void lb() {
  background(200);
  leadback_img = loadShape(LBBACK_IMG);
  shapeMode (CORNERS);
  shape(leadback_img, 0, 0, 1280, 720);

  //creates button
  back_bt3 = new Button_rect(empty_img, 100, 100, 200, 60, width/2, height/1.08, 480, 65, 255, 0);
  back_bt3.update_rect();
  back_bt3.farve();
  back_bt3.render();

  if (back_bt3.isClicked()) {
    clear();
    lb = false;
    menu = true;
  }
}
