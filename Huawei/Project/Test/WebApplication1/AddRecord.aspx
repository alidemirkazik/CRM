<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddRecord.aspx.vb" Inherits="Test.AddRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Add Record</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <style>
        body
        {
            background-color: black;
        }

        .button1
        {
            display: inline-block;
            border-radius: 12px;
            background-color: #f4511e;
            border: black;
            color: #FFFFFF;
            text-align: center;
            font-size: 16px;
            padding: 1px;
            width: 60px;
            height: 35px;
            transition: all 0.5s;
            cursor: pointer;
        }

        .button2
        {
            display: inline-block;
            border-radius: 12px;
            background-color: #f4511e;
            border: black;
            color: #FFFFFF;
            text-align: center;
            font-size: 16px;
            padding: 5px;
            width: 72px;
            height: 35px;
            transition: all 0.5s;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div style="margin-left:15px; margin-top:30px;">
  
        <p style="color:lightgrey;">ID <input id="id" type="text" name="id" style="margin-left:72px; border-radius:10px; height:20px" size="25" value="0" readonly="readonly" disabled="disabled" /></p>
        <p style="color:lightgrey;">First Name <input id="firstname" type="text" name="frstnm" style="margin-left:17px; border-radius:10px; height:20px" size="25"/><br/><br/>
        Last Name
        <input id="lastname" type="text" name="lstnm" style="margin-left:19px; border-radius:10px; height:20px" size="25"/><br/><br/>
        Company
        <input id="company" type="text" name="cmpny" style="margin-left:26px; border-radius:10px; height:20px" size="25"/><br/><br/>
        Address
        <input id="address" type="text" name="addrss" style="margin-left:36px; border-radius:10px; height:20px" size="25"/><br/><br/>
        City
        <input id="city" type="text" name="cty" style="margin-left:61px; border-radius:10px; height:20px" size="25"/><br/><br/>
        Country
        <input id="country" type="text" name="cntry" style="margin-left:36px; border-radius:10px; height:20px" size="25"/><br/><br/>
        Zip Code
        <input id="zipcode" type="text" name="zpcd" style="margin-left:28px; border-radius:10px; height:20px" size="25"/><br/><br/>

        <button class="button1" style="vertical-align:middle; margin-left: 100px"><span>Save</span></button>
        <button class="button2" style="vertical-align:middle; margin-left: 27px" onclick="window.open('', '_self', ''); window.close();"><span>Cancel</span></button>
    </div>

    <script>
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }

        $(".button1").click(function ()
        {

            var customer = {
                ID: parseInt($('#id').val()),
                FirstName: $('#firstname').val(),
                LastName: $('#lastname').val(),
                Company: $('#company').val(),
                Address: $('#address').val(),
                City: $('#city').val(),
                Country: $('#country').val(),
                ZipCode: parseInt($('#zipcode').val())
            }

            $.ajax(
                {
                    url: '/WebService1.asmx/AddRecord_EditRecord',
                    type: 'POST',
                    data: JSON.stringify({ "Customer": customer }),
                    dataType: 'json',
                    async: false,
                    contentType: 'application/json; charset=utf-8',

                    success: function (response) {
                        alert("Your record is added successfully!");
                        window.close();

                        window.onunload = refreshParent;
                        function refreshParent() {
                            window.opener.location.reload();
                        }
                    },
                    error: function (xhr, status, err) {
                        alert('Error');
                        alert(xhr.responseText);
                    }
                });

        });

    </script>

</body>
</html>
