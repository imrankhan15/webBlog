<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Login ID="Login1" runat="Server" 
DestinationPageUrl="~/Default.aspx"
TitleText="Please enter your account information:
"
CreateUserText="New user?"
CreateUserUrl="~/Register.aspx" />
</asp:Content>

