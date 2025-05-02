using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_11
{
    public partial class Ej01EliminarSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Conexion conexion = new Conexion();
            string consulta = "DELETE FROM SUCURSAL WHERE Id_Sucursal = '" + txtSucursal.Text + "'";
            int filasAfectadas = conexion.ejecutarModificacion(consulta);
            if (filasAfectadas > 0)
            {

                lblResultado.Text = "Sucursal eliminada correctamente.";
                txtSucursal.Text = String.Empty;
            }
            else
            {

                lblResultado.Text = "No se encontró la sucursal con el ID proporcionado.";
                txtSucursal.Text = String.Empty;
            }

        }
    }
}