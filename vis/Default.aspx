<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="vis._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="text-align:center"> 

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" Height="281px" Width="1365px">
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Available" />
        <asp:Button ID="Button2" runat="server" Text="Not Available" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="All" OnClick="Button3_Click" />
      <br />
    </div>

</asp:Content>
