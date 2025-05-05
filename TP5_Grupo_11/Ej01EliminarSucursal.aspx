<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01EliminarSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01EliminarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Eliminar Sucursal</title>
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
        <h1>Eliminar Sucursal</h1>

    </header>
    <main>
        <form id="formularioEj01EliminarSucursal" runat="server" defaultbutton="btnEliminar">
            <div class="contenedor__eliminarSucursales">
                <asp:Label Text="Ingresar ID Sucursal" runat="server" ID="lblShowID" AssociatedControlID="txtSucursal" />
                <asp:TextBox ID="txtSucursal" runat="server"></asp:TextBox>
                <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" CssClass="btn-custom" />
                <div style="margin-left: 200px; margin-top: 5px; color: red; font-weight: bolder">
                    <asp:RequiredFieldValidator ID="rfvSucursal" runat="server" ControlToValidate="txtSucursal" ErrorMessage="Debe ingresar un ID de sucursal" ForeColor="Red" Display="Dynamic" />
                </div>
                <asp:Label ID="resultado" runat="server"></asp:Label><br />
                <asp:Label ID="lblEliminado" runat="server" Font-Bold="True"></asp:Label>
            </div>
        </form>
    </main>

</body>
</html>
