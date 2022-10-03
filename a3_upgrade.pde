//String variable is declared to store the parth to files used in the program.
final static String UPGRADE_IMG = "data/svg/upgrade.svg";
final static String KASSE_TJEK_IMG = "data/svg/kasse_tjek.svg";
final static String KASSE_IMG = "data/svg/kasse.svg";
final static String BAGGRUND_IMG = "data/svg/baggrund_liftoff.svg";
final static String RAKET_HOLDER_IMG = "data/svg/raket_holder.svg";
final static String lift_off_bt = "data/svg/Lift_off.svg";
final static String BIT8_FONT = "data/font/PressStart2P-vaV7.ttf";
final static String BACK_IMG = "data/svg/back.svg";
final static String LIFT_OFF_IMG = "data/svg/lift_off.svg";

//Makes variables for images, fonts and buttons
PFont bit8;
PShape back_img;
PShape upgrade_img;
PShape backgro_img;
PShape kasse_tjek;
PShape kasse;
PShape raket_holder;
PShape lift_off_img;
Button_rect back_bt;
Button_rect lift_offbt;

//Creates doubble array for storing the upgrades
Button_upg[][] buttons = new Button_upg[5][5];
int[] upgrades = new int[5];
String[] upgrade_name = {"ISP", "Power", "Drymass", "Fueldensity", "CD"};

//Start variables
int money = 200;
String money_text = "Money:";
String sc1 = money_text + money;

//The void setup for the upgrade menu
void upgrade_setup() {
  background(200);
  //loads shapes and fonts
  back_img = loadShape(BACK_IMG);
  bit8 = createFont(BIT8_FONT, 32);
  upgrade_img = loadShape(UPGRADE_IMG);
  kasse_tjek = loadShape(KASSE_TJEK_IMG);
  kasse = loadShape(KASSE_IMG);
  backgro_img = loadShape(BAGGRUND_IMG);
  raket_holder = loadShape(RAKET_HOLDER_IMG);
  back_img = loadShape(BACK_IMG);
  lift_off_img = loadShape(LIFT_OFF_IMG);

  //Loads buttons - Back and lift off
  back_bt = new Button_rect(back_img, width/15, height/15, 128, 128, (width/15)+1, (height/15)-14, 122, 43, 255, 10);
  lift_offbt = new Button_rect(lift_off_img, width/3, height*0.97, 192, 192, width/2.995, (height*0.97)-20, 178, 70, 255, 10);

  // Places buttons for upgrade menu
  for (int upg = 0; upg < upgrades.length; upg++) {
    for (int i = 0; i < buttons.length; i++) {
      buttons[upg][i] = new Button_upg(930 + (i * 65), 140 + (upg * 120), 50, 50, upg, i);
    }
  }
}

//The void draw for the upgrade menu
void upgrade() {
  background(200);
  //Places bacground images. Both for upgrade and for landscape
  shapeMode(CORNERS);
  shape(upgrade_img, (width*0.7), 0, width, height);
  shape(backgro_img, 0, 0, 896, 720);
  //Places rocket
  shapeMode(CENTER);
  shape (raket_holder, 430, 400, 400, 500);
  shape (raket_img, 467, 465, 384, 384);

  //Back button updater, render and to check if it has been clicked
  back_bt.update_rect();
  back_bt.farve();
  back_bt.render();
  lift_offbt.update_rect();
  lift_offbt.farve();
  lift_offbt.render();

  if (back_bt.isClicked()) {
    clear();
    upgrade_page = false;
    menu = true;
  }
  if (lift_offbt.isClicked()) {
    clear();
    upgrade_page = false;
    game_setup();
      game = true;
  }

  //Makes text fore Money
  String sc1 = money_text + money;
  textFont(bit8);
  textSize(20);
  fill(0);
  text(sc1, 680, 30);


  //Makes text above eache array of buttons
  for (int upg = 0; upg < upgrades.length; upg++)
    for (int i = 0; i < buttons.length; i++) {
      buttons[upg][i].display();
      textFont(bit8);
      textSize(20);
      fill(255);
      text(upgrade_name[upg], 930, 130 + (upg * 120));
    }
}

//When the mouse is pressed, calculates which button is clicked
void mousePressed() {
  for (int upg = 0; upg < upgrades.length; upg++) {
    for (int i = 0; i < upgrades.length; i++) {
      buttons[upg][i].click(mouseX, mouseY, buttons, upg);
    }
  }
}
