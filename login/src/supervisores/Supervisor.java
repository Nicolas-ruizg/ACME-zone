package supervisores;

import DataBase.conexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;


public class Supervisor {

    public static void agg_supervisor(long id_supervisor,int id_estado, String nombre) {
        String sql = "INSERT INTO supervisores(id_supervisor,id_estado,nombre)VALUES(?,?,?)";

        try (Connection conexion = conexionDB.conectDB();
             PreparedStatement valor = conexion.prepareStatement(sql)) {
                valor.setLong(1,id_supervisor);
                valor.setInt(2,id_estado);
                valor.setString(3,nombre);

                int filasAgregadas = valor.executeUpdate();
                if (filasAgregadas > 0){
                    System.out.println("Registro de supervisor exitoso");
                }

        } catch (SQLException ex) {
            System.out.println("Error al registrar a la persona: " + ex.getMessage());
        }
    }
}
