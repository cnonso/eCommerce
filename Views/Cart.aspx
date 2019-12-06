<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="eCommerceTemplate.Views.Cart" %>

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

<body>

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
                                            <li><a href="#">My Account</a></li>

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
                        <div class="col-md-12 mb-0"><a href="../Default.aspx">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <div class="site-blocks-table">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <table class='table table-bordered table-stripped'>
                                            <tr>
                                                <th class="product-thumbnail">Image</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-total">Total</th>
                                                <th class="product-remove">Remove</th>
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
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <a href="../Views/Store.aspx" class="btn btn-primary btn-md btn-block">Continue Shopping</a>
                                </div>
                                <div class="col-md-6">

                                    <button class="btn btn-outline-primary btn-md btn-block">Update Cart</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="text-black h4" for="coupon">Coupon</label>
                                    <p>Enter your coupon code if you have one.</p>
                                </div>
                                <div class="col-md-8 mb-3 mb-md-0">
                                    <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-primary btn-md px-4">Apply Coupon</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Literal ID="Literal2"
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
                                    <asp:UpdateProgress DisplayAfter="100" ID="UpdateProgress1" DynamicLayout="true" runat="server">
                                        <ProgressTemplate>
                                            <div class="progress">
                                                <img src="../Content/Images/loading.gif" alt="" />&nbsp;please wait...
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <div style="display: none">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <span class="text-black">Subtotal</span>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <strong class="text-black">
                                                    <asp:Label ID="lblSubTotalPrice" runat="server" Text=""></asp:Label>
                                                </strong>
                                            </div>
                                        </div>
                                        <div class="row mb-5">
                                            <div class="col-md-6">
                                                <span class="text-black">Total</span>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <strong class="text-black">
                                                    <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label></strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnCheckOut" OnClick="btnCheckOut_Click" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text=" Proceed To Checkout" />

                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                    <p> Distribution <br/>
                                    Wholesales<br/>
                                     Retail<br/>
                                     Drug Information<br/>
                                     Hospital Procurement</p>
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
                    //alert(productid + '~' + qtyOnHand);
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
                function Decrease(productid, qtyOnHand) {
                    //alert(productid);
                    document.getElementById('<%=cartItem_ID.ClientID%>').value = productid;
                    if (parseFloat(document.getElementById(productid).value) - 1 < 0)
                        return;
                    document.getElementById('<%=cartItemNewQty.ClientID%>').value = parseFloat(document.getElementById(productid).value) - 1;
                    document.getElementById('<%=StockQty.ClientID%>').value = qtyOnHand;
                    if (parseFloat(document.getElementById('<%=cartItemNewQty.ClientID%>').value) > parseFloat(qtyOnHand)) {
                        alert('Insufficient stock. Only ' + qtyOnHand + ' units available.');
                        document.getElementById('<%=cartItemNewQty.ClientID%>').value = qtyOnHand;
                        document.getElementById(productid).value = qtyOnHand;
                        return
                    }
                    document.getElementById('<%=btnUpdateItem.ClientID%>').click();
                }
                function Increase(productid, qtyOnHand) {
                    //alert(productid);
                    document.getElementById('<%=cartItem_ID.ClientID%>').value = productid;
                    document.getElementById('<%=cartItemNewQty.ClientID%>').value = parseFloat(document.getElementById(productid).value) + 1;
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
                <asp:Button ID="btnAddToCart" runat="server" Text="Button" />
            </div>
            <div style="display: none">
                <asp:TextBox ID="cartItem_ID" runat="server"></asp:TextBox>
                <asp:Button ID="btnRemoveItem" OnClick="btnRemoveItem_Click" runat="server" Text="Remove" />
                <br />
                <asp:TextBox ID="cartItemNewQty" runat="server"></asp:TextBox>
                <asp:TextBox ID="StockQty" runat="server"></asp:TextBox>
                <asp:Button ID="btnUpdateItem" OnClick="btnUpdateItem_Click" runat="server" Text="Update" />
            </div>
            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

                            <div class="block-7">
                                <h3 class="footer-heading mb-4">About Us</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius quae reiciendis distinctio voluptates
                sed dolorum excepturi iure eaque, aut unde.
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
                                    <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                                    <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
                                    <li class="email">emailaddress@domain.com</li>
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
                                All rights reserved | This template is made
              with <i class="icon-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank"
                  class="text-primary">Colorlib</a>
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
