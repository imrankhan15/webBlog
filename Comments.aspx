<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView2" runat="server" 
    DataSourceID="SqlDataSource1"
    DataKeyNames="postid" >
    <ItemTemplate>
    <asp:Label ID="lblSubject" 
    runat="server"
    Text='<%# Bind("subject",
    "<h1>{0}</h1>") %>'>
    </asp:Label>
    <asp:Label ID="lblDate" runat="server"
    Text='<%# Bind("postdate",
    "<h3>{0:F}</h3>") %>'>
    </asp:Label>
    </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [postid], [blogid],
    [postdate], [subject]
    FROM [Posts]
    WHERE ([postid] = @postid)">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="postid"
    QueryStringField="post"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList1" runat="server" 
    DataSourceID="SqlDataSource2">
    <ItemTemplate>
    <hr>
    <asp:Label ID="lblUserName" 
    runat="server"
    Text='<%# Bind("username",
    "Comment by {0}") %>'
    Font-Size="X-Small" />
    <asp:Label ID="lblDate" runat="server"
    Text='<%# Bind("commentdate",
    " Date: {0:G}") %>'
    Font-Size="X-Small" />
    <br />
    <asp:Label ID="lblComment" 
    runat="server"
    Text='<%# Bind("comment") %>'
    Width="300px"/>
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [commentdate],
    [username], [comment]
    FROM [Comments]
    WHERE ([postid] = @postid)
    ORDER BY [commentdate]">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="postid"
    QueryStringField="postid"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="btnReturn" runat="server" 
    Text="Return"
    OnClick="btnReturn_Click" />
    <asp:LinkButton ID="btnComment" runat="server" 
    Text="Leave Comment"
    OnClick="btnComment_Click" />

</asp:Content>

