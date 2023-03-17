using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TripPlanner
{
    public partial class Form4 : Form
    {
        private int currentCity;
        private SqlConnection con;

        public Form4()
        {
            InitializeComponent();
            Load += new EventHandler(Form4_Load);
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog=p1g1;Persist Security Info=True;User ID=p1g1;Password=Porto>Benfica;");
        }

        private bool verifySGBDConnection()
        {
            if (con == null)
                con = getSGBDConnection();

            if (con.State != ConnectionState.Open)
                con.Open();

            return con.State == ConnectionState.Open;
        }


        private void Form4_Load(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }
            

            SqlCommand cmd = new SqlCommand("SELECT * FROM TripPlanner.City", con);
            SqlDataReader reader = cmd.ExecuteReader();
            comboBox2.Items.Clear();
            //comboBox2.Items.Add("Select City...");
            while (reader.Read())
            {
                City C = new City();
                C.City_name = reader["CName"].ToString();
                C.Country_name = reader["Country"].ToString();
                C.Continent_name = reader["Continent"].ToString();
                comboBox2.Items.Add(C.City_name);
            }

            con.Close();
           



        }
      

        private void ComboBox2_SelectedIndexChanged(object sender, System.EventArgs e)
        {
           

            
        }


        public void ShowCity()
        {
            if (listBox1.Items.Count == 0 | currentCity < 0)
                return;
            City city = new City();
            city = (City)listBox1.Items[currentCity];


        }

        private void button1_Click(object sender, EventArgs e)
        {
          
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
           


        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            SqlCommand cmd = new("TripPlanner.AddPOInterest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", textBox1.Text);
            cmd.Parameters.AddWithValue("@Rating", Int32.Parse(textBox2.Text));
            cmd.Parameters.AddWithValue("@PoIName", textBox3.Text);
            cmd.Parameters.AddWithValue("@Contact", textBox4.Text);
            cmd.Parameters.AddWithValue("@City", comboBox2.Items[comboBox2.SelectedIndex]);
            cmd.Parameters.AddWithValue("@Price", textBox5.Text);
            cmd.Parameters.AddWithValue("@PoIAddress", textBox6.Text);
            cmd.Parameters.AddWithValue("@TrType", textBox7.Text);

            cmd.ExecuteNonQuery();

            con.Close();
            MessageBox.Show("Sucessfully Created!(Go check the near box)");
        }

        private void comboBox2_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            String item = comboBox2.Items[comboBox2.SelectedIndex].ToString();
            String query = "SELECT PoIName, Rating, Email, Contact, Price, PoIAddress FROM getPoIByCity(@City)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@City", item);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox2.Items.Clear();
            while (reader.Read())
            {
                POI P = new POI();
                P.POI_name = reader["PoIName"].ToString();
                P.Rating = Int32.Parse(reader["Rating"].ToString());
                P.Email = reader["Email"].ToString();
                P.Contact = reader["Contact"].ToString();
                P.Price = reader["Price"].ToString();
                P.Address = reader["PoIAddress"].ToString();
                listBox2.Items.Add(P.POI_name);
            }
            reader.Close();

            con.Close();

            

        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }
           

            SqlCommand cmd = new SqlCommand("SELECT PoIName, Rating, Email, Contact, Price, PoIAddress FROM TripPlanner.POInterest WHERE PoIName = '" + listBox2.SelectedItem + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox3.Items.Clear();
            while (reader.Read())
            {
                POI P = new POI();
                P.POI_name = reader["PoIName"].ToString();
                P.Rating = Int32.Parse(reader["Rating"].ToString());
                P.Email = reader["Email"].ToString();
                P.Contact = reader["Contact"].ToString();
                P.Price = reader["Price"].ToString();
                P.Address = reader["PoIAddress"].ToString();
                listBox3.Items.Add("Info:");
                listBox3.Items.Add(" ");
                listBox3.Items.Add("Name: " + P.POI_name);
                listBox3.Items.Add("Rating: " + P.Rating);
                listBox3.Items.Add("Email: " + P.Email);
                listBox3.Items.Add("Contact: " + P.Contact);
                listBox3.Items.Add("Price: " + P.Price);
                listBox3.Items.Add("Address: " + P.Address);
            }

            con.Close();

        }

        private void listBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            String item = comboBox2.Items[comboBox2.SelectedIndex].ToString();
            String query = "select * FROM TripPlanner.POInterest WHERE City = '" + item + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox2.Items.Clear();
            while (reader.Read())
            {
                POI P = new POI();
                P.POI_name = reader["PoIName"].ToString();
                P.Rating = Int32.Parse(reader["Rating"].ToString());
                P.Email = reader["Email"].ToString();
                P.Contact = reader["Contact"].ToString();
                P.Price = reader["Price"].ToString();
                P.Address = reader["PoIAddress"].ToString();
                listBox2.Items.Add(P.POI_name);
            }
            reader.Close();

            con.Close();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
    
}
