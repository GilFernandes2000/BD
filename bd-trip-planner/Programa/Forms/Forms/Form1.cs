using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TripPlanner
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString: "Data Source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog=p1g1;Persist Security Info=True;User ID=p1g1;Password=Porto>Benfica;");
            SqlCommand cmd = new("TripPlanner.AddPerson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PfName", textBox1.Text);
            cmd.Parameters.AddWithValue("@PmName", textBox2.Text);
            cmd.Parameters.AddWithValue("@PlName", textBox3.Text);
            cmd.Parameters.AddWithValue("@CC", textBox4.Text);
            cmd.Parameters.AddWithValue("@Email", textBox5.Text);
            cmd.Parameters.AddWithValue("@PAddress", textBox6.Text);
            cmd.Parameters.AddWithValue("@Sex", textBox7.Text);
            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
            MessageBox.Show("Successfully Saved!");
        }
    }
}

