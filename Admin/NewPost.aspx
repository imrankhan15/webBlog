<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewPost.aspx.cs" Inherits="NewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table border="0" width="700" > 
    <tr>
    <td width="80" valign="top">
    Subject:
    </td>
    <td width="620" valign="top">
    <asp:TextBox ID="txtSubject" runat="server"
    Width="400px"/>
    <asp:RequiredFieldValidator runat="server"
    ID="RequiredFieldValidator1"
    ControlToValidate="txtSubject"
    ErrorMessage="Subject is required"
    Display="Dynamic" />
    </td>
    </tr>
    <tr>
    <td width="80" valign="top">
    Text:
    </td>
    <td width="620" valign="top">
    <asp:TextBox ID="txtPostText" runat="server" 
    TextMode="MultiLine"
    Height="250px"
    Width="400px" />
    <asp:RequiredFieldValidator runat="server"
    ID="RequiredFieldValidator2"
    ControlToValidate="txtPostText"
    ErrorMessage="Text is required"
    Display="Dynamic" />
    </td>
    </tr>
    </table>
    <asp:Button ID="btnPost" runat="server" 
    Text="Post" OnClick="btnPost_Click" />
    <asp:Button ID="btnCancel" runat="server" 
    PostBackUrl="~/Admin/MyBlogs.aspx"
    Text="Cancel" />
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    InsertCommand="INSERT INTO [Posts]
    ([blogid], [subject], [post])
    VALUES (@blogid, @subject, @post)" >
    <InsertParameters>
    <asp:QueryStringParameter Name="blogid"
    QueryStringField="blog"
    Type="String" />
    <asp:ControlParameter Name="subject" 
    ControlID="txtSubject"
    PropertyName="Text"
    Type="String" />
    <asp:ControlParameter Name="post" 
    ControlID="txtPostText"
    PropertyName="Text"
    Type="String" />
    </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>

