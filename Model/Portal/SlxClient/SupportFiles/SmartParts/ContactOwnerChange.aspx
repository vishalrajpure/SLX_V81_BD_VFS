<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactOwnerChange.aspx.cs" Inherits="SmartParts_ContactOwnerChange" %>
<%@ Register Assembly="Sage.SalesLogix.Client.GroupBuilder" Namespace="Sage.SalesLogix.Client.GroupBuilder" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Timeline" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.SmartParts" TagPrefix="SalesLogix" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Change Account Owner</title>
    <script lang ="javascript" src="../jscript/sage-common/sage-common.js" type ="text/javascript"></script>
    <script lang="javascript" type="text/javascript">

    </script>

    <link href="../css/sage-controls.css" rel="stylesheet" type="text/css" />
    <link href="../css/sage-styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/YUI/fonts-min.css" rel="stylesheet" />
    <link href="../css/quickform.css" rel="stylesheet" />
    <link href="../css/YUI/button.css" rel="stylesheet" />
    <link href="../css/SlxBase.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../css/YUI/fonts.css" />
    <link rel="stylesheet" type="text/css" href="../css/YUI/reset.css" />
    <link rel="stylesheet" type="text/css" href="Libraries/ext/resources/css/ext-all.css" />
    <link rel="stylesheet" type="text/css" href="../css/YUI/container.css" />
    <link rel="stylesheet" type="text/css" href="../css/sage-styles.css" />  
</head>
<body>
     <form id="form1" runat="server">
     <br />
    <div >
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblselect" Text="Users:" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpusers" runat="server">
                    </asp:DropDownList>
                  
                </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
           <%-- <tr>
                <td>
                   <asp:Label ID="Label1" Text="Role:" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drprole" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>--%>
            
        </table>
    </div>
    </form>
</body>
</html>
