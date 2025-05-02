using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_11
{
    public partial class Ej01ListadoSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Conexion conexion = new Conexion();
                string consulta = "SELECT S.Id_Sucursal, " +
                    "S.NombreSucursal AS [Nombre], " +
                    "S.DescripcionSucursal AS [Descripción]," +
                    "P.DescripcionProvincia as [Provincia] ," +
                    "S.DireccionSucursal FROM SUCURSAL AS [S]" +
                    "INNER JOIN PROVINCIA AS [P] ON S.Id_ProvinciaSucursal = P.Id_Provincia";
                DataSet ds = new DataSet();
                ds = conexion.ejecutarLectura(consulta, "SUCURSAL");
                gvSucursales.DataSource = ds.Tables["Sucursal"];
                gvSucursales.DataBind();

            }

        }
    }
}