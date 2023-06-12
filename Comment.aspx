<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Comment.aspx.cs" Inherits="Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" width="700" > 
    <tr>
    <td width="80" valign="top">
    Your name:
    </td>
    <td width="620" valign="top">
    <asp:TextBox ID="txtName" runat="server" 
    Width="400px"/>
    </td>
    </tr>
    <tr>
    <td width="80" valign="top">
    Your comment:
    </td>
    <td width="620" valign="top">
    <asp:TextBox ID="txtComment" runat="server" 
    TextMode="MultiLine"
    Height="200px"
    Width="400px" />
    </td>
    </tr>
    </table>
    <asp:Button ID="btnPost" runat="server" 
    Text="Post"
    OnClick="btnPost_Click" />
    <asp:Button ID="btnCancel" runat="server" 
    Text="Cancel"
    OnClick="btnCancel_Click"/>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    InsertCommand="INSERT INTO [Comments]
    ([postid], [username], [comment])
    VALUES (@postid, @username, @comment)" >
    <InsertParameters>
    <asp:QueryStringParameter Name="postid" 
    Type="String"
    QueryStringField="postid" />
    <asp:ControlParameter Name="username" 
    Type="String"
    ControlID="txtName"
    PropertyName="Text" />
    <asp:ControlParameter Name="comment" 
    Type="String"
    ControlID="txtComment"
    PropertyName="Text" />
    </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>

