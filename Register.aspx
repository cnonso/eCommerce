<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="eCommerceTemplate.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-5 text-black">Register an Account</h2>
                </div>
                <div class="col-md-6 col-md-offset-3">

                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Username <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_lname" class="text-black">Password <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtPassword" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                           <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_lname" class="text-black">Confirm Password <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtConfirmPass" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                           <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">License Number <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtLicenseNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Register" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <p style="display:inline-block">Already have an account? <span style="color:aqua; cursor:pointer" onclick="window.location.href='../Login.aspx'">Login </span>to continue.</p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                    <img src="images/login.png" height="600" class="img-responsive" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
