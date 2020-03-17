<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ForgotPassword.aspx.vb" Inherits="Test.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Creat Password</title>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#button1").click(function () {
                $(this).hide();
                return false;
            });
        });
    </script>

    <style>
        body {
            background-image: url("https://yerelyonetimblog.com/wp-content/uploads/2017/07/ortak%C3%B6y-sahil-siyah-beyaz.jpg");
            background-repeat: no-repeat;
        }

        .input1 {
            border-radius: 12px;
            width: 200px;
            height: 20px;
            margin: 5px 700px 5px 2px;
        }

        .input2 {
            border-radius: 12px;
            width: 200px;
            height: 20px;
            margin: 1px 700px 40px 2px;
        }

        .button1 {
            display: inline-block;
            border-radius: 12px;
            background-color: #f4511e;
            border: black;
            color: #FFFFFF;
            text-align: center;
            font-size: 16px;
            padding: 20px;
            width: 205px;
            height: 60px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 0px 630px 20px 1px;
        }

            .button1 span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

                .button1 span:after {
                    content: '\00bb';
                    position: absolute;
                    opacity: 0;
                    top: 0;
                    right: -20px;
                    transition: 0.5s;
                }

            .button1:hover span {
                padding-right: 25px;
            }

                .button1:hover span:after {
                    opacity: 1;
                    right: 0;
                }

        .general {
            border: 2px solid grey;
            border-radius: 12px;
            background-color: black;
            box-sizing: content-box;
            width: 202px;
            height: 320px;
            padding: 30px;
            margin: 310px 180px 100px 720px;
        }
    </style>
</head>

<body>
    <script>
        function create_new_password()
        {
            var Password = $('#newpassword').val();
            var RetypePassword = $('#retypepassword').val();
            var cUsername = getParameterByName('cUsername', location.href);

            if (Password != RetypePassword) {
                alert("Make sure your passwords match and try again!")
            }
            else {
                $.ajax(
                    {
                        url: '/WebService1.asmx/CreateNewPassword',
                        type: 'POST',
                        data: '{"cUsername": "' + cUsername + '", "cPassword": "' + Password + '", "cRetypePassword": "' + RetypePassword + '"}',
                        dataType: 'json',
                        async: false,
                        contentType: 'application/json; charset=utf-8',

                        success: function (response) {
                            if (response.d == true) {
                                alert("Congratulations, you successfully changed your password!!!");
                                window.location.replace('/Main.aspx')
                            }
                            else
                                alert("Oops!! Something went wrong..")
                        },
                        error: function (xhr, status, err) {
                            alert('Oops!! Some problem occured..');
                            alert(xhr.responseText);
                        }
                    });
            }
        }

        function getParameterByName(name, url)
        {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
    </script>

    <div class="general">
        <p style="color: lightgrey; font-size: 20px">New Password</p>
        <input id="newpassword" class="input1" type="password" name="usrnm" style="margin-left: -1px" />
        <p style="color: lightgrey; font-size: 20px">Re-type New Password</p>
        <input id="retypepassword" class="input2" type="password" name="psswrd" style="margin-left: -1px" />

        <button class="button1" style="vertical-align: middle" onclick="create_new_password()"><span>Create New Password</span></button>
    </div>

</body>
</html>
