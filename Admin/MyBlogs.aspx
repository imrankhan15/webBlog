<%@ Page Title="MyBlogs" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyBlogs.aspx.cs" Inherits="Admin_MyBlogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>My Blogs</h2>
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
    PostBackUrl='<% #Bind("blogid",
    "~\Blog.aspx?blog={0}") %>'
    CausesValidation="False" />
    <br />
    <asp:Label ID="Label2" runat="server"
    Text='<% #Bind("description") %>' />
    </ItemTemplate>
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle HorizontalAlign="Left"
    Width="250px" />
    </asp:TemplateField>
    <asp:BoundField 
    DataField="username"
    HeaderText="Owner" >
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle Width="100px" />
    </asp:BoundField>
    <asp:BoundField 
    DataField="posts"
    HeaderText="Posts" >
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle Width="80px" />
    </asp:BoundField>
    <asp:HyperLinkField 
    DataNavigateUrlFields="blogid"
    DataNavigateUrlFormatString
    ="NewPost.aspx?blog={0}"
    Text="New Post">
    <ItemStyle Width="70px" />
    </asp:HyperLinkField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [blogid], [name],
    [description], [username], [posts]
    FROM [Blogs]
    WHERE [username]=@username
    ORDER BY [name]">
    <SelectParameters>
    <asp:Parameter Name="username" 
    Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
    <br />To create a new blog:<br />
    <asp:Label ID="Label3" runat="server" 
    BorderStyle="None" Text="Blog name:"
    Width="80px" />
    <asp:TextBox ID="txtBlogName" runat="server" />
    <asp:RequiredFieldValidator
    ID="RequiredFieldValidator1" runat="server"
    ControlToValidate="txtBlogName"
    Display="Dynamic"
    ErrorMessage="Required." /><br />
    <asp:Label ID="Label4" runat="server" 
    BorderStyle="None" Text="Description:"
    Width="80px" />
    <asp:TextBox ID="txtDescription" runat="server" />
    <asp:RequiredFieldValidator
    ID="RequiredFieldValidator2" runat="server"
    ControlToValidate="txtDescription"
    Display="Dynamic"
    ErrorMessage="Required." /><br />
    <asp:Button ID="btnCreate" runat="server" 
    OnClick="btnCreate_Click"
    Text="Create Blog" />
    <asp:SqlDataSource ID="SqlDataSource2" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:BlogConnectionString %>"
    InsertCommand="INSERT INTO [Blogs]
    ([username], [name], [description])
    VALUES (@username, @name, @description)" >
    <InsertParameters> 
    <asp:Parameter
    Name="username" Type="String" />
    <asp:Parameter
    Name="name" Type="String" />
    <asp:Parameter
    Name="description" Type="String" />
    </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>

