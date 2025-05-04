using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
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
            consultaSql = "DELETE FROM Sucursal WHERE Id_Sucursal=" + txtSucursal.Text;

            filasAlt = conexion.ejecutarModificacion(consultaSql);
        }
    }
}