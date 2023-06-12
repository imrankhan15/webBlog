using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;


public partial class Admin_MyBlogs : System.Web.UI.Page
{
    protected void Page_Load( 
    object sender, EventArgs e)
    {
    SqlDataSource1.SelectParameters["username"]
    .DefaultValue = User.Identity.Name;
    }
    protected void btnCreate_Click( 
    object sender, EventArgs e)
    {
    SqlDataSource2.InsertParameters["username"]
    .DefaultValue = User.Identity.Name;
    SqlDataSource2.InsertParameters["name"]
    .DefaultValue = txtBlogName.Text;
    SqlDataSource2.InsertParameters["description"]
    .DefaultValue = txtDescription.Text;
    SqlDataSource2.Insert();
    GridView1.DataBind();
    }
}