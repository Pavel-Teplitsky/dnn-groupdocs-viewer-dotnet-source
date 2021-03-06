﻿<%@ Control language="C#" Inherits="DotNetNuke.Modules.DnnInstallableViewer.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>

<asp:HiddenField runat="server" ID="URL" />
<asp:HiddenField runat="server" ID="Width" Value="800" />
<asp:HiddenField runat="server" ID="Height" Value="600" />
<asp:HiddenField runat="server" ID="DefaultFileName" />
<asp:HiddenField runat="server" ID="UseHttpHandlers" Value="false" />
<asp:HiddenField runat="server" ID="UrlNameSufix" Value="false" />

<% if (URL.Value != null && URL.Value.Length > 0) %>
<% { %>
<!-- <script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/jquery-1.9.1.min.js'></script> -->
<!-- <script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/jquery-ui-1.10.3.min.js'></script> -->
<script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/knockout-2.2.1.js'></script>
<script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/turn.min.js'></script>
<script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/modernizr.2.6.2.Transform2d.min.js'></script>
<script type='text/javascript'>
	if (!window.Modernizr.csstransforms) {
		$.ajax({
		    url: '<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=libs/turn.html4.min.js',
		    dataType: 'script',
		    type: 'GET',
		    async: false
		});
	}
</script>
<script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=installableViewer.min.js'></script>
<script type='text/javascript'>
	$.fn.jGroupdocsViewer.applicationPath = '<%= URL.Value %>/';
</script>
<script type='text/javascript'>
	$.fn.jGroupdocsViewer.useHttpHandlers = <%= UseHttpHandlers.Value %>;
</script>
<script type='text/javascript' src='<%= URL.Value %>/document-viewer/GetScript<%= UrlNameSufix.Value %>?name=GroupdocsViewer.all.min.js'></script>
<link rel='stylesheet' type='text/css' href='<%= URL.Value %>/document-viewer/CSS/GetCss<%= UrlNameSufix.Value %>?name=bootstrap.css' />
<link rel='stylesheet' type='text/css' href='<%= URL.Value %>/document-viewer/CSS/GetCss<%= UrlNameSufix.Value %>?name=GroupdocsViewer.all.min.css' />
<link rel='stylesheet' type='text/css' href='<%= URL.Value %>/document-viewer/CSS/GetCss<%= UrlNameSufix.Value %>?name=jquery-ui-1.10.3.dialog.min.css' />


<div id="groupdocs-viewer"></div>
<script type="text/javascript">
    $(function () {
        var localizedStrings = null;
        var thumbsImageBase64Encoded = null;
        $('#groupdocs-viewer').jGroupdocsViewer({
            filePath: '<%= DefaultFileName.Value %>',
            docViewerId: 'doc_viewer1',
            quality: 100,
            showThumbnails: true,
            openThumbnails: true,
            initialZoom: 100,
            zoomToFitWidth: true,
            zoomToFitHeight: false,
            width: <%= Width.Value %>,
            height: <%= Height.Value %>,
            backgroundColor: '',
            showFolderBrowser: true,
            showPrint: true,
            showDownload: true,
            showZoom: true,
            showPaging: true,
            showViewerStyleControl: true,
            showSearch: true,
            preloadPagesCount: 0,
            viewerStyle: 1,
            supportTextSelection: true,
            usePdfPrinting: false,
            localizedStrings: localizedStrings,
            thumbsImageBase64Encoded: thumbsImageBase64Encoded,
            toolbarButtonsBoxShadowStyle: '',
            toolbarButtonsBoxShadowHoverStyle: '',
            thumbnailsContainerBackgroundColor: '',
            thumbnailsContainerBorderRightColor: '',
            toolbarBorderBottomColor: '',
            toolbarInputFieldBorderColor: '',
            toolbarButtonBorderColor: '',
            toolbarButtonBorderHoverColor: ''
        });
    });
</script> 

<% } %>

