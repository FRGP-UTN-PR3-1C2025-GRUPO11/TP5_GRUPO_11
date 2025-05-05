using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TP5_Grupo_11
{
    public class Conexion
    {
        // CADENA DE CONEXION
        private const string cadenaConexion = @"Data Source=localhost\SQLEXPRESS;
                                                Initial Catalog=BDSucursales;
                                                Integrated Security=True;TrustServerCertificate=True";

        // private const string cadenaConexion = @"Data Source=DESKTOP-LFTFVP5\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
        public int ejecutarModificacion(string consultaSql)
        {
            // ESTABLECE LA CONEXION A SQL SERVER
            SqlConnection sqlConnection = new SqlConnection(cadenaConexion);

            // ABRE LA CONEXION
            sqlConnection.Open();

            // CREA UNA VARIABLE SQL COMMAND Y TRAE LOS PARAMETROS DE LOS FORMS
            SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);

            // EJECUTAR CONSULTA
            // ExecuteNonQuery se usa para INSERT-UPDATE-DELETE
            // 
            int filasAfectadas = sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
            return filasAfectadas;

        }

        public DataSet ejecutarLectura(string consultaSql, string tabla)
        {
            using (SqlConnection sqlConnection = new SqlConnection(cadenaConexion))
            {
                sqlConnection.Open();
                //SqlCommand sqlCommand = new SqlCommand(consultaSql, sqlConnection);
                // SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                SqlDataAdapter adaptador = new SqlDataAdapter(consultaSql, sqlConnection);
                DataSet ds = new DataSet();
                adaptador.Fill(ds, tabla);
                return ds;
            }
        }

        public int agregarSucursal(string storeProcedure, string NombreSucursal, string DescripcionSucursal, int Id_ProvinciaSucursal, string DireccionSucursal)
        {
            int resultado = 0;

            try
            {
                SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
                sqlConnection.Open();

                // AGREGO EL STORE PROCEDURE
                SqlCommand sqlCommand = new SqlCommand(storeProcedure, sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "SP_AgregarSucursal";

                // PARAMETROS:
                SqlParameter sqlParameter = new SqlParameter();
                sqlParameter = sqlCommand.Parameters.Add("@NombreSucursal", SqlDbType.VarChar);
                sqlParameter.Value = NombreSucursal;
                sqlParameter = sqlCommand.Parameters.Add("@DescripcionSucursal", SqlDbType.VarChar);
                sqlParameter.Value = DescripcionSucursal;
                sqlParameter = sqlCommand.Parameters.Add("@Id_ProvinciaSucursal", SqlDbType.Int);
                sqlParameter.Value = Convert.ToInt32(Id_ProvinciaSucursal);
                sqlParameter = sqlCommand.Parameters.Add("@DireccionSucursal", SqlDbType.VarChar);
                sqlParameter.Value = DireccionSucursal;

                resultado =  sqlCommand.ExecuteNonQuery(); // devuelve 1 si se afecto una fila, -1 si no se afectó ninguna fila

                return resultado;

            }
            catch (Exception e)
            {
                return -2; // devuelve -2 si hubo errores en la conexion
            }
        }
        public int eliminarSucursal(string storeProcedure, int Id_Sucursal)
        {
            int resultado = 0;
            try
            {
                SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
                sqlConnection.Open();
                // AGREGO EL STORE PROCEDURE
                SqlCommand sqlCommand = new SqlCommand(storeProcedure, sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "SP_EliminarSucursal";
                // PARAMETROS:
                SqlParameter sqlParameter = new SqlParameter();
                sqlParameter = sqlCommand.Parameters.Add("@Id_Sucursal", SqlDbType.Int);
                sqlParameter.Value = Convert.ToInt32(Id_Sucursal);
                resultado = sqlCommand.ExecuteNonQuery(); // devuelve 1 si se afecto una fila, -1 si no se afectó ninguna fila
                return resultado;
            }
            catch (Exception e)
            {
                return -2; // devuelve -2 si hubo errores en la conexion
            }
        }
    }
}