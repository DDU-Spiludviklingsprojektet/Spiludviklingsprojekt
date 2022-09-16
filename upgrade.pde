final static String UPGRADE_IMG = "sprites/upgrade.svg";
final static String KASSE_TJEK_IMG = "sprites/kasse_tjek.svg";
final static String KASSE_IMG = "sprites/kasse.svg";

PShape upgrade_img;
PShape kasse_tjek;
PShape kasse;
Button[][] buttons = new Button[5][5];
int[] upgrades = new int[5];

void upgrade_setup() {
  upgrade_img = loadShape(UPGRADE_IMG);
  kasse_tjek = loadShape(KASSE_TJEK_IMG);
  kasse = loadShape(KASSE_IMG);
  // A loop to evenly space out the buttons along the window

  
  for (int upg = 0; upg < upgrades.length; upg++) {
    for (int i = 0; i < buttons.length; i++) {
    buttons[upg][i] = new Button(930 + (i * 65), 140 + (upg * 120), 50, 50, i);
    println(i);
  }
  
  }
}


void upgrade() {
  background(200);

  rectMode(CORNERS);
  fill(204, 102, 0);
  shapeMode(CORNERS);
  shape(upgrade_img, (width*0.7), 0, width, height);
for (int upg = 0; upg < upgrades.length; upg++)
  for (int i = 0; i < buttons.length; i++) {
    buttons[upg][i].display();
  }
}
