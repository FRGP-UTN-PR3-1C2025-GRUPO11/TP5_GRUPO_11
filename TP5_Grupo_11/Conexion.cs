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
        
        public int ejecutarModificacion(string consultaSql)
        {
            // ESTABLECE LA CONEXION A SQL SERVER
            SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
            
            // ABRE LA CONEXION
            sqlConnection.Open();

            // CREA UNA VARIABLE SQL COMMAND Y TRAE LOS PARAMETROS DE LOS FORMS
            SqlCommand sqlCommand = new SqlCommand();

            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = consultaSql.ToString();


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
                //SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                SqlDataAdapter adaptador = new SqlDataAdapter(consultaSql, sqlConnection);
                DataSet ds = new DataSet();
                adaptador.Fill(ds, tabla);
                return ds;
            }
        }

    }
}