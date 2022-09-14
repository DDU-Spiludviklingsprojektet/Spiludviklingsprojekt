final static String UPGRADE_IMG = "/sprites/upgrade.svg";
final static String KASSE_TJEK_IMG = "/sprites/kasse_tjek.svg";
final static String KASSE_IMG = "/sprites/kasse.svg";

PShape upgrade_img;
PShape kasse_tjek;
PShape kasse;
Button[] buttons = new Button[6];


void upgrade_setup() {
  upgrade_img = loadShape(UPGRADE_IMG);
  kasse_tjek = loadShape(KASSE_TJEK_IMG);
  kasse = loadShape(KASSE_IMG);
  // A loop to evenly space out the buttons along the window
  for (int i = 0; i < buttons.length; i++) {
    for (float y = 120; y < 700; y = y + 100) {
      for (float x = 1000; x < 1250; x = x + 50)
      buttons[i] = new Button(x-1000, 120, 50, 50);
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

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}
