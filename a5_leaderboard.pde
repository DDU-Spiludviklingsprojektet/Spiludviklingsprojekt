//Creates the data for the leaderboard
final static String LBBACK_IMG = "data/svg/lb_background.svg";
PShape leadback_img;
Button_rect back_bt3;
StringList username;
IntList writescore;
import de.bezier.data.sql.*;
MySQL db;
StringList scoreboard;
String leaderboardtext = "";


void lb_setup() {
  username = new StringList();
  writescore = new IntList();
  db = new MySQL( this, "hc.hyperservers.dk", "s1_DDUSimon", "u1_IUC2R9tgCu", "C+g65NG1Sg7pdYWQTdOK6ys=" );  // open database file
  db.setDebug(false);
  if ( db.connect() ) {
    db.query( "SELECT * FROM %s ORDER BY score DESC", "leaderboard" );
    while (db.next()) {
      Leaderboard t = new Leaderboard();
      db.setFromRow( t );
      username.append(t.username);
      writescore.append(t.score);
    }
  }
  for (int i = 0; i<username.size()&&i<10; i++) {
    leaderboardtext = leaderboardtext+"\nBruger: " + username.get(i) + " | Score: " + str(writescore.get(i));
  }
}


//draw to leaderboard
void lb() {
  background(200);
  leadback_img = loadShape(LBBACK_IMG);
  shapeMode (CORNERS);
  shape(leadback_img, 0, 0, 1280, 720);
  lb_button();
  scoreboardtext();
}

//creates button
void lb_button() {
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

void scoreboardtext() {
  textFont(bit8);
  textSize(20*width/1280);
  fill(255);
  textAlign(CENTER);

  text(leaderboardtext, width/2, height/6);
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
