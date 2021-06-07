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
    public partial class Home : Form
    {
        static public Label UserNameLabel = new Label();
        public Home()
        {
            InitializeComponent();
        }

        private void Home_Load(object sender, EventArgs e)
        {
            UserNameLabel = label2;
            if (!Program.UserName.Equals(""))
            {
                UserNameLabel.Visible = true;
                UserNameLabel.Text = Program.UserName;
            }
            else
            {
                UserNameLabel.Visible = false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            //go to sign up
            new Sign_UP().Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //go to sign in
            new Sign_In().Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            new Booking().Show();
            /*
            if (!Program.UserEmail.Equals(""))
            {
                //go to booking a flight
                new Booking().Show();
            }
            else
            {
                MessageBox.Show("Login first!!!");
            }*/


        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            
            new Search_For_Flight().Show();
            /*
            if (!Program.UserEmail.Equals(""))
            {
                //go to search for flight
                new Search_For_Flight().Show();
            }
            else
            {
                MessageBox.Show("Login first!!!");
            }*/
        }

        private void button7_Click(object sender, EventArgs e)
        {
            new Profile().Show();
            /*
            if (!Program.UserEmail.Equals(""))
            {
                // go to profile
                new Profile().Show();
            }
            else
            {
                MessageBox.Show("Login first!!!");
            }*/
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            new Manage_Booking().Show();
           /* 
            if (!Program.UserEmail.Equals(""))
            {
                // go to Manage Booking
                new Manage_Booking().Show();
            }
            else
            {
                MessageBox.Show("Login first!!!");
            }*/
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            new FlightsReport().Show();
            
            /* if (!Program.UserEmail.Equals(""))
             {
                // go to Flights Crystal Report 1
                new FlightsReport().Show();
             }
             else
             {
                 MessageBox.Show("Login first!!!");
             }*/
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            new TownsReport().Show();

            /* if (!Program.UserEmail.Equals(""))
             {
                // go to Towns Crystal Report 1
                new TownsReport().Show();
             }
             else
             {
                 MessageBox.Show("Login first!!!");
             }*/
        }
    }
}
