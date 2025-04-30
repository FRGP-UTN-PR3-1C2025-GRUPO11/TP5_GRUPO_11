<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01AgregarSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01AgregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agregar Sucursal</title>
    <style>
        .divHyperLinks {
            justify-content: center;
            display: flex;
            gap: 100px;
        }
    </style>
</head>
<body>
    <form id="formularioEj01AgregarSucursal" runat="server">
        <div class="divHyperLinks">
   <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx"></asp:HyperLink>
   <asp:HyperLink runat="server" Text="Eliminar Sucursal" NavigateUrl="~/Ej01EliminarSucursal.aspx"></asp:HyperLink>
        </div>
        <section>
            <h1>GRUPO N°11</h1>
            <div id="datosSucursal" style="display: flex; flex-direction: column; gap: 10px;">
                <asp:Label style="padding-bottom: 10px;" Text="Agregar Sucursal" runat="server" />
                <div id="divNombreSucursal">
                <asp:Label Text="Nombre Sucursal:" runat="server" />
                <asp:TextBox ID="txtBoxNombreSucursal" runat="server" placeholder="Nombre de Sucursal..."></asp:TextBox>
                </div>
                <div id="divDescripcionSucursal">
                <asp:Label Text="Descripción:" runat="server" />
                <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..."></asp:TextBox>
                </div>
                <div id="divProvinciaSucursal">
                <asp:Label Text="Provincia:" runat="server" />
                <asp:DropDownList ID="ddlProvinciaSucursal" runat="server"></asp:DropDownList>
                </div>
                <div id="divDieccionSucursal">
                <asp:Label runat="server" Text="Dirección:"/>
                <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
