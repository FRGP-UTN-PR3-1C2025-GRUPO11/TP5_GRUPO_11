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
    </style>
</head>
<body>
    <style>
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
                    <asp:TextBox ID="txtBusqueda" runat="server" style="margin-right: 30px; width: 200px"></asp:TextBox>
                    <div>
                        [validador]
                    </div>
                </div>
                </div>
                [filtrar] [mostrar todos]
                </div>
            <asp:GridView ID="gvSucursales" runat="server" CellPadding="5" Width="900px"></asp:GridView>
            </div>
        </form>
    </main>
</body>
</html>
