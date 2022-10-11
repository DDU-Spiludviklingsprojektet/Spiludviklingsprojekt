//Creates the data for the leaderboard
final static String LBBACK_IMG = "data/svg/lb_background.svg";
PShape leadback_img;
Button_rect back_bt3;
StringList navne;
import de.bezier.data.sql.*;
MySQL db;
StringList scoreboard;

void lb_setup() {
  scoreboard = new StringList();
  db = new MySQL( this, "hc.hyperservers.dk", "s1_DDUSimon", "u1_IUC2R9tgCu", "C+g65NG1Sg7pdYWQTdOK6ys=" );  // open database file
  db.setDebug(false);
  if ( db.connect() ){
    db.query( "SELECT * FROM %s ORDER BY score DESC", "leaderboard" );
    while (db.next()) {
      Leaderboard t = new Leaderboard();
      db.setFromRow( t );
      scoreboard.append(str(t.id) + "," + t.username + "," + str(t.score));
    }
  }
}

//draw to leaderboard
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
  scoreboardtext();
}

void scoreboardtext(){
  for (int i = 0; i < scoreboard.size(); i++) {
    String[] split = split(scoreboard.get(i), ',');
    String id = split[0];
    String username = split[1];
    String score = split[2];
    println(i+1 + " " + username + " " + score);
  }
}
class Leaderboard {
  int id;
  public String username;
  public int score;
  public String toString () {
  return String.format("id: %d, username: %s score: %s", id, username, score); 
  }
  public void setId ( int id ) {
    this.id = id;
  }
  public int getId () {
    return id;
  }
}