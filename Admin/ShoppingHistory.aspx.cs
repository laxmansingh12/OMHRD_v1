﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMHRD.Admin
{
    public partial class ShoppingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAddtoCartDetail();
                GetTotalSale();
            }
        }

        void GetTotalSale()
        {
            int userId = int.Parse(Session["loginid"].ToString());
            String strConnString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            string selectSql = "select sum(Amount) as TotalAmount from UserOrderPaymenttbl where OrderStatus='Success' and UserId="+ userId + "";
            SqlCommand com = new SqlCommand(selectSql, con);
            try
            {
                con.Open();
                using (SqlDataReader read = com.ExecuteReader())
                {
                    while (read.Read())
                    {
                        lbltotal.Text = (read["TotalAmount"].ToString());
                    }
                }
            }
            finally
            {
                con.Close();
            }
        }

        void GetAddtoCartDetail()
        {
            if (Session["loginid"] != null && !string.IsNullOrEmpty(Session["loginid"].ToString()))
            {
                String strConnString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand("usp_GetAllUserShopping", con);
                adapter.SelectCommand.Parameters.AddWithValue("@UserId", int.Parse(Session["loginid"].ToString()));
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                try
                {
                    con.Open();
                    adapter.Fill(ds);
                    ListView1.DataSource = ds.Tables[0];
                    ListView1.DataBind();
                }
                catch (SqlException ex)
                {
                    //lblMsg.Text = se.Message;
                }
                finally { }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alert", "<Script>alert('User not login');</Script>", false);
                return;
            }
        }
    }
}