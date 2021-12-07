using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace vis
{
    




    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }


        void LoadRecord()
        {

            SqlConnection con = new SqlConnection("Data Source=MSI\\SQLSERVER1;Initial Catalog=RealEstate;User ID=sa;Password=12");
            SqlCommand comm = new SqlCommand("SELECT * FROM Propav", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI\\SQLSERVER1;Initial Catalog=RealEstate;User ID=sa;Password=12");
            SqlCommand comm = new SqlCommand("EXEC propAvailable 'Available'", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI\\SQLSERVER1;Initial Catalog=RealEstate;User ID=sa;Password=12");
            SqlCommand comm = new SqlCommand("EXEC propAvailable 'Not Available'", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI\\SQLSERVER1;Initial Catalog=RealEstate;User ID=sa;Password=12");
            SqlCommand comm = new SqlCommand("SELECT * FROM Propav", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}