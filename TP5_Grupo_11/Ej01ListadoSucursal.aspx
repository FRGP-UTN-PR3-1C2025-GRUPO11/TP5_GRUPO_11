<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01ListadoSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01ListadoSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Listado Sucursales</title>
    <style>

        body {
            margin: 0 auto;
            width: 960px;
            padding: 10px;
        }        
        
        .divHyperLinks {
            justify-content: center;
            display: flex;
            gap: 100px;
        }


        .divBusqueda {
            margin: 15px auto;
            margin-bottom: 50px;
            display: flex;
            gap: 10px;
            height: 50px;
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

        <h1>Listado de Sucursales</h1>
    </header>
    <main>

        <form id="formularioEj01ListadoSucursal" runat="server" defaultbutton="btnFiltrar">
            <div class="divHyperLinks">
            </div>
            <div class="divBusqueda">
                <label for="txtBusqueda" style="width: 250px">Búsqueda ingrese Id sucursal</label>
                <div style="margin-right: 100px">
                    <div>
                        <asp:TextBox ID="txtBusqueda" runat="server" Style="margin-right: 30px; width: 200px" ValidationGroup="Grupo1"></asp:TextBox>
                        <asp:Label runat="server" ID="lblErrorBusqueda"></asp:Label>
                        <div>
                            <asp:RegularExpressionValidator ID="revIdSucursal" runat="server" ControlToValidate="txtBusqueda" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Grupo1" Display="Dynamic">Debe ingresar un solo números</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvIdSucursal" runat="server" ControlToValidate="txtBusqueda" Font-Bold="True" ForeColor="Red" ValidationGroup="Grupo1" Display="Dynamic">Debe ingresar un número</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar" ValidationGroup="Grupo1" />
                <asp:Button runat="server" Text="Mostrar Todos" ID="btnMostrarTodos" OnClick="btnMostrarTodos_Click" />
                <br />
                <br />
            </div>
            <div>
            <asp:GridView ID="gvSucursales" runat="server" CellPadding="5" Width="900px" HorizontalAlign="Center">
                <HeaderStyle BackColor="#CCCCCC" BorderColor="White" BorderStyle="Solid" Width="900px" />
            </asp:GridView>
            </div>
        </form>
    <p>
        <asp:Label ID="lblListado" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </p>
    </main>
</body>
</html>
