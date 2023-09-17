<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSystemOracle._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                        class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form>
                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0"></p>
                        </div>

                        <!-- User input -->
                        <div class="form-outline mb-4">
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Nome de Usuário"></asp:TextBox>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Senha"></asp:TextBox>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        </div>

                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>  
                    </form>
                </div>
            </div>
        </div>

    </section>

</asp:Content>
