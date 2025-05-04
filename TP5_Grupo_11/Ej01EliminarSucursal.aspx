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
    </style>
</head>
<body>
    <form id="formularioEj01EliminarSucursal" runat="server">
        <div class="divHyperLinks">
            <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx"></asp:HyperLink>
            <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx"></asp:HyperLink>
        </div>
        <%-- TITULO --%>
        <h1>Elminar Sucrusales</h1>
        <div class="contenedor__elimnarSucursales">
            <asp:Label runat="server" Text="Ingrese ID sucursal:" ID="lblShowID"></asp:Label>
        </div>
    </form>
</body>
</html>
