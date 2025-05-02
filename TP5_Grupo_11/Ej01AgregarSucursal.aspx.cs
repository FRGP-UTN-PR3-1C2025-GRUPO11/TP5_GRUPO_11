using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.EnterpriseServices;


namespace TP5_Grupo_11
{
    public partial class Ej01AgregarSucursal : System.Web.UI.Page
    {
        private string consultaSQL;
        private int filasAfectadas;
        Conexion conexion = new Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {

              
                string query = "SELECT P.Id_Provincia, P.DescripcionProvincia FROM Provincia AS [P]";
                string tabla = "Provincia";
                DataSet provinciasBd = conexion.ejecutarLectura(query, tabla);

                ddlProvinciaSucursal.DataSource = provinciasBd.Tables["Provincia"];
                ddlProvinciaSucursal.DataTextField = "DescripcionProvincia";
                ddlProvinciaSucursal.DataValueField = "Id_Provincia";
                ddlProvinciaSucursal.DataBind();

            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            consultaSQL = "INSERT INTO Sucursal (NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal) VALUES ('" + txtBoxNombreSucursal.Text + "','" + txtBoxDescripcionSucursal.Text + "'," + ddlProvinciaSucursal.SelectedValue + ",'" + txtBoxDireccionSucursal.Text + "')";
            filasAfectadas = conexion.ejecutarModificacion(consultaSQL);

            limpiarMensaje();
            MostrarMensaje(filasAfectadas);
        }
    


        private void MostrarMensaje(int filasAfectadas)
        {
            if (filasAfectadas == 1)
            {
                lblAgregado.Text = "Se ha agregado exitosamente!!";
            }
        }
        private void limpiarMensaje()
        {
            txtBoxNombreSucursal.Text = string.Empty;
            txtBoxDescripcionSucursal.Text = string.Empty;
            txtBoxDireccionSucursal.Text = string.Empty;
        }
    }

}

