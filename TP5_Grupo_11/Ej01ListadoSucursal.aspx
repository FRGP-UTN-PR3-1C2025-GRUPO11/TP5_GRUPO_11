<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01ListadoSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01ListadoSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listado Sucursales</title>
    <style>
              .divHyperLinks {
          justify-content: center;
          display: flex;
          gap: 100px;
      }
        main 
        {
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
</head>
<body>
    <main>
        <h1>Listado de Sucursales</h1>

        <form id="formularioEj01ListadoSucursal" runat="server">
            <div class="divHyperLinks">
                   <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx"></asp:HyperLink>
                   <asp:HyperLink runat="server" Text="Eliminar Sucursal" NavigateUrl="~/Ej01EliminarSucursal.aspx"></asp:HyperLink>
            </div>
            <div class="divBusqueda">
                <label for="" style="width: 250px">Búsqueda ingrese Id sucursal</label>
                <div style="margin-right:100px">
                <div>
                    <asp:TextBox ID="txtBusqueda" runat="server" style="margin-right: 30px; width: 200px" ValidationGroup="Grupo1"></asp:TextBox>
                    <asp:Label runat="server" ID="lblErrorBusqueda"></asp:Label>
                    <div>
                        &nbsp;<asp:RegularExpressionValidator ID="rfvIdSucursal" runat="server" ControlToValidate="txtBusqueda" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Grupo1">Debe ingresar un solo números</asp:RegularExpressionValidator>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBusqueda" Font-Bold="True" ForeColor="Red" ValidationGroup="Grupo1">Debe ingresar un número</asp:RequiredFieldValidator>
                    </div>
                </div>
                </div>
                &nbsp;<asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar" ValidationGroup="Grupo1" />
                <asp:Button runat="server" Text="Mostrar Todos" ID="btnMostrarTodos" OnClick="btnMostrarTodos_Click"/>
                <br />
                <br />
                </div>
            <asp:GridView ID="gvSucursales" runat="server" CellPadding="5" Width="900px"></asp:GridView>
            </div>
        </form>
    </main>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblListado" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </p>
</body>
</html>
