<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BE35.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Details" ContentPlaceHolderID="Details" runat="server">

    <div class="DetailsWrapper detailsSilver">
        <div class="DetailsOuterContainer">
            <div class="DetailsContainer ">
                <div>
                    <asp:Image ID="ProductPicture" class="DetailImage" runat="server" ImageUrl="" />

                </div>
                <div>
                    <h1 id="title"></h1>
                    <asp:Label ID="title" runat="server" Text="" CssClass="display-2 Text"></asp:Label>
                    <asp:Label ID="brand" runat="server" CssClass="Text display-6" Text="Brand:"></asp:Label>
                    <asp:Label ID="price" runat="server" CssClass="Text" Text="Prova"></asp:Label>
                    <hr />
                    <asp:Label ID="description" runat="server" CssClass="Text" Text="Prova"></asp:Label>
                    <asp:Label ID="category" runat="server" CssClass="Text" Text="Prova"></asp:Label>
                    <asp:Label ID="stock" runat="server" CssClass="Text" Text="Prova"></asp:Label>
                    <asp:Label ID="rating" runat="server" CssClass="Text" Text="Prova"></asp:Label>
                </div>
            </div>
            <asp:Button ID="AddToCart" runat="server" OnClick="AddToCart_Click" Text="Add To Cart" class="btn btn-warning CustomButton" />

        </div>


    </div>


</asp:Content>
