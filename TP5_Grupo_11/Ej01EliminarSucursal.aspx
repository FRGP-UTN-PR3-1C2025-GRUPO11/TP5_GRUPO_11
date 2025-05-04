<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01EliminarSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01EliminarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Eliminar Sucursal</title>
    <style>
.divHyperLinks {
    justify-content: center;
    display: flex;
    gap: 100px;
}
main {
    margin: 0 auto;
    width: 960px;
}
    </style>
</head>
<body>
    <main>
        <div class="divHyperLinks">
            <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx"></asp:HyperLink>
            <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx"></asp:HyperLink>
        </div>
        <h1>Eliminar Sucursales</h1>
        <form id="formularioEj01EliminarSucursal" runat="server">
            <label style="width: 200px; display: inline-block">Ingresar ID Sucursal</label>
            <asp:TextBox ID="txtSucursal" runat="server" ></asp:TextBox>
            [boton]
            <div style="margin-left: 200px; margin-top:5px; color: red; font-weight: bolder">
                [validador]
            </div>
            [resultado]
        </form>
    </main>
</body>
</html>
