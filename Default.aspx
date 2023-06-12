<%@ Page Title=" Blog-o-Rama " Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Active Blogs</h3>
    <asp:GridView ID="GridView1" runat="server" 
    AllowPaging="True"
    AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1">
    <Columns>
    <asp:TemplateField> 
    <HeaderTemplate>
    Blog
    </HeaderTemplate>
    <ItemTemplate>
    <b>
    <asp:LinkButton ID="LinkButton1"
    runat="server"
    Text='<% #Bind("name") %>'
    PostBackUrl
    ='<% #Bind("blogid",
    "Blog.aspx?blog={0}") %>' />
    <br />
    <asp:Label ID="Label2" runat="server"
    Text='<% #Bind("description") %>' />
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle Width="250px" />
    </asp:TemplateField>
    <asp:BoundField 
    DataField="username"
    HeaderText="Owner" >
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle HorizontalAlign="Left"
    Width="100px" />
    </asp:BoundField>
    <asp:BoundField 
    DataField="posts"
    HeaderText="Posts" >
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle HorizontalAlign="Left"
    Width="80px" />
    </asp:BoundField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [blogid], [name],
    [description], [username], [posts]
    FROM [Blogs]
    ORDER BY [name]">
    </asp:SqlDataSource>

</asp:Content>

