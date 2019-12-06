<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eCommerceTemplate.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-5 text-black">Login to Continue</h2>
                </div>
                <div class="col-md-6 col-md-offset-3">

                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Username <span class="text-danger">*</span></label>
                                <asp:TextBox ID="UserName" CssClass="form-control" type="text" runat="server" EmptyMessage="Username is required." />
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Username is required." ToolTip="Username is required." ValidationGroup="Login1" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_lname" class="text-black">Password <span class="text-danger">*</span></label>

                                <asp:TextBox ID="Password" type="password" CssClass="form-control" runat="server" EmptyMessage="Card PIN" /><br />
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <span class="labelentry" style="color: Red">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="LoginButton" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <asp:Button ID="LoginButton" CssClass="btn btn-primary btn-lg btn-block"  runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        <div class="progress">
                                            <img src="Images/loading.gif" alt="" />&nbsp;Authenticating, please wait...
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <p style="display: inline-block;">Don't have an account yet? <span style="color: aqua; cursor: pointer" onclick="window.location.href='../Register.aspx'">Register </span>one now.</p>
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
