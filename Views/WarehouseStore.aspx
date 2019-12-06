<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WarehouseStore.aspx.cs" Inherits="eCommerceTemplate.Views.WarehouseStore" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pharma &mdash; Store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">


    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
</head>
    
<body onload="FillSliderValue()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="site-wrap">


            <div class="site-navbar py-2">

                <div class="search-wrap">
                    <div class="container">
                        <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
                        <form action="#" method="post">
                            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
                        </form>
                    </div>
                </div>

                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="default.aspx" class="js-logo-clone">
                                    <img src="../images/logo.jpg" height="50" />
                                </a>
                            </div>
                        </div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="../../default.aspx">Home</a></li>
                                    <li class="active"><a href="../Views/Store.aspx">Store</a></li>
                                    <li class="has-children">
                                        <a href="#">Wholesale</a>
                                        <ul class="dropdown">
                                            <li><a href="../views/warehousestore.aspx">Store</a></li>
                                            <li><a href="#">Dashboard</a></li>

                                        </ul>
                                    </li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
                            <a href="../Views/Cart.aspx" class="icons-btn d-inline-block bag">
                                <span class="icon-shopping-bag"></span>
                                <span class="number">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>

                                            <asp:Literal ID="lblCartQty"
                                                Mode="PassThrough"
                                                runat="server">0
                                            </asp:Literal>

                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAddToCart" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnRemoveItem" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnUpdateItem" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                </span>

                            </a>
                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                class="icon-menu"></span></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="../Default.aspx">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Store</strong></div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                            <div id="slider-range" class="border-primary" onchange="SortByPrice()"  onclick="SortByPrice()"></div>
                            <input type="text" name="text" id="amount" onchange="SortByPrice()" class="form-control border-0 pl-0 bg-white" disabled="" />
                        </div>
                        <div class="col-lg-6">
                            <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Preference</h3>
                            <button type="button" class="btn btn-secondary btn-md dropdown-toggle px-4" id="dropdownMenuReference"
                                data-toggle="dropdown">
                                Preference</button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                <a class="dropdown-item" href="#" onclick="Sort('')">Relevance</a>
                                <a class="dropdown-item" href="#" onclick="Sort('order by [Product_Name]')">Name, A to Z</a>
                                <a class="dropdown-item" href="#" onclick="Sort('order by [Product_Name] desc')">Name, Z to A</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="Sort('order by cast([Selling_Price] as float) ')">Price, low to high</a>
                                <a class="dropdown-item" href="#" onclick="Sort('order by cast([Selling_Price] as float) desc')">Price, high to low</a>
                            </div>
                            <script>
                                function Sort(preference) {
                                    //alert(preference);
                                    document.getElementById('<%=txtPreference.ClientID%>').value = preference;
                                    document.getElementById('<%=btnSort.ClientID%>').click();
                                }  
                                function SortByPrice() {
                                    var amtRange = document.getElementById('amount').value;
                                    alert(amtRange);
                                    document.getElementById('<%=txtAmountRange.ClientID%>').value = amtRange;
                                    document.getElementById('<%=btnSortByPrice.ClientID%>').click();
                                }
                                function FillSliderValue() {
                                    document.getElementById('amount').value = document.getElementById('<%=txtAmountRange.ClientID%>').value;
                                  }
                            </script>
                            <div style="display: none">
                                <asp:TextBox ID="txtPreference" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSort" OnClick="btnSort_Click" runat="server" Text="Sort" />
                                
                                <asp:TextBox ID="txtAmountRange" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSortByPrice" OnClick="btnSortByPrice_Click" runat="server" Text="Sort" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>

                                    <asp:Literal ID="Literal2" Mode="PassThrough" runat="server"></asp:Literal>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnAddToCart" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                        <div class="row">
                            <asp:Label ID="lblReport" runat="server" Text=""></asp:Label>
                            <% Response.Write(listBuilder);%>

                            <%--  <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <span class="tag">New</span>
                            <a href="shop-single.html">
                                <img src="images/product_01.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="shop-single.html">Bioderma</a></h3>
                            <p class="price"><del>95.00</del> &mdash; $55.00</p>
                        </div> --%>


                            <div class="col-sm-12" id="transactionHistory" style="display: none">
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
                        </div>

                        <script>
                            function AddToList2(productid, productname, sellingprice, qtyonhand, itemcode, minqty) {
                                alert(productid);
                            }
                            var itemName;
                            function AddToList(productid, productname, sellingprice, qtyonhand, itemcode, minqty) {

                                //alert(productid + productname + sellingprice + qtyonhand + itemcode + minqty);
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
                        <div style="display: none">
                            <asp:TextBox ID="cartItem_ID" runat="server"></asp:TextBox>
                            <asp:Button ID="btnRemoveItem" OnClick="btnRemoveItem_Click" runat="server" Text="Remove" />
                            <br />
                            <asp:TextBox ID="cartItemNewQty" runat="server"></asp:TextBox>
                            <asp:TextBox ID="StockQty" runat="server"></asp:TextBox>
                            <asp:Button ID="btnUpdateItem" OnClick="btnUpdateItem_Click" runat="server" Text="Update" />


                        </div>
                        <div style="display: none">
                            <input id="timer" type="button" class="btn" value="Timer" onclick="SetTimer();" />
                            <script>
                                function SetTimer() {
                                    setTimeout(function () {
                                        document.getElementById('dismissBtn').click();
                                    }, 5000);
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-section bg-secondary bg-image" style="background-image: url('../images/bg_2.jpg');">
                <div class="container">
                    <div class="row align-items-stretch">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('../images/bg_1.jpg');">
                                <div class="banner-1-inner align-self-center">
                                    <h2>We Proudly Offer</h2>
                                    <p>
                                        Distribution
                                        <br />
                                        Wholesales<br />
                                        Retail<br />
                                        Drug Information<br />
                                        Hospital Procurement
                                    </p>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('../images/bg_2.jpg');">
                                <div class="banner-1-inner ml-auto  align-self-center">
                                    <h2>Words on Marble</h2>
                                    <p>
                                        "..the bitterness of LOW QUALITY DRUGS REMAINS AFTER THE SWEETNESS OF LOW PRICE is forgotten.."
               
                                    </p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>


            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

                            <div class="block-7">
                                <h3 class="footer-heading mb-4">About Us</h3>
                                <p>
                                    We proudly offer Distribution, Wholesale, Retail, Drug Information, and Hospital Procurment
                                </p>
                            </div>

                        </div>
                        <div class="col-lg-3 mx-auto mb-5 mb-lg-0">
                            <h3 class="footer-heading mb-4">Quick Links</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">Supplements</a></li>
                                <li><a href="#">Vitamins</a></li>
                                <li><a href="#">Diet &amp; Nutrition</a></li>
                                <li><a href="#">Tea &amp; Coffee</a></li>
                            </ul>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="block-5 mb-5">
                                <h3 class="footer-heading mb-4">Contact Info</h3>
                                <ul class="list-unstyled">
                                    <li class="address">44/48 Khana Street, D-Line Port Harcourt; 51C Khana Street, D-Line Port Harcourt</li>
                                    <li class="phone"><a href="tel://08033108325">+234 803 310 8325</a><br />
                                        <a href="tel://08033108325">+234 803 310 8325</a></li>

                                    <li class="email">info@delbonpharm.com</li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
             
                                <script>document.write(new Date().getFullYear());</script>
                                All rights reserved  
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>

        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/jquery.magnific-popup.min.js"></script>
        <script src="../js/aos.js"></script>

        <script src="../js/main.js"></script>
    </form>
</body>

</html>
