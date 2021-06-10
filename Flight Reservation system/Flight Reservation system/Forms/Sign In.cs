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
    public partial class Sign_In : Form
    {
        string conStr = "data source = orcl; user id = scott; password = tiger;";
        OracleConnection con;
        public Sign_In()
        {
            InitializeComponent();
        }

        private void Sign_In_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Equals("E-Mail") || textBox2.Text.Equals("PASSWORD") || textBox1.Text.Equals("") || textBox2.Text.Equals(""))
            {
                MessageBox.Show(Program.MessageAlert);
            }
            else
            {
                con = new OracleConnection(conStr);
                con.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;

                cmd.CommandText = "SELECT EMAIL from PRO_CUSTOMER WHERE EMAIL= :email and PASSWORD= :password";
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("email", textBox1.Text);
                cmd.Parameters.Add("password", textBox2.Text);
                OracleDataReader dr = cmd.ExecuteReader();
                string x = "";
                while (dr.Read())
                {
                    x = dr[0].ToString();
                }

                if (x.Equals(""))
                {
                    MessageBox.Show("Invalid Email or password");
                }
                else
                {
                    Program.UserName = gat_userName();
                    Program.UserEmail = textBox1.Text;
                    Program.UserPassword = textBox2.Text;
                    MessageBox.Show("Welcome Back\nLogin Successfully");

                    Home.UserNameLabel.Text = Program.UserName;
                    Home.UserNameLabel.Visible = true;
                    this.Close();
                }
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {
            new Sign_UP().Show();
            this.Close();
        }


        private string gat_userName()
        {
            string name = "";

            con = new OracleConnection(conStr);
            con.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT FIRST_NAME from PRO_CUSTOMER WHERE EMAIL= :email";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("email", textBox1.Text);
            OracleDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                name = dr["FIRST_NAME"].ToString();
            }

            return name;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
