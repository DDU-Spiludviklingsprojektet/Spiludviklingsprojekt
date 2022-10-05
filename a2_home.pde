//String variable is declared to store the parth to files used in the program.
final static String BACKGROUND_IMG = "data/svg/forside_baggrund.svg";
final static String LOGO_IMG = "data/img/logo.png";
final static String BUTTONS_IMG = "data/svg/buttons.svg";
final static String BUTTONS_RED_IMG = "data/svg/buttons_red.svg";
final static String EMPTY_IMG = "data/svg/empty.svg";

//Makes variables for shape and images
PShape background_img;
PImage logo_img;
PShape buttons_img;
PShape empty_img;

//Variables for buttons
Button_rect start_bt;
Button_ell lb_bt;
Button_ell mute_bt;

void home_setup() {
  //Loads shapes and images
  background_img = loadShape(BACKGROUND_IMG);
  logo_img = loadImage(LOGO_IMG);
  buttons_img = loadShape(BUTTONS_IMG);
  empty_img = loadShape(EMPTY_IMG);

  //Creates buttons
  start_bt = new Button_rect(empty_img, 100, 100, 200, 60, width/1.99, height/1.365, 200, 60, 255, 0);
  lb_bt = new Button_ell(width/1.642, height/1.89, 70, 70);
  mute_bt = new Button_ell(width/2.544, height/1.89, 65, 65);
}

void home() {
  //Places images and shapes
  shapeMode(CORNERS);
  shape(background_img, 0, 0, width, height);
  shapeMode(CENTER);
  imageMode(CENTER);
  image(logo_img, width/2, height/4, width/3, width/3);
  shape(buttons_img, (width/2), (height*0.7), width/3, width/3);

  //If statments for the three buttons
  if (start_bt.isClicked()) {
    clear();
    menu = false;
    upgrade_page = true;
  }
  
  if (mute_bt.isClicked()) {
    mute();
  }
  
  if (lb_bt.isClicked()) {
    lb = true;
  }

  //Update, render and farve function for the three buttons. To react when clicked. To make the collored when hovering and render button
  start_bt.update_rect();
  start_bt.farve();
  start_bt.render();
  lb_bt.update_ell();
  lb_bt.farve();
  lb_bt.render();
  mute_bt.update_ell();
  mute_bt.farve();
  mute_bt.render();
}

//Function for mute.
void mute() {
  if (mute == false) {
    menu_sound.amp(0.0);
    mute = true;
    buttons_img = loadShape(BUTTONS_RED_IMG);
  } else if (mute == true) {
    menu_sound.amp(1.0);
    mute = false;
    buttons_img = loadShape(BUTTONS_IMG);
  }
}
