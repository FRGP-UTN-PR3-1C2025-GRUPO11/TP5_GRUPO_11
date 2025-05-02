using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.EnterpriseServices;
using System.Text.RegularExpressions;


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
                /// Cargamos un item: despues de obtener los datos:
                ddlProvinciaSucursal.Items.Insert(0, new ListItem("-- Seleleccionar--", "0"));
                
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombreSucursal = txtBoxNombreSucursal.Text;
            string direccion = txtBoxDireccionSucursal.Text;

            // Expresión para validar que el nombre no sea solo números
            Regex nombreRegex = new Regex(@"^(?![0-9]+$)[a-zA-Z0-9\s]+$");
            Regex direccionRegex = new Regex(@"^(?![0-9]+$)[a-zA-Z0-9\s]+$");


            if (!nombreRegex.IsMatch(nombreSucursal))
            {
                lblErrorNombre.Text = "El nombre debe contener texto y puede incluir números.";
                return;
            }
            else
            {
                lblErrorNombre.Text = "";
            }

            if (!direccionRegex.IsMatch(direccion))
            {
                lblErrorDireccion.Text = "La dirección debe contener texto y números.";
                return;
            }
            else
            {
                lblErrorDireccion.Text = "";
            }

            
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

        protected void cvNombreSucursal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 3)
            {
                args.IsValid = false;
                cvNombreSucursal.Text = "Debe tener al menos 3 caracteres.";
            }
            else if (args.Value.Length > 100)
            {
                args.IsValid = false;
                cvNombreSucursal.Text = "Debe ser como máximo 100 caracteres.";
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvDescripcion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 3)
            {
                args.IsValid = false;
                cvDescripcion.Text = "Debe tener al menos 3 caracteres.";
            }
            else if (args.Value.Length > 100)
            {
                args.IsValid = false;
                cvDescripcion.Text = "Debe ser como máximo 100 caracteres.";
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvDireccion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 3)
            {
                args.IsValid = false;
                cvDireccion.Text = "Debe tener al menos 3 caracteres.";
            }
            else if (args.Value.Length > 100)
            {
                args.IsValid = false;
                cvDireccion.Text = "Debe ser como máximo 100 caracteres.";
            }
            else
            {
                args.IsValid = true;
            }
        }
    }

}

