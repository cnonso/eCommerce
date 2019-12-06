<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="eCommerceTemplate.Demo" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title runat="server"><% Response.Write("pageTitle"); %>  | Pixels Inventory Manager</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link href="~/Styles/grid.css" rel="stylesheet" />
    <link rel="stylesheet" href="~/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="~/plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="~/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="~/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="~/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="~/plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="~/dist/css/AdminLTE.min.css">

    <!-- Morris charts -->
    <link rel="stylesheet" href="~/plugins/morris/morris.css">

    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="~/dist/css/skins/_all-skins.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="~/plugins/datatables/dataTables.bootstrap.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-black sidebar-mini" onload="IndicateSelectedRack();">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="Default.aspx" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b class="fa fa-cubes">DS</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>
                    <img src="../Images/_logo.png" width="145" /></b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <asp:Image runat="server" ID="userPassport2" ImageUrl="~/images/avater.png" CssClass="user-image" AlternateText="User Image" />
                                <span class="hidden-xs">Username</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <asp:Image runat="server" ID="userPassport3" ImageUrl="~/images/avater.png" CssClass="img-circle" AlternateText="User Image" />
                                    <p>
                                        Username
                                        <small>Added since </small>
                                    </p>
                                </li>
                                <!-- Menu Body -->

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="../../pages/users/Profile.aspx" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="Default.aspx?logout=1" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->
                        <li>
                            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <asp:Image runat="server" ID="userPassport1" ImageUrl="~/images/avater.png" CssClass="img-circle" AlternateText="User Image" />
                    </div>
                    <div class="pull-left info">
                        <p>Username</p>
                        <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
                    </div>
                </div>

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">OFFICE</li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-laptop"></i><span>System Manager</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="Default.aspx?task=user setup"><i class="fa fa-circle-o"></i>User Setup</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" id="pnlContentPane" runat="server">
            <form id="form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>Daily Sales<small>Sales Records from : 
            <asp:Label ID="lblMachineName" runat="server" Text="Label"></asp:Label></small>

                        <asp:Label ID="lblReport" runat="server" Text=""></asp:Label>
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Default box -->
                            <div class="box box-warning">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Products List</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Company</th>
                                                <th>Product Name</th>
                                                <th style="width: 10%">Available Qty</th>
                                                <th style="width: 10%">Qty</th>
                                                <%--                                    <th style="width: 10%;">Qty (in Pcs)</th>--%>
                                                <th>Price per Unit(₦)</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% Response.Write(listBuilder);%>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer-->
                            </div>
                            <!-- /.box -->
                        </div>
                        <div class="col-md-4">

                            <!-- PRODUCT LIST -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Cart Collection</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="col-sm-12" id="transactionHistory">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <span class="label label-success pull-right"><i class="fa fa-money"></i>Total:
                <asp:Label ID="lblTotalPrice" runat="server" Text="₦0.00"></asp:Label></span>
                                                <span class="label label-success pull-right" style="margin-right: 2em"><i class="fa fa-opencart"></i>Shopping Cart:
                <asp:Label ID="lblTotalItemsInCart" runat="server" Text="Empty"></asp:Label></span>
                                                <table class='table table-bordered table-stripped'>
                                                    <tr>
                                                        <th>Item</th>
                                                        <th style="width: 25%">Qty </th>
                                                        <th>Amt</th>
                                                        <th>Action</th>
                                                    </tr>

                                                    <asp:Literal ID="Literal1"
                                                        Mode="PassThrough"
                                                        runat="server">
                                                    </asp:Literal>

                                                </table>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAddToCart" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnRemoveItem" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnUpdateItem" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:UpdateProgress DisplayAfter="100" ID="UpdateProgress2" DynamicLayout="true" runat="server">
                                            <ProgressTemplate>
                                                <div class="progress">
                                                    <img src="../Content/Images/loading.gif" alt="" />&nbsp;please wait...
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                    <script>

                                        var itemName;
                                        function AddToList(productid, productname, sellingprice, qtyonhand, itemcode, minqty) {

                                            //alert(id+ productname+ sellingprice+ qtyonhand+ itemcode+ minqty);
                                            document.getElementById('<%=txtProductID.ClientID%>').value = productid;
                                            document.getElementById('<%=txtProductName.ClientID%>').value = productname;
                                            document.getElementById('<%=txtSellingPrice.ClientID%>').value = sellingprice;
                                            document.getElementById('<%=txtQty.ClientID%>').value = document.getElementById(productid + '_qty').value;
                                            document.getElementById('<%=txtQtyOnHand.ClientID%>').value = qtyonhand;

                                            if (parseFloat(document.getElementById(productid + '_qty').value) > parseFloat(qtyonhand)) {
                                                alert('Insufficient stock. Only ' + qtyonhand + ' units available.');
                                                document.getElementById('<%=txtQty.ClientID%>').value = qtyonhand;
                                                document.getElementById(productid + '_qty').value = qtyonhand;
                                                 return
                                            }

                                            document.getElementById('<%=btnAddToCart.ClientID%>').click();
                                        }
                                        function RemoveFromCart(productid) {
                                            document.getElementById('<%=cartItem_ID.ClientID%>').value = productid;
                                            document.getElementById('<%=btnRemoveItem.ClientID%>').click();
                                        }
                                        function UpdateItemCount(productid, qtyOnHand) {
                                            document.getElementById('<%=cartItem_ID.ClientID%>').value = productid;
                                            document.getElementById('<%=cartItemNewQty.ClientID%>').value = document.getElementById(productid).value;
                                            document.getElementById('<%=StockQty.ClientID%>').value = qtyOnHand;
                                            if (parseFloat(document.getElementById('<%=cartItemNewQty.ClientID%>').value) > parseFloat(qtyOnHand)) {
                                                alert('Insufficient stock. Only ' + qtyOnHand + ' units available.');
                                                document.getElementById('<%=cartItemNewQty.ClientID%>').value = qtyOnHand;
                                                document.getElementById(productid).value = qtyOnHand;
                                                return
                                            }
                                            document.getElementById('<%=btnUpdateItem.ClientID%>').click();
                                        }
                                    </script>
                                    <div style="display: none">
                                        <input name="addedProductIDs" value="" type="text" id="addedProductIDs" />
                                        <input type="text" value="1" id="currentSerialNo" />
                                        <input type="text" value="" id="selectedRow" />
                                        <input type="text" value="" id="selectedId" />

                                        <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtDiscountPrice" runat="server"></asp:TextBox>

                                    </div>
                                    <div style="display: none">

                                        <asp:TextBox ID="txtProductID" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtSellingPrice" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtQtyOnHand" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>

                                        <asp:Label ID="lblTest" runat="server" Text="Test"></asp:Label>
                                        <asp:Label ID="lblProductID" runat="server" Text="ProductID"></asp:Label>
                                        <asp:Label ID="lblProductName" runat="server" Text="ProductName"></asp:Label>
                                        <asp:Label ID="lblQty" runat="server" Text="Buying Qty"></asp:Label>
                                        <asp:Label ID="lblQtyOnHand" runat="server" Text="Qty On Hand"></asp:Label>
                                        <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                                        <asp:Label ID="lblSellingPrice" runat="server" Text="SellingPrice"></asp:Label>
                                        <asp:Label ID="lblDiscount" runat="server" Text="Discount"></asp:Label>
                                        <asp:Label ID="lblUnitCost" runat="server" Text="UnitCost"></asp:Label>
                                        <asp:Label ID="lblCartTotal" runat="server" Text="CartTotal"></asp:Label>
                                    </div>
                                    <div style="display: none">
                                        <input id="_slotID" name="_slotID" />
                                        <asp:TextBox ID="txtRackID" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtSlotID" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtItemID" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtQtyLeft" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtInitQty" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtTransactionHistory" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="Button" />
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-center">
                                    <input type="button" id="modalBtn" value="Check Out" class="btn btn-warning" />
                                    <asp:Label ID="lblErrReport" CssClass="text-danger" runat="server" Text=""></asp:Label>
                                    <div style="display: none">
                                        <asp:TextBox ID="cartItem_ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnRemoveItem" OnClick="btnRemoveItem_Click" runat="server" Text="Remove" />
                                        <br />
                                        <asp:TextBox ID="cartItemNewQty" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="StockQty" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnUpdateItem" OnClick="btnUpdateItem_Click" runat="server" Text="Update" />
                                    </div>

                                </div>
                                <!-- /.box-footer -->
                            </div>
                            <!-- /.box -->
                        </div>


                    </div>
                </section>
                <!-- /.content -->
            </form>
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.3.0
            </div>
            Copyright &copy; <%Response.Write(DateTime.Now.Year); %>. All rights reserved. <strong>&nbsp; Powered by <a href="http://www.pixelssolution.com">Pixels Solution Limited</a>.</strong>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane" id="control-sidebar-home-tab">
                    <h3 class="control-sidebar-heading">Recent Activity</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                    <p>Will be 23 on April 24th</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-user bg-yellow"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                                    <p>New phone +1(800)555-1234</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                                    <p>nora@example.com</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-file-code-o bg-green"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                                    <p>Execution time 5 seconds</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Tasks Progress</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Custom Template Design
                   
                                    <span class="label label-danger pull-right">70%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Update Resume
                   
                                    <span class="label label-success pull-right">95%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Laravel Integration
                   
                                    <span class="label label-warning pull-right">50%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Back End Framework
                   
                                    <span class="label label-primary pull-right">68%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                </div>
                <!-- /.tab-pane -->
                <!-- Stats tab content -->
                <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                <!-- /.tab-pane -->
                <!-- Settings tab content -->
                <div class="tab-pane" id="control-sidebar-settings-tab">
                    <form method="post">
                        <h3 class="control-sidebar-heading">General Settings</h3>
                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Report panel usage
                 
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Some information about this general settings option
               
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Allow mail redirect
                 
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Other sets of options are available
               
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Expose author name in posts
                 
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Allow the user to show his name in blog posts
               
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <h3 class="control-sidebar-heading">Chat Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Show me as online
                 
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Turn off notifications
                 
                                <input type="checkbox" class="pull-right">
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Delete chat history
                 
                                <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                            </label>
                        </div>
                        <!-- /.form-group -->
                    </form>
                </div>
                <!-- /.tab-pane -->
            </div>
        </aside>
        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="../../plugins/select2/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="../../plugins/input-mask/jquery.inputmask.js"></script>
    <script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="../../plugins/timepicker/bootstrap-timepicker.min.js"></script>

    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="../../plugins/morris/morris.min.js"></script>
    <!-- FastClick -->
    <script src="../../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../dist/js/demo.js"></script>
    <script src="dist/js/pages/dashboard.js"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- DataTables -->
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>

    <script>
        $(function () {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
            $('#example3').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false
            });

            $('#example4').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": false,
                "info": false,
                "autoWidth": false
            });
            $('#example5').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
            $('#example6').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": false,
                "info": false,
                "autoWidth": false
            });
        });
    </script>
    <!-- Page script -->
    <script>
        $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();

            //Datemask dd/mm/yyyy
            $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
            //Datemask2 mm/dd/yyyy
            $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
            //Money Euro
            $("[data-mask]").inputmask();

            //Date range picker
            $('#reservation').daterangepicker();
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
            );

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            });
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            });
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });

            //Colorpicker
            $(".my-colorpicker1").colorpicker();
            //color picker with addon
            $(".my-colorpicker2").colorpicker();

            //Timepicker
            $(".timepicker").timepicker({
                showInputs: false
            });
        });
    </script>

</body>
</html>
