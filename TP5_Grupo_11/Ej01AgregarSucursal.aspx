<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01AgregarSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01AgregarSucursal" %>
<%@ Register Src="Nav.ascx" TagPrefix="uc" TagName="Nav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agregar Sucursal</title>
    <style>
        #datosSucursal {
            display: flex; 
            flex-direction: column; 
            gap: 10px;
            width: 300px;
        }

        .formElement {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            flex-direction: row;
        }

        .formElement > select, 
        .formElement > input 
        {
            width: 145px
        }

    </style>
</head>
<body>
    <uc:Nav runat="server" ID="nav1" />
    <form id="formularioEj01AgregarSucursal" runat="server">
        <section>
            <h1>GRUPO N°11</h1>
            <div id="datosSucursal" style=";">
                <asp:Label style="padding-bottom: 10px;" Text="Agregar Sucursal" runat="server" />
                <div id="divNombreSucursal" class="formElement">
                <asp:Label Text="Nombre Sucursal:" runat="server" />
                <asp:TextBox ID="txtBoxNombreSucursal" runat="server" placeholder="Nombre de Sucursal..."></asp:TextBox>
                </div>
                <div id="divDescripcionSucursal" class="formElement">
                <asp:Label Text="Descripción:" runat="server" />
                <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..."></asp:TextBox>
                </div>
                <div id="divProvinciaSucursal" class="formElement">
                <asp:Label Text="Provincia:" runat="server" />
                <asp:DropDownList ID="ddlProvinciaSucursal" runat="server">
                    </asp:DropDownList>
                </div>
                <div id="divDieccionSucursal" class="formElement">
                <asp:Label runat="server" Text="Dirección:"/>
                <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
