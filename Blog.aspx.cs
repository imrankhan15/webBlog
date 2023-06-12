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

public partial class Blog : System.Web.UI.Page
{
    protected void Page_Load( 
    object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["post"] == null)
            GridView1.SelectedIndex = 0;
            else
            {
                GridView1.SelectedIndex
                = Int16.Parse(
                Request.QueryString["post"]);
            }
            this.DataBind();
        }
    }
    protected void btnViewComments_Click(
    object sender, EventArgs e)
    {
        Response.Redirect("Comments.aspx?post="
        + GridView1.SelectedIndex.ToString()
        + "&postid="
        + GridView1.SelectedValue.ToString()
        + "&blog="
        + Request.QueryString["blog"]);
    }
    protected void btnLeaveComment_Click( 
    object sender, EventArgs e)
    {
        Response.Redirect("Comment.aspx?post="
        + GridView1.SelectedIndex.ToString()
        + "&postid="
        + GridView1.SelectedValue.ToString()
        + "&blog="
        + Request.QueryString["blog"]);
    }


  }
 