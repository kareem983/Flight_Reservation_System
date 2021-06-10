using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace Flight_Reservation_system
{
    public partial class Sign_UP : Form
    {
        string conStr = Program.ConnStr;
        OracleConnection con;
        public Sign_UP()
        {
            InitializeComponent();
        }

        private void Sign_UP_Load(object sender, EventArgs e)
        {
            

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox3.Text.Equals("First Name") || textBox4.Text.Equals("Second Name") ||
                textBox1.Text.Equals("E-Mail") || textBox2.Text.Equals("PASSWORD") || textBox5.Text.Equals("Phone Number1")
                ||textBox3.Text.Equals("") || textBox4.Text.Equals("") ||textBox1.Text.Equals("") || textBox2.Text.Equals("") || textBox5.Text.Equals(""))
            {
                MessageBox.Show(Program.MessageAlert);
            }
            else
            {
                try
                {
                    con = new OracleConnection(conStr);
                    con.Open();
                    OracleCommand cmd = new OracleCommand();
                    cmd.Connection = con;

                    cmd.CommandText = "insert into PRO_CUSTOMER (email, first_name, last_name, password) Values(:email, :first, :last, :password)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add("email", textBox1.Text);
                    cmd.Parameters.Add("first", textBox3.Text);
                    cmd.Parameters.Add("last", textBox4.Text);
                    cmd.Parameters.Add("password", textBox2.Text);
                    int ret = cmd.ExecuteNonQuery();
                    if (ret == -1) MessageBox.Show("Invalid problem1");


                    OracleCommand cmd2 = new OracleCommand();
                    cmd2.Connection = con;
                    cmd2.CommandText = "insert into PRO_CUSTOMER_PHONES (CUSTOMER_PHONE, EMAIL_CPN) Values(:phone, :emailFK)";
                    cmd2.CommandType = CommandType.Text;
                    cmd2.Parameters.Add("phone", textBox5.Text);
                    cmd2.Parameters.Add("emailFK", textBox1.Text);
                    ret = cmd2.ExecuteNonQuery();
                    if (ret == -1) MessageBox.Show("Invalid problem2");


                    OracleCommand cmd3 = new OracleCommand();
                    cmd3.Connection = con;
                    cmd3.CommandText = "insert into PRO_CUSTOMER_PHONES (CUSTOMER_PHONE, EMAIL_CPN) Values(:phone, :emailFK)";
                    cmd3.CommandType = CommandType.Text;
                    cmd3.Parameters.Add("phone", textBox6.Text);
                    cmd3.Parameters.Add("emailFK", textBox1.Text);
                    ret = cmd3.ExecuteNonQuery();
                    if (ret == -1) MessageBox.Show("Invalid problem3");

                    Program.UserName = textBox3.Text;
                    Program.UserEmail = textBox1.Text;
                    Program.UserPassword = textBox2.Text;

                    MessageBox.Show("Welcome\nSign Up Process Done Successfully");

                    Home.UserNameLabel.Text = Program.UserName;
                    Home.UserNameLabel.Visible = true;
                    this.Close();
                }
                catch
                {
                    MessageBox.Show("Allready Registered Befor!!! please sign in");
                }
            }
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {
            new Sign_In().Show();
            this.Close();
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
