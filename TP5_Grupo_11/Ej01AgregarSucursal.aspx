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
        #datosSucursal {
            display: flex; 
            flex-direction: column; 
            gap: 10px;   
        }

        
       /* .formElement {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            flex-direction: row;
        } */

        .formElement > select, 
        .formElement > input 
        {
            width: 145px
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
            <div id="datosSucursal">
                <asp:Label style="padding-bottom: 10px;" Text="Agregar Sucursal" runat="server" />
                <div id="divNombreSucursal" class="formElement">
                <asp:Label Text="Nombre Sucursal:" runat="server" />
                <asp:TextBox ID="txtBoxNombreSucursal" runat="server" placeholder="Nombre de Sucursal..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtBoxNombreSucursal">Falta nombre</asp:RequiredFieldValidator>
                    <asp:Label runat="server" ID="lblErrorNombre"></asp:Label>
                </div>
                <div id="divDescripcionSucursal" class="formElement">
                <asp:Label Text="Descripción:" runat="server" />
                <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescripSucursal" runat="server" ControlToValidate="txtBoxDescripcionSucursal">Falta descripción</asp:RequiredFieldValidator>
                </div>
                <div id="divProvinciaSucursal" class="formElement">
                <asp:Label Text="Provincia:" runat="server" />
                <asp:DropDownList ID="ddlProvinciaSucursal" runat="server">
                    </asp:DropDownList>
                </div>
                <div id="divDieccionSucursal" class="formElement">
                <asp:Label runat="server" Text="Dirección:"/>
                <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDireccionSucursal" runat="server" ControlToValidate="txtBoxDireccionSucursal">Falta la dirección</asp:RequiredFieldValidator>
                    <asp:Label runat="server" ID="lblErrorDireccion"></asp:Label>
                </div>
            </div>
        </section>
        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
        <p>
            <asp:Label ID="lblAgregado" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
