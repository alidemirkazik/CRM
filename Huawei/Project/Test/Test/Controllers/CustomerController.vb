Imports System.Web.Mvc

Namespace Controllers
    Public Class CustomerController
        Inherits Controller

        ' GET: Customer
        Function Index() As ActionResult
            Return View()
        End Function
    End Class
End Namespace