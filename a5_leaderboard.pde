//Creates the data for the leaderboard
//Due to time constraints, the implementation of this function is not complete.
StringList navne;
import de.bezier.data.sql.*;
MySQL db;

void mysql_setup()
{
  db = new MySQL( this, "node02.hyperservers.dk", "s1_spiludviklingsprojekt", "u1_ySaPwFzhh2", "xxxx" );  // open database file
  db.setDebug(false);

  if ( db.connect() )
  {
    db.query( "SELECT * FROM leaderboard ORDER BY score DESC LIMIT 10" );
    while ( db.next() )
    {
      navne.add(db.getString("name"));
    }
    //Der er brug for at vi tilføjer de andre ting også
  }
  else
  {
    println("Could not connect to database, too bad!");
  }
}
//Tjekker om navnet er taget. Sender true hvis navnet er det og false hvis det ikke findes.
public boolean navntaget(String tempname) {
  boolean taget = true;
  db.query("SELECT name FROM lb");
  db.getString("name");
  while (db.next())
  {
    String s = db.getString("name");
    navne = new StringList();
    navne.append(s);
  }
  return navne.hasValue(tempname);
}

//////

class lb
{
  int id;
  public int value;
  public String name;

  public String toString ()
  {
    return String.format("id: %d, name %s, value: %d", id, name, value);
  }

  public void setId ( int id ) {
    this.id = id;
  }

  public int getId () {
    return id;
  }
}

void lb() {
  db.query( "SELECT * FROM %s", "lb" );
  while (db.next())
  {
    lb name = new lb();
    db.setFromRow( name );
  }
}
