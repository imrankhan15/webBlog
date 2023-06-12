using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comment : System.Web.UI.Page
{
    protected void btnPost_Click( 
    object sender, EventArgs e)
    {
    SqlDataSource1.Insert();
    Response.Redirect("Blog.aspx?blog="
    + Request.QueryString["blog"]
    + "&post="
    + Request.QueryString["post"]);
    }
    protected void btnCancel_Click( 
    object sender, EventArgs e)
    {
    Response.Redirect("Blog.aspx?blog="
    + Request.QueryString["blog"]
    + "&post="
    + Request.QueryString["post"]);
    }
}