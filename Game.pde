
void game() {
  rocket = new Raket(1, 2, 3, 4, 5, 6, 7);
  earth = new Planet(0, 0, true, 2, 2, 2,200);
  moon = new Planet(0, 9000, false, 0, 0, 1,20);
  rocket.setThrottle(2);
}
