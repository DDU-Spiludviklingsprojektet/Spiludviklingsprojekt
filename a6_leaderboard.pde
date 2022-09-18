// fjenett 20120226 //<>//
StringList navne;
import de.bezier.data.sql.*; //<>//

MySQL db;

void mysql_setup()
{
  db = new MySQL( this, "node02.hyperservers.dk", "s1_spiludviklingsprojekt", "u1_ySaPwFzhh2", "wuukU10yYtm.1Ng5+hn@QuK." );  // open database file
  db.setDebug(false);

  if ( db.connect() )
  {

    //lb t1 = new lb();
    //t1.name = "Simon";
    //t1.id = 1;
    //t1.value = money;
    //db.saveToDatabase(t1);
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
    println(name);
  }
}
