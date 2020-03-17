Public Class EditRecord
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If (Request.QueryString("ID") IsNot Nothing) Then
        '    Dim id = Integer.Parse(Request.QueryString("ID"))
        '    Dim db As New Test.AliEntities
        '    Dim recCustomer = db.Customers.Where(Function(x) x.ID = id).FirstOrDefault

        '    Response.Write("From Page1 param1 value=" + Request.QueryString("ID"))
        'End If
    End Sub

End Class