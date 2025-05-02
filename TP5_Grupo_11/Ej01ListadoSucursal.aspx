<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01ListadoSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01ListadoSucursal" %>
<%@ Register Src="Nav.ascx" TagPrefix="uc" TagName="Nav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listado Sucursales</title>
</head>
<body>
    <style>
        main {
            margin: 0 auto;
            width: 960px;
        }

        .divBusqueda 
        {
            margin: 15px auto;
            margin-bottom: 50px;
            display: flex;
            gap:10px;
        }
    </style>
    <uc:Nav runat="server" ID="nav1" /> 
    
    <main>
    <h1>Listado de Sucursales</h1>
    <form id="formularioEj01ListadoSucursal" runat="server">
        <div class="divBusqueda">
            <label for="" style="width: 250px">Búsqueda ingrese Id sucursal</label>
            <div style="margin-right:100px">
                <div>
                <asp:TextBox ID="txtBusqueda" runat="server" style="margin-right: 30px; width: 200px; border: 1px solid"></asp:TextBox>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="revBusqueda" runat="server" ErrorMessage="Debe ingresar un valor numérico" ControlToValidate="txtBusqueda" ValidationExpression="^[0-9]*$" style="color: red; font-weight: bolder;" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" Height="35px" />
            <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click" Height="35px" />
        </div>
        <asp:GridView ID="gvSucursales" runat="server" CellPadding="5" Width="900px"></asp:GridView>
    </form>
     </main>
</body>
</html>
