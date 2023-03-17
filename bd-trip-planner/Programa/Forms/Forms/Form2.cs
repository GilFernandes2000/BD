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
    public partial class Form2 : Form
    {
        private SqlConnection con;
        public int ID;
        public Form2()
        {
            InitializeComponent();
            Load += new EventHandler(Form2_Load);
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

        private void Form2_Load(object sender, EventArgs e)
        {
            trips.Enabled = false;
            go.Enabled = false;
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }
            Person P = new();
            SqlCommand cmd = new("select * from TripPlanner.Person", con);
            SqlDataReader readerEm = cmd.ExecuteReader();
            int counter = 0;
            while (readerEm.Read())
            {
                if (readerEm["Email"].ToString() == email.Text)
                {


                    P.Sex = readerEm["Sex"].ToString();
                    P.First_Name = readerEm["PfName"].ToString();
                    P.Middle_Name = readerEm["PmName"].ToString();
                    P.Last_Name = readerEm["PlName"].ToString();
                    P.Email = readerEm["Email"].ToString();
                    P.Address = readerEm["PAddress"].ToString();
                    P.PersonCC = readerEm["CC"].ToString();

                    log.Text = "Logged in as " + P.First_Name + " " + P.Last_Name;
                    counter = 1;

                }
            }
            readerEm.Close();

            if (counter == 1)
            {
                SqlCommand h = new("select * from TripPlanner.Trip", con);
                SqlDataReader readerT = h.ExecuteReader();
                int counterhist = 0;
                while (readerT.Read())
                {
                    if (readerT["Elaborator_CC"].ToString() == P.PersonCC)
                    {
                        trips.Items.Add(readerT["TrName"].ToString() + "\t" + readerT["TrType"].ToString());
                    }
                }
                trips.Enabled = true;
                go.Enabled = true;
                readerT.Close();
            }

            if (counter == 0)
            {
                MessageBox.Show("User doesn't exist");
            }

            con.Close();
        }

        private void go_Click(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            listBox2.Items.Clear();
            listBox3.Items.Clear();
            ID = 0;
            SqlCommand h = new("select * from TripPlanner.Trip", con);
            SqlDataReader readerT = h.ExecuteReader();
            string tripName = trips.SelectedItem.ToString();
            string name = tripName.Split('\t')[0].Trim();
            while (readerT.Read())
            {
                if(readerT["TrName"].ToString() == name)
                {
                    ID = Int32.Parse(readerT["ID"].ToString());
                    listBox2.Items.Add("Name: " + readerT["TrName"].ToString());
                    listBox2.Items.Add("Price: " + readerT["Price"].ToString());
                    listBox2.Items.Add("Duration: " + readerT["Duration"].ToString());
                    listBox2.Items.Add("Departure: " + readerT["Departure_Date"].ToString());
                    listBox2.Items.Add("State Of Trip: " + readerT["TrState"].ToString());
                    listBox2.Items.Add("Elaborator: " + readerT["Elaborator_CC"].ToString());
                    
                }
            }
            readerT.Close();
            
            SqlCommand p = new("select * from TripPlanner.Trip t, TripPlanner.Has h, TripPlanner.Person p where t.ID = h.Trip_ID and h.Person_CC = p.CC", con);
            SqlDataReader readerP = p.ExecuteReader();
            while (readerP.Read())
            {
                if (readerP["TrName"].ToString() == name)
                {
                    listBox3.Items.Add(readerP["PfName"].ToString() + " " + readerP["PlName"].ToString());
                }            }
           
            readerP.Close();

            SqlCommand s = new("select * from TripPlanner.Trip t, TripPlanner.Stays_In s, TripPlanner.Stay st where t.ID = s.Trip_ID and s.StayContact = st.Contact", con);
            SqlDataReader readerS = s.ExecuteReader();
            while (readerS.Read())
            {
                if(readerS["TrName"].ToString() == name)
                {
                    textBox2.Text = readerS["SName"].ToString();
                }
                
            }
            readerS.Close();

            SqlCommand v = new("select * from TripPlanner.Trip t, TripPlanner.Visit v, TripPlanner.POInterest poi where t.ID = v.Trip_ID and v.POIContact = poi.Contact", con);
            SqlDataReader readerV = s.ExecuteReader();
            while (readerV.Read())
            {
                if (readerV["TrName"].ToString() == name)
                {
                    //listBox1.Text = readerV["PoIName"].ToString();
                }

            }
            readerV.Close();
            con.Close();
        }

        private void tirp_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void listBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
