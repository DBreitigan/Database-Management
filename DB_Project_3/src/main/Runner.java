package main;

import java.sql.*;

public class Runner {
	public void main()
	{
		Class.forName("mysql-connector-java-5.1.19.jar");
		Connection <var> =
				DriverManager.getConnection("jdbc:mysql://db.cs.ship.edu/csc371-02", "csc371-02", "Password02");

	}
}
