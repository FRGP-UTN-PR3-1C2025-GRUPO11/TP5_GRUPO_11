using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace TP5_Grupo_11
{
    public partial class Ej01EliminarSucursal : System.Web.UI.Page
    {
        private string consultaSql;
        private int filasAlt;
        Conexion conexion = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int idSucursal;
            if (!int.TryParse(txtSucursal.Text, out idSucursal))
            {
                txtSucursal.Text = string.Empty;
                resultado.Text = "ID inválido.";
                return;
            }

            consultaSql = "SELECT S.Id_Sucursal, " +
              "S.NombreSucursal, " +
              "S.DescripcionSucursal, " +
              "P.DescripcionProvincia, " +
              "S.DireccionSucursal " +
              "FROM SUCURSAL S " +
              "INNER JOIN PROVINCIA P ON S.Id_ProvinciaSucursal = P.Id_Provincia " +
              "WHERE S.Id_Sucursal = " + txtSucursal.Text;


            //  string consultaSql = "SELECT * FROM Sucursal WHERE Id_Sucursal = " + txtSucursal.Text;
            DataSet ds = conexion.ejecutarLectura(consultaSql, "Sucursal");
            
            if (ds.Tables["Sucursal"].Rows.Count == 0)
            {
                txtSucursal.Text = string.Empty;
                resultado.Text = "La sucursal con ese ID no existe.";
                lblEliminado.Text = "";
                return;
            }

            DataRow fila = ds.Tables["Sucursal"].Rows[0];

            string nombre= fila["NombreSucursal"].ToString();
            string descripcion = fila["DescripcionSucursal"].ToString();
            string provincia = fila["DescripcionProvincia"].ToString();
            string direccion = fila["DireccionSucursal"].ToString();


            consultaSql = "DELETE FROM Sucursal WHERE Id_Sucursal=" + txtSucursal.Text;
            resultado.Text = "La sucursal se ha eliminado con éxito";

            txtSucursal.Text = string.Empty;

            //filasAlt = conexion.ejecutarModificacion(consultaSql); // ELIMINADO PORQUE AHORA USAMOS STORE PROCEDURE:
            filasAlt = conexion.eliminarSucursal("SP_EliminarSucursal", idSucursal);
            if(filasAlt == 1)
            {
                resultado.Text = "Eliminado con éxito (1) registro";
                return;
            }
            else if (filasAlt == -1)
            {
                resultado.Text = "No se eliminó ningún registro";
                return;
            }
            else if (filasAlt == -2)
            {
                resultado.Text = "Error en la conexión a la base de datos";
                return;
            }
            else
            {
                resultado.Text = "Error desconocido";
            }


            lblEliminado.Text = "Se ha eliminado la sucursal:" + nombre;
            lblEliminado.Text += "   Descripción:" + descripcion;
            lblEliminado.Text += "   Provincia:" + provincia;
            lblEliminado.Text += "   Direccion de la Sucursal:" + direccion;
            
            
        }


    }
}