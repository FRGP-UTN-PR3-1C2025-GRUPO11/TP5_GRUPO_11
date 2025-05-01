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
            width: 900px;
        }

        .formElement {
            display: flex;
            justify-content: left;
            gap: 10px;
            flex-direction: row;
        }

        .formElement > select, 
        .formElement > input 
        {
            width: 160px
        }

        #divBotones {
            margin-top: 15px;
            justify-content: center;
            gap: 30px;
            width: 350px;
        }
        #divBotones > input {
            width: 90px;
        }
        #datosSucursal span:first-of-type {
            width: 160px;
        }

        .validaciones {
            color: red;
            font-weight: bolder;
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
                    <asp:CustomValidator ID="cvNombreSucursal" runat="server" ControlToValidate="txtBoxNombreSucursal" OnServerValidate="cvNombreSucursal_ServerValidate" CssClass="validaciones" ErrorMessage="Error en Nombre Sucursal"></asp:CustomValidator>
                </div>
                <div id="divDescripcionSucursal" class="formElement">
                <asp:Label Text="Descripción:" runat="server" />
                <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..."></asp:TextBox>
                    <asp:CustomValidator ID="cvDescripcionSucursal" runat="server" ControlToValidate="txtBoxDescripcionSucursal" OnServerValidate="cvDescripcionSucursal_ServerValidate" CssClass="validaciones" ErrorMessage="Error en Descripción"></asp:CustomValidator>
                </div>
                <div id="divProvinciaSucursal" class="formElement">
                <asp:Label Text="Provincia:" runat="server" />
                <asp:DropDownList ID="ddlProvinciaSucursal" runat="server">
                    </asp:DropDownList>
                </div>
                <div id="divDireccionSucursal" class="formElement">
                <asp:Label runat="server" Text="Dirección:"/>
                <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                    <asp:CustomValidator ID="cvDireccionSucursal" runat="server" ControlToValidate="txtBoxDireccionSucursal" OnServerValidate="cvDireccionSucursal_ServerValidate" CssClass="validaciones" ErrorMessage="Error en Dirección"></asp:CustomValidator>
                </div>
                <div id="divBotones" class="formElement">
                    <input type="reset"  value="Restablecer" />
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
                </div>
                <div id="divValidaciones">
                    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                </div>
            </div>
        </section>
    </form>
</body>
</html>
