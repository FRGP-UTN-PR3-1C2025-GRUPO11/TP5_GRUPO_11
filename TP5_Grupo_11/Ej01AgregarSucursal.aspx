<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="Ej01AgregarSucursal.aspx.cs"
    UnobtrusiveValidationMode="None"
    Inherits="TP5_Grupo_11.Ej01AgregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            margin-bottom: 15px;
        }

        .formElement {
            display: flex;
            justify-content: left;
            gap: 10px;
            flex-direction: row;
        }

            .formElement > select,
            .formElement > input {
                width: 145px
            }

            .formElement > :nth-child(1) {
                width: 200px;
            }

        body {
            margin: 0 auto;
            width: 960px;
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
        <h1>Agregar Sucursal</h1>
    </header>

    <main>
        <form id="formularioEj01AgregarSucursal" runat="server">
            <section>
                <div id="datosSucursal">
                    <%-- NOMBRE SUCURSAL --%>
                    <div id="divNombreSucursal" class="formElement">
                        <asp:Label Text="Nombre Sucursal:" runat="server" />
                        <asp:TextBox ID="txtBoxNombreSucursal" runat="server" placeholder="Nombre de Sucursal..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtBoxNombreSucursal" Display="Dynamic">Falta nombre</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvNombreSucursal" runat="server" ErrorMessage="Máximo 100 caracteres" Display="Dynamic" ControlToValidate="txtBoxNombreSucursal"
                            EnableClientScript="False" Font-Bold="True" ForeColor="Red" OnServerValidate="cvNombreSucursal_ServerValidate"></asp:CustomValidator>
                        <asp:Label runat="server" ID="lblErrorNombre"></asp:Label>
                    </div>
                    <%-- DESCRIPCION SUCURSAL --%>
                    <div id="divDescripcionSucursal" class="formElement">
                        <asp:Label Text="Descripción:" runat="server" />
                        <asp:TextBox ID="txtBoxDescripcionSucursal" runat="server" placeholder="Descripción..." TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripSucursal" runat="server" ControlToValidate="txtBoxDescripcionSucursal">Falta descripción</asp:RequiredFieldValidator>
                        &nbsp;<asp:CustomValidator ID="cvDescripcion" runat="server" ControlToValidate="txtBoxDescripcionSucursal" OnServerValidate="cvDescripcion_ServerValidate">No se puede ingresar mas de 100 letras</asp:CustomValidator>
                    </div>
                    <%-- PROVINCIAS SUCURSAL --%>
                    <div id="divProvinciaSucursal" class="formElement">
                        <asp:Label Text="Provincia:" runat="server" />
                        <asp:DropDownList ID="ddlProvinciaSucursal" runat="server">
                            <asp:ListItem Enabled="True" Text="--Seleccionar--" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvinciaSucursal" ErrorMessage="Seleccione una Provincia" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                    <%-- DIRECCION SUCURSAL --%>
                    <div id="divDieccionSucursal" class="formElement">
                        <asp:Label runat="server" Text="Dirección:" />
                        <asp:TextBox ID="txtBoxDireccionSucursal" runat="server" placeholder="Dirección..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccionSucursal" runat="server" ControlToValidate="txtBoxDireccionSucursal">Falta la dirección</asp:RequiredFieldValidator>
                        <asp:Label runat="server" ID="lblErrorDireccion"></asp:Label>
                        <asp:CustomValidator ID="cvDireccion" runat="server" ControlToValidate="txtBoxDireccionSucursal" OnServerValidate="cvDireccion_ServerValidate">No se puede ingresar mas de 100 letras</asp:CustomValidator>
                    </div>
                </div>
            </section>

            <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
            <p>
                <asp:Label ID="lblAgregado" runat="server"></asp:Label>
            </p>
        </form>
    </main>
</body>
</html>
