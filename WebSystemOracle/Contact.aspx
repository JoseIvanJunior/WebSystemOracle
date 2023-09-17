<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebSystemOracle.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        
        <link href="Style.css" rel="stylesheet" />

        <asp:ListView ID="ListView2" runat="server" OnItemDataBound="ListView1_ItemDataBound">
            <LayoutTemplate>
                <table border="0" cellpadding="1">
                    <tr class="t_even">
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkNome" runat="server" CommandName="Sort" CommandArgument="Nome">Nome</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkCargo" runat="server" CommandName="Sort" CommandArgument="Cargo">Cargo</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkSalario" runat="server" CommandName="Sort" CommandArgument="Salario">Salário</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkDescricao" runat="server" CommandName="Sort" CommandArgument="Descricao">Descrição</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkTipo" runat="server" CommandName="Sort" CommandArgument="Tipo">Tipo</asp:LinkButton>
                        </th>
                        <th align="left">
                            <asp:LinkButton Font-Underline="false" ID="lnkValor" runat="server" CommandName="Sort" CommandArgument="Valor">Valor</asp:LinkButton>
                        </th>
                    </tr>
                    <tr id="ItemPlaceholder" runat="server">
                    </tr>
                </table>

                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />

            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1"><%#Eval("nome_pessoa") %></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblNome_cargo"><%#Eval("nome_cargo") %></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblSalario"><%#Eval("salario")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblDescricao"><%#Eval("descricao")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblTipo"><%#Eval("tipo")%></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblvalor"><%#Eval("valor")%></asp:Label>
                    </td>
                    <td></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource runat="server" ID="Oracle"
            ConnectionString='<%$ConnectionStrings:Oracle %>'
            ProviderName='<%$ ConnectionStrings:Oracle.ProviderName %>'
            SelectCommand="select * from vw_vencimentos_cargos"></asp:SqlDataSource>
    </main>
</asp:Content>
