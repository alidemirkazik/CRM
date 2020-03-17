<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Main.aspx.vb" Inherits="Test.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <style>
        body {
            background-image: url("https://yerelyonetimblog.com/wp-content/uploads/2017/07/ortak%C3%B6y-sahil-siyah-beyaz.jpg");
            background-repeat: no-repeat;
        }

        .input1 {
            border-radius: 12px;
            width: 200px;
            height: 20px;
            margin: 0px 670px 3px 5px;
        }

        .input2 {
            border-radius: 12px;
            width: 200px;
            height: 20px;
            margin: 1px 700px 5px 2px;
        }

        .button1 {
            text-align: center;
            font-style: italic;
            border-radius: 12px;
            padding: 8px;
            margin: 10px 125px 30px 105px;
            font-size: 10px;
            width: 100px;
        }

        .button2 {
            display: inline-block;
            border-radius: 12px;
            background-color: #f4511e;
            border: black;
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            padding: 20px;
            width: 205px;
            height: 60px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 0px 630px 20px 1px;
        }

            .button2 span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

                .button2 span:after {
                    content: '\00bb';
                    position: absolute;
                    opacity: 0;
                    top: 0;
                    right: -20px;
                    transition: 0.5s;
                }

            .button2:hover span {
                padding-right: 25px;
            }

                .button2:hover span:after {
                    opacity: 1;
                    right: 0;
                }

        .general {
            border: 2px solid grey;
            border-radius: 12px;
            background-color: black;
            box-sizing: content-box;
            width: 202px;
            height: 350px;
            padding: 30px;
            margin: 310px 180px 100px 720px;
        }
    </style>

</head>
<body>

    <script>
        function login()
        {
            var login = {
                Username: $('#username').val(),
                Password: $('#password').val()
            }
            $.ajax(
                {
                    url: '/WebService1.asmx/LoginInfo',
                    type: 'POST',
                    data: JSON.stringify({ "Login": login }),
                    dataType: 'json',
                    async: false,
                    contentType: 'application/json; charset=utf-8',

                    success: function (response) {
                        if (response.d == true)
                        {
                            window.location.replace('/Menu.aspx')
                        }
                        else
                            alert("Login failed. Please try again!")
                    },
                    error: function (xhr, status, err) {
                        alert('Oops!! Some problem occured..');
                        alert(xhr.responseText);
                    }
                });
        }
    </script>

    <div class="general">
        <p style="color: lightgrey; font-size: 20px">Username</p>
        <input id="username" class="input1" type="text" name="usrnm" style="margin-left: -1px" />
        <p style="color: lightgrey; font-size: 20px">Password</p>
        <input id="password" class="input2" type="password" name="psswrd" style="margin-left: -1px" />

        <button class="button1" style="vertical-align: middle" onclick="window.location.href ='/ForgotPassword.aspx';"><span>*Forgot Password</span></button>
        <button class="button2" style="vertical-align: middle" onclick="login()"><span>Login</span></button>

    </div>
</body>
</html>
