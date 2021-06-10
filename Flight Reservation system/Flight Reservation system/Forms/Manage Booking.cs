﻿using System;
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
    public partial class Manage_Booking : Form
    {
        string connStr = Program.ConnStr;
        string CMDStr = "";
        OracleDataAdapter adapter;
        OracleCommandBuilder builder;
        DataSet dataset;
        int FinalNumOfFlight = 0, FlightNum = 0;

        public Manage_Booking()
        {
            InitializeComponent();
        }

        

        private void Manage_Booking_Load(object sender, EventArgs e)
        {
            try
            {
                CMDStr = "select * from pro_cust_book_flight where email_cssn = '" + Program.UserEmail + "'";
                adapter = new OracleDataAdapter(CMDStr, connStr);
                dataset = new DataSet();
                adapter.Fill(dataset);
                dataGridView1.DataSource = dataset.Tables[0];


                dataGridView1.Columns[0].HeaderText = "User Email";
                dataGridView1.Columns[1].HeaderText = "Flight Number";
                dataGridView1.Columns[2].HeaderText = "Num Of FLights";
                dataGridView1.Columns[0].ReadOnly = true;
                dataGridView1.Columns[1].ReadOnly = true;

            }
            catch
            {
                MessageBox.Show("Wrong in Data Display");
            }

        }


        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int numOfFlightB = 0, numOfFlightA = 0;

                DataGridViewRow row = dataGridView1.SelectedRows[0];
                FlightNum = Convert.ToInt32(row.Cells[1].Value.ToString());
                numOfFlightB = get_NumOfFlight_FromBook();
                numOfFlightA = Convert.ToInt32(row.Cells[2].Value.ToString());

                if (numOfFlightA <= 0)
                {
                    MessageBox.Show("Number of Flights must more than 0\nOr delete the reservation");
                    return;
                }

                builder = new OracleCommandBuilder(adapter);
                adapter.Update(dataset.Tables[0]);

                FinalNumOfFlight = numOfFlightB - numOfFlightA;
                set_NumOfSeatsInSeat();
                MessageBox.Show("The reservation Updated Successfully");

            }
            catch
            {
                MessageBox.Show("Please Select The updated row");
            }
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            try
            {

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                FlightNum = Convert.ToInt32(row.Cells[1].Value.ToString());
                FinalNumOfFlight = Convert.ToInt32(row.Cells[2].Value.ToString());


                int RowIndex = dataGridView1.CurrentCell.RowIndex;
                dataset.Tables[0].Rows[RowIndex].Delete();

                builder = new OracleCommandBuilder(adapter);
                adapter.Update(dataset.Tables[0]);

                dataGridView1.Refresh();
                set_NumOfSeatsInSeat();
                MessageBox.Show("The reservation Deleted Successfully");
            }
            catch
            {
                MessageBox.Show("Please Select The Row");
            }

        }


        private void set_NumOfSeatsInSeat()
        {
            OracleConnection con = new OracleConnection(connStr);
            con.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT NUM_OF_SEATS from PRO_SEAT WHERE F_SEAT= '" + FlightNum + "'";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            int x = 0;
            while (dr.Read())
            {
                x = Convert.ToInt32(dr[0]);
            }

            x += FinalNumOfFlight;


            OracleConnection con1 = new OracleConnection(connStr);
            con1.Open();
            OracleCommand cmd1 = new OracleCommand();
            cmd1.Connection = con1;

            cmd1.CommandText = "Update PRO_SEAT set NUM_OF_SEATS = " + x + "Where F_SEAT= '" + FlightNum + "'";
            cmd1.CommandType = CommandType.Text;
            int ret = cmd1.ExecuteNonQuery();
            if (ret == -1) MessageBox.Show("Invalid Problem1");

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private int get_NumOfFlight_FromBook()
        {
            OracleConnection con = new OracleConnection(connStr);
            con.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT NUM_OF_FLIGHTS from PRO_CUST_BOOK_FLIGHT WHERE EMAIL_CSSN= '" + Program.UserEmail + "' and FLIGHT_NUM_FSSN = '" + FlightNum + "'";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            int x = 0;
            while (dr.Read())
            {
                x = Convert.ToInt32(dr[0]);
            }
            return x;
        }

    }
}
