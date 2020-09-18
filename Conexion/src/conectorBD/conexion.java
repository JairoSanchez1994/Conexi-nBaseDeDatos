package conectorBD;
import java.sql.*;

public class conexion {
		
	private static Connection con;
	private static Statement st;


	public static void main(String[] args) throws Exception{
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            setCon(DriverManager.getConnection("jdbc:mysql://localhost:3306/basededatos", "root", ""));
	        } catch (Exception e) {
	            System.err.println("Error:" +e);
	        }

		String query = "select Nombre from Empleados where Direccion like 'Almeria'";
		String query2 = "select Matricula, Modelo from Coches where Matricula = '12345ABC'";
		String query3 = "UPDATE Empleados set Sueldo = Sueldo*1.05";
		String query4 = "select Nombre, Sueldo from Empleados";
		st = null;
		try {
		
		Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println(e);
		}
		try {
			
			
			ResultSet rs = st.executeQuery(query);
		
			rs.next();
			String name = rs.getString("nombre");
		
		
			System.out.println(name + " vive en Almeria");
			
			
		}
		catch(Exception e) {

		}
		try {
			ResultSet rs2 = st.executeQuery(query2);
			rs2.next();
			String matricula = rs2.getString("matricula");
			String modelo = rs2.getString("modelo");
			System.out.println("El coche con matricula " + matricula + " es un " + modelo);
		}catch(Exception e) {
			
		}
		
		try (PreparedStatement prepst = con.prepareStatement(query3)) {
			prepst.executeUpdate();
		}
			
		ResultSet rs4 = st.executeQuery(query4);
			while(rs4.next()) {
			
			String sueldo = rs4.getString("sueldo");
			String nombreEmp = rs4.getString("nombre");
			System.out.println(nombreEmp + " después de su ascenso del 5% percibe " + sueldo + "€ euros.");
			}
		
		
		
	}

	public static Connection getCon() {
		return con;
	}

	public static void setCon(Connection con) {
		conexion.con = con;
	}

	
	
}
