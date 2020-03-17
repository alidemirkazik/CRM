Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports Test.Test
Imports System.Data.Entity

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebService1
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function getData() As List(Of Customer)
        Return New AliEntities1().Customers.ToList
    End Function

    <WebMethod()>
    Public Function getData2(id As String) As List(Of Customer)
        Return New AliEntities1().Customers.Where(Function(x) x.ID = id).ToList
    End Function

    <WebMethod()>
    Public Function AddRecord_EditRecord(ByVal Customer As Customer) As Boolean
        Try
            Using db As New AliEntities1()
                Dim record = db.Customers.Where(Function(x) x.ID = Customer.ID).FirstOrDefault()

                If record Is Nothing Then
                    record = New Customer
                End If

                record.FirstName = Customer.FirstName
                record.LastName = Customer.LastName
                record.Company = Customer.Company
                record.Address = Customer.Address
                record.City = Customer.City
                record.Country = Customer.Country
                record.ZipCode = Customer.ZipCode

                If Customer.ID = 0 Then
                    db.Customers.Add(Customer)
                End If

                Return db.SaveChanges() > 0
            End Using

        Catch ex As Exception

            Return False

        End Try


    End Function

    <WebMethod()>
    Public Function DeleteRecord(ByVal Customer As Customer) As Boolean
        Try
            Using db As New AliEntities1()
                Dim record = db.Customers.Where(Function(x) x.ID = Customer.ID).FirstOrDefault()

                If record Is Nothing Then
                    Return False
                End If

                db.Customers.Remove(record)
                Return db.SaveChanges() > 0
            End Using

        Catch ex As Exception

            Return False

        End Try


    End Function

    <WebMethod()>
    Public Function LoginInfo(ByVal Login As Login) As Boolean
        Try
            If String.IsNullOrWhiteSpace(Login.Username) OrElse String.IsNullOrWhiteSpace(Login.Password) Then
                Return False
            End If

            Using db As New AliEntities1()
                Dim record = db.Logs.Where(Function(x) x.Username = Login.Username And x.Password = Login.Password).FirstOrDefault()

                If record Is Nothing Then
                    Return False
                End If
                Return True
            End Using

        Catch ex As Exception

            Return False

        End Try


    End Function

    <WebMethod()>
    Public Function ForgotPassword(ByVal Login As Login) As Boolean
        Try
            If String.IsNullOrWhiteSpace(Login.Username) OrElse String.IsNullOrWhiteSpace(Login.Email) Then
                Return False
            End If

            Using db As New AliEntities1()
                Dim record = db.Logs.Where(Function(x) x.Username = Login.Username And x.Email = Login.Email).FirstOrDefault()

                If record Is Nothing Then
                    Return False
                End If
                Return True
            End Using

        Catch ex As Exception

            Return False

        End Try


    End Function

    <WebMethod()>
    Public Function CreateNewPassword(cUsername As String, cPassword As String, cRetypePassword As String) As Boolean
        Try
            If String.IsNullOrWhiteSpace(cUsername) AndAlso String.IsNullOrWhiteSpace(cPassword) AndAlso String.IsNullOrWhiteSpace(cRetypePassword) Then
                Return False
            End If

            Using db As New AliEntities1()
                Dim record = db.Logs.Where(Function(x) x.Username = cUsername).FirstOrDefault()

                If record IsNot Nothing Then
                    record.Password = cPassword
                End If

                Return db.SaveChanges() > 0
            End Using

        Catch ex As Exception

            Return False

        End Try


    End Function

End Class


