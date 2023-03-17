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
    public partial class Form3 : Form
    {
        private SqlConnection con;
        public Form3()
        {
            InitializeComponent();
            Load += new EventHandler(Form3_Load);
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

        private void Form3_Load(object sender, EventArgs e)
        {
            logout.Visible = false;

            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            SqlCommand person = new SqlCommand("select * from TripPlanner.Person", con);
            SqlDataReader reader = person.ExecuteReader();
            comboBox1.Items.Add("Select Person...");
            while (reader.Read())
            {
                Person P = new Person();
                P.Sex = reader["Sex"].ToString();
                P.First_Name = reader["PfName"].ToString();
                P.Middle_Name = reader["PmName"].ToString();
                P.Last_Name = reader["PlName"].ToString();
                P.Email = reader["Email"].ToString();
                P.Address = reader["PAddress"].ToString();
                P.PersonCC = reader["CC"].ToString();
                comboBox1.Items.Add(P.First_Name + " " + P.Last_Name);
            }
            reader.Close();

            SqlCommand tp = new SqlCommand("select * from TripPlanner.TripType", con);
            SqlDataReader readerType = tp.ExecuteReader();
            types.Items.Add("Select Type...");
            while (readerType.Read())
            {
                TripType TT = new TripType();
                TT.ID = Int32.Parse(readerType["ID"].ToString());
                TT.Type = readerType["TypeName"].ToString();
                if (!types.Items.Contains(TT.Type))
                {
                    types.Items.Add(TT.Type);
                }
            }
            readerType.Close();

            SqlCommand st = new SqlCommand("select * from TripPlanner.Stay", con);
            SqlDataReader readerStay = st.ExecuteReader();
            stays.Items.Add("Select a Stay...");
            while (readerStay.Read())
            {
                Stay S = new Stay();
                S.Email = readerStay["Email"].ToString();
                S.Rating = Int32.Parse(readerStay["Rating"].ToString());
                S.Name = readerStay["SName"].ToString();
                S.Contact = readerStay["Contact"].ToString();
                S.Address = readerStay["SAddress"].ToString();
                stays.Items.Add(S.Name);
            }

            readerStay.Close();

            SqlCommand c = new SqlCommand("select * from TripPlanner.City", con);
            SqlDataReader readerCity = c.ExecuteReader();
            city.Items.Add("Select a City...");
            while (readerCity.Read())
            {
                City C = new City();
                C.City_name = readerCity["CName"].ToString();
                C.Continent_name = readerCity["Continent"].ToString();
                C.Country_name = readerCity["Country"].ToString();
                city.Items.Add(C.City_name);
            }
            readerCity.Close();

            con.Close();
            city.SelectedIndex = 0;
            comboBox1.SelectedIndex = 0;
            stays.SelectedIndex = 0;
            types.SelectedIndex = 0;

            dateTimePicker1.Format = DateTimePickerFormat.Short;
            dateTimePicker1.Value = DateTime.Today;
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            stays.Items.Clear();
            try
            {
                if (!types.Items[types.SelectedIndex].Equals("Select a Type..."))
                {
                    SqlCommand st = new SqlCommand("select s.Email, s.Rating, s.SName, s.Contact, s.SAddress" + " from TripPlanner.Stay s, TripPlanner.TripType tt" + " where tt.ID = s.TrType and tt.ID = " + types.SelectedIndex, con);
                    SqlDataReader readerStay = st.ExecuteReader();

                    while (readerStay.Read())
                    {
                        Stay S = new()
                        {
                            Email = readerStay["Email"].ToString(),
                            Rating = Int32.Parse(readerStay["Rating"].ToString()),
                            Name = readerStay["SName"].ToString(),
                            Contact = readerStay["Contact"].ToString(),
                            Address = readerStay["SAddress"].ToString()
                        };
                        stays.Items.Add(S.Name);
                    }

                    readerStay.Close();
                    con.Close();
                }
                else if (types.Items[types.SelectedIndex].Equals("Select a Type..."))
                {
                    stays.Items.Clear();
                    SqlCommand stp = new("select * from TripPlanner.Stay", con);
                    SqlDataReader readerS = stp.ExecuteReader();

                    while (readerS.Read())
                    {
                        Stay St = new()
                        {
                            Email = readerS["Email"].ToString(),
                            Rating = Int32.Parse(readerS["Rating"].ToString()),
                            Name = readerS["SName"].ToString(),
                            Contact = readerS["Contact"].ToString(),
                            Address = readerS["SAddress"].ToString()
                        };
                        stays.Items.Add(St.Name);
                    }

                    readerS.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con = getSGBDConnection();

            if (!verifySGBDConnection())
            {
                return;
            }
            String C = "";
            //qlDataAdapter cmd = new();
            DateTime departureDate = dateTimePicker1.Value;
            //cmd.InsertCommand = new SqlCommand("insert into TripPlanner.Trip(TrType, TrName, Price, Duration, Departure_Date, Elaborator_CC, TrState) values (@TrType, @TrName, @Price, @Duration, @Departure_Date, @Elaborator_CC, @TrState);", con);
            SqlCommand cmd = new("TripPlanner.AddTrip", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (CC.ReadOnly == true)
            {
                if (departureDate > DateTime.Today)
                {
                    try
                    {
                        SqlCommand c = new("select * from TripPlanner.Person", con);
                        SqlDataReader read = c.ExecuteReader();
                        while (read.Read())
                        {
                            if (read["Email"].ToString() == CC.Text)
                            {
                                C = read["CC"].ToString();
                            }
                        }
                        read.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                    cmd.Parameters.AddWithValue("@Departure_Date", departureDate);
                    cmd.Parameters.AddWithValue("@Duration", Int32.Parse(duration.Text.ToString()));
                    cmd.Parameters.AddWithValue("@TrName", tripName.Text);
                    cmd.Parameters.AddWithValue("@TrType", types.SelectedIndex);
                    cmd.Parameters.AddWithValue("@TrState", "Scheduled");
                    cmd.Parameters.AddWithValue("@Price", 0);
                    cmd.Parameters.AddWithValue("@Elaborator_CC", C);
                    cmd.ExecuteNonQuery();

                    con.Close();

                    foreach (String item in listBox1.Items)
                    {
                        AddPersonsToTrip(tripName.Text, item);
                    }

                    MessageBox.Show("Trip Created with success");
                    tripName.Text = "";
                    duration.Text = "";
                    types.Items.Clear();
                    dateTimePicker1.Value = DateTime.Today;
                    city.SelectedIndex = 0;
                    comboBox1.SelectedIndex = 0;
                    stays.SelectedIndex = 0;
                    stays.SelectedIndex = 0;
                }
                else
                {
                    MessageBox.Show("Date not valid");
                }
            }
            else
            {
                MessageBox.Show("User not Logged In");
            }
            
        }

        private void AddPersonsToTrip(String TripName, String PersonName)
        {
            con = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            string CC = "";
            SqlCommand person = new("select * from TripPlanner.Person", con);
            SqlDataReader readerPer = person.ExecuteReader();
            while (readerPer.Read())
            {
                if(readerPer["PfName"] == PersonName.Split()[0].ToString().Trim() && readerPer["PlName"] == PersonName.Split()[1].ToString().Trim())
                {
                    CC = readerPer["CC"].ToString();
                }
            }
            readerPer.Close();

            string ID = "";
            SqlCommand tri = new("select * from TripPlanner.Trip", con);
            SqlDataReader readerT = tri.ExecuteReader();
            while (readerT.Read())
            {
                if (readerT["TrName"] == tripName.Text.ToString().Trim())
                {
                    ID = readerT["ID"].ToString();
                }
            }
            readerT.Close();

            SqlDataAdapter add = new();
            add.InsertCommand = new SqlCommand("insert into TripPlanner.Has(Person_CC, Trip_ID) values (@Person_CC, @Trip_ID)");
            add.InsertCommand.Parameters.AddWithValue("@Person_CC", CC);
            add.InsertCommand.Parameters.AddWithValue("@Trip_ID", ID);
            MessageBox.Show(con.ToString());
            add.InsertCommand.ExecuteNonQuery();

            con.Close();
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {   
            if (listBox1.Items.Contains(comboBox1.Text))
            {
                MessageBox.Show(comboBox1.Text + " already added to your trip");
            }
            else if(comboBox1.Text == "Select Person...")
            {
                MessageBox.Show(comboBox1.Text);
            }
            else
            {
                listBox1.Items.Add(comboBox1.Text);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (listBox1.Items.Contains(comboBox1.Text))
            {
                listBox1.Items.Remove(comboBox1.Text);
            }
            else if (comboBox1.Text == "Select Person...")
            {
                MessageBox.Show(comboBox1.Text);
            }
            else
            {
                MessageBox.Show(comboBox1.Text + " not in your trip");
            }
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void CC_TextChanged(object sender, EventArgs e)
        {

        }

        private void login_Click(object sender, EventArgs e)
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
                if(readerEm["Email"].ToString() == CC.Text)
                {


                    P.Sex = readerEm["Sex"].ToString();
                    P.First_Name = readerEm["PfName"].ToString();
                    P.Middle_Name = readerEm["PmName"].ToString();
                    P.Last_Name = readerEm["PlName"].ToString();
                    P.Email = readerEm["Email"].ToString();
                    P.Address = readerEm["PAddress"].ToString();
                    P.PersonCC = readerEm["CC"].ToString();
                   
                    label11.Text = "Logged in as " + P.First_Name + " " + P.Last_Name;
                    CC.ReadOnly = true;
                    logout.Visible = true;
                    login.Visible = false;
                    counter = 1;

                }
            }
            readerEm.Close();

            if(counter == 1)
            {
                SqlCommand h = new("select * from TripPlanner.Trip", con);
                SqlDataReader readerT = h.ExecuteReader();
                int counterhist = 0;
                while (readerT.Read())
                {
                    if(readerT["Elaborator_CC"].ToString() == P.PersonCC)
                    {
                        hist.Items.Add(readerT["TrName"].ToString() + "\t" + readerT["TrType"].ToString());
                    }
                }
                readerT.Close();
            }

            if (counter == 0)
            {
                MessageBox.Show("User doesn't exist");
            }

            con.Close();
        }

        private void logout_Click(object sender, EventArgs e)
        {
            CC.ReadOnly = false;
            logout.Visible = false;
            login.Visible = true;
            label11.Text = "Not Logged In";
            CC.Text = "";
            hist.Items.Clear();
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
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
                if (readerEm["Email"].ToString() == CC.Text)
                {


                    P.Sex = readerEm["Sex"].ToString();
                    P.First_Name = readerEm["PfName"].ToString();
                    P.Middle_Name = readerEm["PmName"].ToString();
                    P.Last_Name = readerEm["PlName"].ToString();
                    P.Email = readerEm["Email"].ToString();
                    P.Address = readerEm["PAddress"].ToString();
                    P.PersonCC = readerEm["CC"].ToString();
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
                        hist.Items.Add(readerT["TrName"].ToString() + "\t" + readerT["TrType"].ToString());
                    }
                }
                readerT.Close();
            }
            con.Close();
        }
    }
}
