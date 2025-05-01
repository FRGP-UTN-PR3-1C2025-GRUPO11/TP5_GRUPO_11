<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Nav.ascx.cs" Inherits="TP5_Grupo_11.Componentes" %>
    <style>
        .divHyperLinks {
            justify-content: center;
            display: flex;
            gap: 100px;
        }
    </style>
<div class="divHyperLinks">
    <asp:HyperLink runat="server" Text="Agregar Sucursal" NavigateUrl="~/Ej01AgregarSucursal.aspx" ID="agregar_sucursal"></asp:HyperLink>
    <asp:HyperLink runat="server" Text="Listado de Sucursales" NavigateUrl="~/Ej01ListadoSucursal.aspx" ID="listado_sucursal"></asp:HyperLink>
    <asp:HyperLink runat="server" Text="Eliminar Sucursal" NavigateUrl="~/Ej01EliminarSucursal.aspx" ID="eliminar_sucursal"></asp:HyperLink>
</div>

<%--Explicación de la implementación de la página .ascx
    
    Esta página .ascx es un fragmento de codigo repetitivo y común.

    La implementacion en cada pagina aspx es la siguiente, que se coloca al principio antes de <head>

    <%@ Register Src="Nav.ascx" TagPrefix="uc" TagName="Nav" %>

    Y la ubicación precisa en el html es la siguiente:

    <uc:Nav runat="server" ID="nav1" />

--%>
