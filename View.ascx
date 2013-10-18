<%@ Control language="C#" Inherits="DotNetNuke.Modules.DnnInstallableViewer.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>

<asp:HiddenField runat="server" ID="URL" />
<asp:HiddenField runat="server" ID="Width" Value="800" />
<asp:HiddenField runat="server" ID="Height" Value="600" />
<asp:HiddenField runat="server" ID="DefaultFileName" />

<asp:Literal runat="server" ID="ltrScript"></asp:Literal>
<asp:Literal runat="server" ID="ltrContent"></asp:Literal>


<div id="test" style="width: 900px; height: 500px; position: relative;margin-bottom: 20px;"></div>
