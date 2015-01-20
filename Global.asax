<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
    End Sub
    
    Sub RegisterRoutes(ByVal routes As RouteCollection)
        ' Register a route for /Users/{username}
        routes.MapPageRoute("UserDetailsRoute", "Users/{username}", "~/UserDetails.aspx")
    End Sub
       
</script>