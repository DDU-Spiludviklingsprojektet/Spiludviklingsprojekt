final static String UPGRADE_IMG = "data/svg/upgrade.svg";
final static String KASSE_TJEK_IMG = "data/svg/kasse_tjek.svg";
final static String KASSE_IMG = "data/svg/kasse.svg";
final static String BAGGRUND_IMG = "data/svg/baggrund_liftoff.svg";
final static String RAKET_HOLDER_IMG = "data/svg/raket_holder.svg";
final static String lift_off_bt = "data/svg/Lift_off.svg";
final static String BIT8_FONT = "data/font/PressStart2P-vaV7.ttf";
final static String LEFT_IMG = "data/svg/left.svg";

PFont bit8;
PShape left_img;
PShape upgrade_img;
PShape background_liftoff_img;
PShape kasse_tjek;
PShape kasse;
PShape raket_holder;
Button[][] buttons = new Button[5][5];
int[] upgrades = new int[5];
String[] upgrade_name = {"Test1","Test2","Test3","Test4","Test5"};


void upgrade_setup() {
  bit8 = createFont(BIT8_FONT, 32);
  upgrade_img = loadShape(UPGRADE_IMG);
  kasse_tjek = loadShape(KASSE_TJEK_IMG);
  kasse = loadShape(KASSE_IMG);
  background_liftoff_img = loadShape(BAGGRUND_IMG);
  raket_holder = loadShape(RAKET_HOLDER_IMG);
  left_img = loadShape(LEFT_IMG);
  // A loop to evenly space out the buttons along the window
  for (int upg = 0; upg < upgrades.length; upg++) {
    for (int i = 0; i < buttons.length; i++) {
    buttons[upg][i] = new Button(930 + (i * 65), 140 + (upg * 120), 50, 50, upg, i);
  }
  
  }
}


void upgrade() {
  background(200);
  rectMode(CORNERS);
  fill(204, 102, 0);
  shapeMode(CORNERS); 
  shape(upgrade_img, (width*0.7), 0, width, height);
  shape(background_liftoff_img, -20 , 0, (width*0.7), height);
  shapeMode(CENTER);
  shape (raket_holder, 500, 400, 200, 500);
  shape (raket_img, 467,475,384,384);
  println(left_img.width + "hjej" + left_img.height);
  shape (left_img, width/15 ,height/15,128,128);
for (int upg = 0; upg < upgrades.length; upg++)
  for (int i = 0; i < buttons.length; i++) {
    buttons[upg][i].display();
    textFont(bit8);
    textSize(20);
    fill(255);
    text(upgrade_name[upg], 930, 130 + (upg * 120));
  }
}
