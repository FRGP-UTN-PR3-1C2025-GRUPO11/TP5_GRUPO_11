<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="Ej01AgregarSucursal.aspx.cs"
    UnobtrusiveValidationMode="None"
    Inherits="TP5_Grupo_11.Ej01AgregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Sucursal</title>
    <style>
        body {
            margin: 0 auto;
            width: 960px;
            padding: 10px;
        }
        .divHyperLinks {
            justify-content: center;
            display: flex;
            /*gap: 100px;*/
            text-align: center;
        }
            .divHyperLinks > a {
                text-decoration: none;
                color: white;
                font-size: 14px;
                font-weight: bolder;
                display: inline-block;
                background-color: #007BFF;
                padding: 7px 15px;
                border: 1px solid dodgerblue;
                cursor: pointer;
                opacity: 1; /* Default opacity */
                transition: opacity 0.3s ease; /* Smooth transition effect */
                font-family: Arial, sans-serif;
                width: 100%;
            }
            .divHyperLinks > a:hover 
            {
                opacity: 0.7;
                background-color: #0056b3;
            }

        #datosSucursal {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-bottom: 15px;
        }

        .formElement {
            display: flex;
            justify-content: left;
            gap: 10px;
            flex-direction: row;
        }

            .formElement > select,
            .formElement > textarea,
            .formElement > input {
                width: 200px
            }

            .formElement > :nth-child(1) {
                width: 160px;
            }

            html {
    overflow-y: scroll;
}
            .btn-custom {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 20px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.btn-custom:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
    <nav class="divHyperLinks">
        <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx"></asp:HyperLink>
        <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx"></asp:HyperLink>
        <asp:HyperLink runat="server" Text="Eliminar Sucursal" NavigateUrl="~/Ej01EliminarSucursal.aspx"></asp:HyperLink>
    </nav>
    <header>
        <h1>Agregar Sucursal</h1>
    </header>

    <main>
        <form id="formularioEj01AgregarSucursal" runat="server" defaultbutton="btnAgregar">
            <section>
                <div id="datosSucursal">
                    <%-- NOMBRE SUCURSAL --%>
                    <div id="divNombreSucursal" class="formElement">
                        <asp:Label Text="Nombre Sucursal:" runat="server" AssociatedControlID="txtBoxNombreSucursal" />
                        <asp:TextBox ID="txtBoxNombreSucursal" runat="server" placeholder="Nombre de Sucursal..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtBoxNombreSucursal" Display="Dynamic">Falta nombre</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvNombreSucursal" runat="server" ErrorMessage="Máximo 100 caracteres" Display="Dynamic" ControlToValidate="txtBoxNombreSucursal"
                            EnableClientScript="False" Font-Bold="True" ForeColor="Red" OnServerValidate="cvNombreSucursal_ServerValidate"></asp:CustomValidator>
                        <asp:Label runat="server" ID="lblErrorNombre"></asp:Label>
                    </div>
                    <%-- DESCRIPCION SUCURSAL --%>
                    <div id="divDescripcionSucursal" class="formElement">
                        <asp:Label Text="Descripción:" runat="server" AssociatedControlID="txtBoxDescripcionSucursal" />
                        <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..." TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripSucursal" runat="server" ControlToValidate="txtBoxDescripcionSucursal">Falta descripción</asp:RequiredFieldValidator>
                        &nbsp;<asp:CustomValidator ID="cvDescripcion" runat="server" ControlToValidate="txtBoxDescripcionSucursal" OnServerValidate="cvDescripcion_ServerValidate">No se puede ingresar mas de 100 letras</asp:CustomValidator>
                    </div>
                    <%-- PROVINCIAS SUCURSAL --%>
                    <div id="divProvinciaSucursal" class="formElement">
                        <asp:Label Text="Provincia:" runat="server" AssociatedControlID="ddlProvinciaSucursal" />
                        <asp:DropDownList ID="ddlProvinciaSucursal" runat="server">
                            <asp:ListItem Enabled="True" Text="--Seleccionar--" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvinciaSucursal" ErrorMessage="Seleccione una Provincia" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                    <%-- DIRECCION SUCURSAL --%>
                    <div id="divDireccionSucursal" class="formElement">
                        <asp:Label runat="server" Text="Dirección:" AssociatedControlID="txtBoxDireccionSucursal" />
                        <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccionSucursal" runat="server" ControlToValidate="txtBoxDireccionSucursal">Falta la dirección</asp:RequiredFieldValidator>
                        <asp:Label runat="server" ID="lblErrorDireccion"></asp:Label>
                        <asp:CustomValidator ID="cvDireccion" runat="server" ControlToValidate="txtBoxDireccionSucursal" OnServerValidate="cvDireccion_ServerValidate">No se puede ingresar mas de 100 letras</asp:CustomValidator>
                    </div>
                </div>
            </section>
            <div style="text-align: center; width: 360px; margin-top: 30px;">
                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Height="50px" Width="120px" CssClass="btn-custom" /><br />
                <br />
                <asp:Label ID="lblAgregado" runat="server"></asp:Label>
            </div>
        </form>
    </main>
</body>
</html>
