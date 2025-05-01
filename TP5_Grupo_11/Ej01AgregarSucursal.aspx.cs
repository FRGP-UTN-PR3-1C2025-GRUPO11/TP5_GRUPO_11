using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace TP5_Grupo_11
{
    public partial class Ej01AgregarSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Conexion conexion = new Conexion();
                string query = "SELECT P.Id_Provincia, P.DescripcionProvincia FROM Provincia AS [P]";
                DataTable provinciasBd = conexion.ejecutarLectura(query);

                ddlProvinciaSucursal.DataSource = provinciasBd;
                ddlProvinciaSucursal.DataTextField = "DescripcionProvincia";
                ddlProvinciaSucursal.DataValueField = "Id_Provincia";
                ddlProvinciaSucursal.DataBind();


            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Conexion conexion = new Conexion();

            string query = "INSERT INTO Sucursal (NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal) " +
                           "VALUES ('" + txtBoxNombreSucursal.Text + "', '" + txtBoxDescripcionSucursal.Text + "', '" + int.Parse(ddlProvinciaSucursal.SelectedValue) + "', '" + txtBoxDireccionSucursal.Text + "')";
            int filasAfectadas = conexion.ejecutarModificacion(query);
            if (filasAfectadas > 0)
            {
                lblResultado.Text = "La sucursal se ha agregado con éxito.";
            }
            else
            {
                lblResultado.Text = "Error al agregar la sucursal.";
            }
            LimpiarCampos();
        }
        private void LimpiarCampos()
        {
            txtBoxNombreSucursal.Text = "";
            txtBoxDescripcionSucursal.Text = "";
            txtBoxDireccionSucursal.Text = "";
            ddlProvinciaSucursal.SelectedIndex = 0;
        }
    }
}