using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_11
{
    public partial class Ej01ListadoSucursal : System.Web.UI.Page
    {
        Conexion conexion = new Conexion();
        private string consultaSql;
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
               
                string consulta = "SELECT S.Id_Sucursal AS [Id], " +
                    "S.NombreSucursal AS [Nombre], " +
                    "S.DescripcionSucursal AS [Descripción]," +
                    "P.DescripcionProvincia as [Provincia] ," +
                    "S.DireccionSucursal as [Dirección] FROM SUCURSAL AS [S]" +
                    "INNER JOIN PROVINCIA AS [P] ON S.Id_ProvinciaSucursal = P.Id_Provincia";
                DataSet ds = new DataSet();
                ds = conexion.ejecutarLectura(consulta, "SUCURSAL");
                gvSucursales.DataSource = ds.Tables["Sucursal"];
                gvSucursales.DataBind();

            }

        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

            consultaSql = "SELECT * FROM Sucursal WHERE Id_Sucursal = " + txtBusqueda.Text;
            
            DataSet set = conexion.ejecutarLectura(consultaSql, "Sucursal");

            if (set.Tables["Sucursal"].Rows.Count > 0)
            {
                gvSucursales.DataSource = set.Tables["Sucursal"];
                gvSucursales.DataBind();
                lblListado.Text = "";
            }
            else
            {
                lblListado.Text = "No se encontró ninguna sucursal con esa Id";
                gvSucursales.DataSource = null;
                gvSucursales.DataBind();
            }

            txtBusqueda.Text = string.Empty;


        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            consultaSql = "SELECT S.Id_Sucursal, " +
                    "S.NombreSucursal AS [Nombre], " +
                    "S.DescripcionSucursal AS [Descripción]," +
                    "P.DescripcionProvincia as [Provincia] ," +
                    "S.DireccionSucursal FROM SUCURSAL AS [S]" +
                    "INNER JOIN PROVINCIA AS [P] ON S.Id_ProvinciaSucursal = P.Id_Provincia";

            DataSet set = conexion.ejecutarLectura(consultaSql, "Sucursal");

            gvSucursales.DataSource = set.Tables["Sucursal"];
            gvSucursales.DataBind();

            txtBusqueda.Text = string.Empty; 

            lblListado.Text = string.Empty;
        }
    }
}