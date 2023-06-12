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
public partial class NewPost : System.Web.UI.Page
{
    protected void btnPost_Click(
    object sender, EventArgs e)
    {
    SqlDataSource1.Insert();
    Response.Redirect("MyBlogs.aspx");
    }
}