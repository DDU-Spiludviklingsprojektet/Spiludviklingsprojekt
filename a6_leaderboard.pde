// fjenett 20120226 //<>//

import de.bezier.data.sql.*;

MySQL db;

void mysql_setup()
{
  db = new MySQL( this, "sql11.freemysqlhosting.net", "sql11520356", "sql11520356", "bdyDz8PF2s" );  // open database file
  db.setDebug(false);

  if ( db.connect() )
  {
    //String[] tableNames = db.getTableNames();
    db.query( "SELECT * FROM %s", "lb" );

    while (db.next())
    {
      lb t = new lb();
      db.setFromRow( t );
      println( t );
    }

    //lb t1 = new lb();
    //t1.fieldOne = 2;
    //t1.id = 1;
    //db.saveToDatabase(t1);
  }
}

class lb
{
  int id;
  public int fieldOne;

  public String toString ()
  {
    return String.format("id: %d, fieldOne: %s", id, fieldOne);
  }

  public void setId ( int id ) {
    this.id = id;
  }

  public int getId () {
    return id;
  }
}
