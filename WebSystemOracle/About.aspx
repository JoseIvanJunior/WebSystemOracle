<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebSystemOracle.About" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <link href="Style.css" rel="stylesheet" />

        <script src="Script.js"></script>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="pessoa_id" OnItemDataBound="ListView1_ItemDataBound" AutoPostBack="true">
            <LayoutTemplate>
                <table border="0" cellpadding="1">
                    <tr class="t_even">
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkName" runat="server" CommandName="Sort" CommandArgument="Nome">Nome</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkEmail" runat="server" CommandName="Sort" CommandArgument="Email">Email</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkTelefone" runat="server" CommandName="Sort" CommandArgument="Telefone">Telefone</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkCargo" runat="server" CommandName="Sort" CommandArgument="Cargo">Cargo</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkSalario" runat="server" CommandName="Sort" CommandArgument="Salario">Salário Líquido</asp:LinkButton>
                        </th>
                        <th align="left"></th>
                        <th></th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
                <asp:DataPager runat="server" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField
                            ButtonType="Button"
                            ShowFirstPageButton="True"
                            ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>

                <asp:Button ID="btnShow" runat="server" Text="Relatório" OnClick="Show_Click" />
            </LayoutTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName"><%#Eval("nome_pessoa") %></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblEmail"><%#Eval("email")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblTelefone"><%#Eval("telefone")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblCargo"><%#Eval("nome_cargo")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblSalarioLiquido"><%#Eval("salario_liquido")%></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="Calcular/Recalcular" OnClick="btnSelect_Click" CommandArgument='<%# Eval("pessoa_id") %>' />
                    </td>
                    <td></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <CR:CrystalReportViewer ID="CrystalReportSource1" runat="server" AutoDataBind="true" />

        <asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>'
                SelectCommand="select * from vw_salario_liquido"></asp:SqlDataSource>
        </asp:ListView>

    </main>
</asp:Content>
