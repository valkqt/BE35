<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BE35.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Home" ContentPlaceHolderID="Home" runat="server">
    <div class="HomeWrapper silver">
        <asp:Repeater ID="HomeCards" runat="server" OnItemCommand="AddToCart">
            <ItemTemplate>
                <div class="card CustomCard cardSilver" style="width: 18rem;">
                    <a href="Details.aspx?product=<%#DataBinder.Eval(Container, "DataItem.id") %>">

                        <img src='<%#DataBinder.Eval(Container, "DataItem.images[0]") %>' class="card-img-top CustomImage" alt="...">
                        <div class="card-body HomeCardText">
                            <div class="HomeCardTop">
                                <h5 class="card-title"><%#DataBinder.Eval(Container, "DataItem.title") %></h5>
                                <p class="card-text"><%#DataBinder.Eval(Container, "DataItem.description") %></p>
                            </div>
                            <div class="HomeCardBottom">
                                <p class="card-text"><%#DataBinder.Eval(Container, "DataItem.price") %> €</p>
                                <asp:LinkButton ID="AddButton" runat="server" CommandName="Add" class="btn btn-warning" CommandArgument='<%#DataBinder.Eval(Container, "DataItem.id") %>' Text="Add To Cart"></asp:LinkButton>

                            </div>
                        </div>
                    </a>

                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
