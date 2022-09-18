final static String UPGRADE_IMG = "data/svg/upgrade.svg";
final static String KASSE_TJEK_IMG = "data/svg/kasse_tjek.svg";
final static String KASSE_IMG = "data/svg/kasse.svg";
final static String BAGGRUND_IMG = "data/svg/baggrund_liftoff.svg";
final static String RAKET_HOLDER_IMG = "data/svg/raket_holder.svg";
final static String lift_off_bt = "data/svg/Lift_off.svg";
final static String BIT8_FONT = "data/font/PressStart2P-vaV7.ttf";
final static String BACK_IMG = "data/svg/back.svg";
final static String LIFT_OFF_IMG = "data/svg/lift_off.svg";

PFont bit8;
PShape back_img;
PShape upgrade_img;
PShape background_liftoff_img;
PShape kasse_tjek;
PShape kasse;
PShape raket_holder;
PShape lift_off_img;
ButtonV back_bt;
ButtonV lift_offbt;

Button[][] buttons = new Button[5][5];
int[] upgrades = new int[5];
String[] upgrade_name = {"ISP", "Power", "Drymass", "Fueldensity", "CD"};
int money = 1000;
String money_text = "Money:";
String sc1 = money_text + money;



void upgrade_setup() {
  back_img = loadShape(BACK_IMG);
  back_bt = new ButtonV(back_img, width/15, height/15, 128, 128, (width/15)+1, (height/15)-14, 122, 43, 255, 10);
  //lift_offbt = new ButtonV(width/3, height*0.97 , 192, 192, 255);
  
  bit8 = createFont(BIT8_FONT, 32);
  upgrade_img = loadShape(UPGRADE_IMG);
  kasse_tjek = loadShape(KASSE_TJEK_IMG);
  kasse = loadShape(KASSE_IMG);
  background_liftoff_img = loadShape(BAGGRUND_IMG);
  raket_holder = loadShape(RAKET_HOLDER_IMG);
  back_img = loadShape(BACK_IMG);
  //lift_off_img = loadShape(LIFT_OFF_IMG);
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
  shape(background_liftoff_img, -20, 0, (width*0.7), height);
  shapeMode(CENTER);
  shape (raket_holder, 430, 400, 400, 500);
  shape (raket_img, 467, 465, 384, 384);
  
  
  back_bt.updateV();
  back_bt.renderV();
  shape (back_img, width/15, height/15, 128, 128);
  if(back_bt.isClicked()){
  upgrade_page = false;
  menu = true;
  }
  
  
  shape (lift_off_img, width/3, height*0.97 , 192, 192);
  textFont(bit8);
  textSize(20);
  fill(0);
  text(sc1, 680, 30);

  for (int upg = 0; upg < upgrades.length; upg++)
    for (int i = 0; i < buttons.length; i++) {
      buttons[upg][i].display();
      textFont(bit8);
      textSize(20);
      fill(255);
      text(upgrade_name[upg], 930, 130 + (upg * 120));
    }
}
