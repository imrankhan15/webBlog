<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:CreateUserWizard ID="CreateUserWizard1" 
runat="server"
CreateUserButtonText="Create Account"
ContinueDestinationPageUrl="~\Admin\MyBlogs.aspx" >
</asp:CreateUserWizard>
</asp:Content>

