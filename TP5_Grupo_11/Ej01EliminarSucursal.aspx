<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01EliminarSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01EliminarSucursal" %>
<%@ Register Src="Nav.ascx" TagPrefix="uc" TagName="Nav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Eliminar Sucursal</title>
</head>
<body>
    <style>
        main {
            margin: 0 auto;
            width: 960px;
        }
    </style>

    <main>
    <uc:Nav runat="server" ID="nav1" />
    <h1>Eliminar Sucursal</h1>
    <form id="formularioEj01EliminarSucursal" runat="server">
        <label style="width: 200px; display: inline-block">Ingresar ID Sucursal</label>
        <asp:TextBox ID="txtSucursal" runat="server" ></asp:TextBox>
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        <div style="margin-left: 200px; margin-top:5px; color: red; font-weight: bolder">
            <asp:RegularExpressionValidator ID="revtxtSucursal" runat="server" ErrorMessage="Debe ser un valor numérico" ControlToValidate="txtSucursal" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>

        </div>
        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
    </form>
    </main>
</body>
</html>
