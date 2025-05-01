<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ej01ListadoSucursal.aspx.cs" Inherits="TP5_Grupo_11.Ej01ListadoSucursal" %>
<%@ Register Src="Nav.ascx" TagPrefix="uc" TagName="Nav" %>

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
    <uc:Nav runat="server" ID="nav1" /> 
    <form id="formularioEj01ListadoSucursal" runat="server">
    </form>
</body>
</html>
