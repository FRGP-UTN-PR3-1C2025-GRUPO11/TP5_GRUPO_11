using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace TP5_Grupo_11
{
    public partial class Ej01ListadoSucursal : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                Conexion conexion = new Conexion();
                string consulta = "SELECT S.Id_Sucursal, " +
                    "S.NombreSucursal AS [Nombre], " +
                    "S.DescripcionSucursal AS [Descripción]," +
                    "P.DescripcionProvincia as [Provincia] ," +
                    "S.DireccionSucursal FROM SUCURSAL AS [S]" +
                    "INNER JOIN PROVINCIA AS [P] ON S.Id_ProvinciaSucursal = P.Id_Provincia";
                DataTable dt = new DataTable();
                dt = conexion.ejecutarLectura(consulta);
                gvSucursales.DataSource = dt;
                gvSucursales.DataBind();

            }
            
             
            SqlDataAdapter adaptador = new SqlDataAdapter();
    }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            Conexion conexion = new Conexion();
            string consulta = "SELECT Id_Sucursal, NombreSucursal AS [Nombre], DescripcionSucursal AS [Descripción], DireccionSucursal FROM SUCURSAL WHERE Id_Sucursal = '" + txtBusqueda.Text + "'";
            DataTable dt = new DataTable();
            dt = conexion.ejecutarLectura(consulta);
            gvSucursales.DataSource = dt;
            gvSucursales.DataBind();
            txtBusqueda.Text = String.Empty;
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

    }
}