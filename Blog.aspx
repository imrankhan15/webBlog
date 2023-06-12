<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0"> 
    <tr>
    <td width="700">
    <asp:FormView ID="FormView1" runat="server" 
    DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <asp:Label ID="lblName" runat="server" 
    Text='<%# Bind("name",
    "<h3>{0}</h3>") %>' />
    <asp:Label ID="lblDesc" runat="server" 
    Text='<%# Bind("description",
    "<h4>{0}") %>' />
    <asp:Label ID="lblUser" runat="server" 
    Text='<%# Bind("username",
    "<br/>By {0}</h4>") %>' />
    </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString=
    "<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [name], [description],
    [username], [posts]
    FROM [Blogs]
    WHERE ([blogid] = @blogid)">
    <SelectParameters>
    <asp:QueryStringParameter Name="blogid" 
    QueryStringField="blog" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </td>
    </tr>
    <tr>
    <td width="350" valign="Top">
    <asp:FormView ID="FormView2" runat="server" 
    DataKeyNames="postid"
    DataSourceID="SqlDataSource2" >
    <ItemTemplate>
    <asp:Label ID="lblSubject" 
    runat="server"
    Text='<%# Bind("subject",
    "<h1>{0}</h1>") %>' />
    <asp:Label ID="lblDate" 
    runat="server"
    Text='<%# Bind("postdate",
    "<h3>{0:F}</h3>") %>' />
    <asp:Label ID="lblPost" 
    runat="server"
    Text='<%# Bind("post", "<p>{0}</p>") %>' />
    <asp:Label ID="lblComments" 
    runat="server"
    Text='<%# Bind("comments",
    "{0} comments.") %>'/>
    <asp:LinkButton ID="btnViewComments" 
    runat="server"
    OnClick="btnViewComments_Click"
    Text="View comments" />
    <asp:LinkButton ID="btnLeaveComment" 
    runat="server"
    OnClick="btnLeaveComment_Click"
    Text="Leave a comment" />
    </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" 
    runat="server"
    ConnectionString=
    "<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [postid], [blogid],
    [postdate], [subject],
    [post], [comments]
    FROM [Posts]
    WHERE ([postid] = @postid)">
    <SelectParameters>
    <asp:ControlParameter 
    ControlID="GridView1"
    Name="postid"
    PropertyName="SelectedValue"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </td>
    <td width="250">
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False"
    DataSourceID="SqlDataSource3"
    DataKeyNames="postid"
    AllowPaging="True" >
    <Columns>
    <asp:TemplateField 
    HeaderText="Previous Posts" >
    <ItemTemplate>
    <asp:LinkButton ID="btnPost"
    runat="server"
    Text='<%# Bind("subject") %>'
    CommandName="Select" />
    <br />
    <asp:Label ID="lblDate"
    runat="server"
    Text='<%# Bind("postdate", "{0:g}") %>' />
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" 
    runat="server"
    ConnectionString=
    "<%$ ConnectionStrings:BlogConnectionString %>"
    SelectCommand="SELECT [postid], [blogid],
    [postdate], [subject]
    FROM [Posts]
    WHERE ([blogid] = @blogid)
    ORDER BY [postdate] DESC">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="blogid"
    QueryStringField="blog"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </td>
    </tr>
    </table>


</asp:Content>

