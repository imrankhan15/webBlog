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

public partial class Comments : System.Web.UI.Page
{
    protected void btnReturn_Click( 
    object sender, EventArgs e)
    {
        Response.Redirect("Blog.aspx?post="
        + Request.QueryString["post"]
        + "&postid="
        + Request.QueryString["postid"]
        + "&blog="
        + Request.QueryString["blog"]);
    }
    protected void btnComment_Click( 
    object sender, EventArgs e)
    {
        Response.Redirect("Comment.aspx?post="
        + Request.QueryString["post"]
        + "&postid="
        + Request.QueryString["postid"]
        + "&blog="
        + Request.QueryString["blog"]);
    }

}