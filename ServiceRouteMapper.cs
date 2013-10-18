using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Instrumentation;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Web.Api;
using Groupdocs.Web.UI;
using System.IO;
using DotNetNuke.Security.Permissions;
using DotNetNuke.Security.Roles;

namespace DotNetNuke.Modules.DnnInstallableViewer
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public class ServiceRouteMapper : IServiceRouteMapper
    {
        private const string FOLDER_NAME = "groupdocs-viewer";

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// 
        /// </summary>
        /// -----------------------------------------------------------------------------
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            // CreateRootDirectoryForModuleFiles(FOLDER_NAME);
            Viewer.SetRootStoragePath("C:\\Users\\work\\Documents\\My Web Sites\\groupdocs-viewer-folder\\"); // "~/testfiles/"
            Viewer.EnableFileListRequestHandling(true);
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// 
        /// </summary>
        /// -----------------------------------------------------------------------------
        protected void CreateRootDirectoryForModuleFiles(string folderName)
        {
            int portalId = PortalController.GetCurrentPortalSettings().PortalId;
            var folderController = new FolderController();
            var folderId = folderController.AddFolder(
                new FolderInfo(portalId, folderName, (int)FolderController.StorageLocationTypes.InsecureFileSystem, isProtected: false, isCached: false, lastUpdated: Null.NullDate));
            var folder = folderController.GetFolderInfo(portalId, folderId);
            Directory.CreateDirectory(folder.PhysicalPath);

            var permissionController = new PermissionController();
            var writePermission = permissionController.GetPermissionByCodeAndKey("SYSTEM_FOLDER", "WRITE").Cast<PermissionInfo>().Single();
            var registeredUserRole = new RoleController().GetRoleByName(folder.PortalID, "Registered Users");
            folder.FolderPermissions.Add(new FolderPermissionInfo
            {
                FolderID = folder.FolderID,
                PermissionID = writePermission.PermissionID,
                RoleID = registeredUserRole.RoleID,
                UserID = Null.NullInteger,
                PermissionKey = writePermission.PermissionKey,
                AllowAccess = false
            });
            /*
                         int portalId = PortalController.GetCurrentPortalSettings().PortalId;
            var folderId = FolderManager.Instance.AddFolder(portalId, folderName);
                //new FolderInfo(portalId, folderName, (int)FolderController.StorageLocationTypes.InsecureFileSystem, isProtected: false, isCached: false, lastUpdated: Null.NullDate));
            var folder = FolderManager.Instance.GetFolder(portalId, FOLDER_NAME);
            Directory.CreateDirectory(folder.PhysicalPath);

            var permissionController = new PermissionController();
            var writePermission = permissionController.GetPermissionByCodeAndKey("SYSTEM_FOLDER", "WRITE").Cast<PermissionInfo>().Single();
            var registeredUserRole = new RoleController().GetRoleByName(folder.PortalID, "Registered Users");
            folder.FolderPermissions.Add(new FolderPermissionInfo
            {
                FolderID = folder.FolderID,
                PermissionID = writePermission.PermissionID,
                RoleID = registeredUserRole.RoleID,
                UserID = Null.NullInteger,
                PermissionKey = writePermission.PermissionKey,
                AllowAccess = false
            });
             */
        }
    }
}