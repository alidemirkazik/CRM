<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="Test.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"></script>



    <style>
        body {
            background-image: url("https://yerelyonetimblog.com/wp-content/uploads/2017/07/ortak%C3%B6y-sahil-siyah-beyaz.jpg");
            background-repeat: no-repeat;
            margin: 0;
            font-family: "Lato", sans-serif;
        }


        /*LEFT-HANDSIDE MENU*/

        .LeftSideBar {
            margin: 0;
            padding: 60px 0px 0px 0px;
            width: 250px;
            background-color: black;
            position: fixed;
            height: 100%;
            overflow: auto;
            opacity: 0.5;
            filter: alpha(opacity=50);
            transition: 0.3s;
        }

            .LeftSideBar:hover {
                opacity: 1.0;
                filter: alpha(opacity=100);
            }

            .LeftSideBar a {
                display: block;
                color: lightgrey;
                padding: 8px 8px 8px 32px;
                font-size: 25px;
                text-decoration: none;
            }

                .LeftSideBar a.active {
                    font-weight: bold;
                    color: white;
                }

                .LeftSideBar a:hover:not(.active) {
                    background-color: #f4511e;
                    color: white;
                }

        div.content {
            margin-left: 200px;
            padding: 1px 16px;
            height: 1000px;
        }

        @media screen and (max-width: 700px) {
            .LeftSideBar {
                width: 100%;
                height: auto;
                position: relative;
            }

                .LeftSideBar a {
                    float: left;
                }

            div.content {
                margin-left: 0;
            }
        }

        @media screen and (max-width: 400px) {
            .LeftSideBar a {
                text-align: center;
                float: none;
            }
        }


        /*RIGHT-HANDSIDE MENU*/

        .RightSideNav {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            right: 0;
            background-color: black;
            overflow-x: hidden;
            transition: 0.3s;
            padding-top: 60px;
            opacity: 0.5;
            filter: alpha(opacity=50);
        }

            .RightSideNav:hover {
                opacity: 1.0;
                filter: alpha(opacity=100);
            }

            .RightSideNav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

                .RightSideNav a:hover {
                    color: #f1f1f1;
                }

                    .RightSideNav a:hover:not(.active) {
                        background-color: grey;
                        color: white;
                    }

            .RightSideNav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                padding: 8px;
                margin-left: 50px;
            }

        @media screen and (max-height: 450px) {
            .RightSideNav {
                padding-top: 15px;
            }

                .RightSideNav a {
                    font-size: 18px;
                }
        }

        /*JQUERY GRID*/

        .ui-jqgrid {
            background-color: white;
        }

            .ui-jqgrid.ui-jqgrid-bootstrap {
                border: 1px solid black;
            }

                .ui-jqgrid.ui-jqgrid-bootstrap .ui-jqgrid-caption {
                    background-color: grey;
                    text-align: center;
                    font-weight: bold;
                }

                .ui-jqgrid.ui-jqgrid-bootstrap .ui-jqgrid-hdiv {
                    background-color: lightgrey;
                }

        .modal-dialog {
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
    </style>

</head>
<body>
    <div class="LeftSideBar">
        <a href="#news">Home</a>
        <a href="#news">News</a>
        <a href="#contact">Contact</a>
        <a href="#about">About</a>
        <div style="font-family: fantasy; position: fixed; bottom: 0"><a class="active" href="#home">CRM 1.0</a></div>
    </div>

    <div id="mySidenav" class="RightSideNav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>
        <a href="#">Contact</a>
    </div>

    <div style="text-align: right; color: #f4511e;">
        <span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        $(document).ready(function () {
            document.getElementById("mySidenav").style.width = "0";

        });


        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }

        function myFunction() {
            window.open('/EditContact', 'popup', 'width=280,height=340'); return false;
        }
    </script>

    <script>
        var lstdata = [];

        $.ajax(
            {
                url: 'http://localhost:50258/WebService1.asmx/HelloWorld',
                type: 'POST',
                dataType: 'json',
                async: true,
                contentType: 'application/json; charset=utf-8',

                success: function (response) {
                    alert(response);
                },
                error: function (res, err) {
                    alert(err.Message);
                }
            });


        $(function () {
            "use strict";
            $("#grid").jqGrid({
                colModel: [
                    { name: "ID", width: 70, editable: true },
                    { name: "FirstName", editable: true },
                    { name: "LastName", editable: true },
                    { name: "Company", editable: true },
                    { name: "Address", editable: true },
                    { name: "City", editable: true },
                    { name: "Country", editable: true },
                    { name: "ZipCode", width: 80, editable: true }
                ],

                data: lstdata,

                edit:
                {
                    addCaption: "Add Record",
                    editCaption: "Edit Record",
                    bSubmit: "Submit",
                    bCancel: "Cancel",
                    bClose: "Close",
                    saveData: "Data has been changed! Save changes?",
                    bYes: "Yes",
                    bNo: "No",
                    bExit: "Cancel",
                },
                ondblClickRow: function (rowid) {
                    jQuery(this).jqGrid('editGridRow', rowid);
                },
                guiStyle: "bootstrap",
                iconSet: "fontAwesome",
                idPrefix: "gb1_",
                rownumbers: true,
                sortname: "invdate",
                sortorder: "desc",
                caption: "Customer List",
                pager: "#pager",
                toppager: true,
                viewrecords: true,
                rowNum: 25,
                searching: { defaultSearch: "cn" },
            }).jqGrid("filterToolbar").jqGrid('navGrid', '#pager', { edit: true, add: true, del: true });
            //$("#export").on("click", function () {
            //    $("#grid").jqGrid("exportToExcel", {
            //        includeLabels: true,
            //        includeGroupHeader: true,
            //        includeFooter: true,
            //        fileName: "jqGridExport.xlsx",
            //        maxlength: 40 // maxlength for visible string data 
            //    })
            //});
            jQuery("#grid").jqGrid('navButtonAdd', '#pager', {
                caption: "",
                onClickButton: function () {
                    //jQuery("#grid").excelExport();
                    $("#grid").jqGrid("exportToExcel")
                }
            });

        });

    </script>



    <h2 style="margin-left: 720px; color: lightgrey">Customer List</h2>

    <div style="margin-left: 310px; margin-top: 70px">
        <table id="grid"></table>
    </div>

    <div id="pager"></div>

    <button id="export" style="margin-left: 300px;">Export to Excel</button>

</body>
</html>
