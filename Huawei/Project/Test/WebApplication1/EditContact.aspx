<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditContact.aspx.vb" Inherits="Test.EditContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="margin-left:14px; margin-top:15px;">
        Name
        <input type="text" name="usrnm" style="margin-left:35px"/><br/><br/>
        Last Name
        <input type="text" name="psswrd" style="margin-left:4px"/><br/><br/>
        Company
        <input type="text" name="cmpny" style="margin-left:11px"/><br/><br/>
        Address
        <input type="text" name="addrss" style="margin-left:21px"/><br/><br/>
        City
        <input type="text" name="cty" style="margin-left:45px"/><br/><br/>
        Country
        <input type="text" name="cntry" style="margin-left:20px"/><br/><br/>
        Zip Code
        <input type="text" name="zpcd" style="margin-left:13px"/>
    </div>

    <button type="button" style="margin-top:20px; margin-left:91px" onclick="alert('Hello world!')">Submit</button>
    <button type="button" style="margin-top:20px; margin-left:20px" onclick="closeWindow()">Cancel</button>

    <script>
        function closeWindow()
        {
            var Ans = confirm("Are you sure you want to leave this page?");
            if (Ans == true)
                close();
            else
                return false;
        }
        
            
            
        
    </script>

</body>
</html>
