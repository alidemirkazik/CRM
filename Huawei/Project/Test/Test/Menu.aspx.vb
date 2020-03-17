Imports Test.Test

Public Class Menu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <System.Web.Services.WebMethod>
    Public Shared Function getData() As List(Of Customer)
        Dim DBModel = New DBModel
        Return DBModel.Customers.ToList

    End Function



End Class