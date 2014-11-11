using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userlog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // DropDownList1.Items.Insert(0, new ListItem("asdfasdfasdfs", String.Empty));
       
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
       DropDownList d = (DropDownList)sender;
       d.Items.Insert(0, new ListItem("ทั้งหมด", "0"));
        
    }

}