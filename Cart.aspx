<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BE35.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Cart" ContentPlaceHolderID="Cart" runat="server">
    <div class=" CartWrapper silver">
        <div class="CartCard DetailsSilver">
            <div class="CartContainer">
                <h1 class="bigText Text">Cart</h1>
                <div>
                    <asp:Label runat="server" ID="Total" Text="Total: " CssClass="Text bigText"></asp:Label>
                    <asp:LinkButton ID="ClearButton" runat="server" class="btn btn-warning ClearButton" OnClick="Clear_Cart">Clear Cart</asp:LinkButton>

                </div>
            </div>
            <div class="CardAreaBox">
                <asp:Label ID="EmptyCart" runat="server" Text="" CssClass="EmptyCart"></asp:Label>

                <asp:Repeater ID="CartCards" runat="server" OnItemCommand="Remove_Item">
                    <ItemTemplate>
                        <div class="CartContainer">
                            <div class="CartImageFlex">
                                <asp:Image ID="Image1" class="CartImage" runat="server" ImageUrl='<%#DataBinder.Eval(Container, "DataItem.images[0]") %>' />
                                <a href="Details.aspx?product=<%#DataBinder.Eval(Container, "DataItem.id") %>">
                                    <p id="title" runat="server" class="Text display-4"><%#DataBinder.Eval(Container, "DataItem.title") %></p>
                                    <p id="P2" runat="server" class="Text">Brand: <%#DataBinder.Eval(Container, "DataItem.brand") %></p>
                                    <p id="P3" runat="server" class="Text">Quantity: <%#DataBinder.Eval(Container, "DataItem.quantity") %></p>
                                    <p id="P1" runat="server" class="Text">In Stock: <%#DataBinder.Eval(Container, "DataItem.stock") %></p>
                                </a>
                            </div>

                            <div>
                                <div class="linkFlex">
                                    <div>
                                        <p id="price" runat="server" class="Text bigText">Price: <%#DataBinder.Eval(Container, "DataItem.price") %> €</p>
                                        <asp:LinkButton ID="RemoveItem" runat="server" CommandName="Delete" class="btn btn-warning CustomButton" CommandArgument='<%#DataBinder.Eval(Container, "DataItem.id") %>' Text="Remove"></asp:LinkButton>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
