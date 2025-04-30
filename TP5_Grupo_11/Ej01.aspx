<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01.aspx.cs" Inherits="TP5_Grupo_11.Ej01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ejercicion 1</title>
    <style>
        .divHyperLinks {
            justify-content: center;
            display: flex;
            gap: 100px;
        }
    </style>
</head>
<body>
    <form id="formularioEj01" runat="server">
        <div class="divHyperLinks">
            <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx"></asp:HyperLink>
            <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx"></asp:HyperLink>
            <asp:HyperLink runat="server" Text="Eliminar Sucursal" NavigateUrl="~/Ej01EliminarSucursal.aspx"></asp:HyperLink>
        </div>
    </form>
</body>
</html>
