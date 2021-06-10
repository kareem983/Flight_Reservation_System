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
    public partial class Booking : Form
    {
        string conStr = "data source = orcl; user id = scott; password = tiger;";
        OracleConnection con;
        public Booking()
        {
            InitializeComponent();
        }

        private void Booking_Load(object sender, EventArgs e)
        {
            timer1.Start();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label6_Click(object sender, EventArgs e)
        {
            new Search_For_Flight().Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // save credit and address in user 
            // save book data in user 
            // mail can reapeted 
            // flight number if reapeted just check other data then add number of tickets to old one
            // show data of flight and airport after finish booking 
            if (flight_num.Text.Equals("") || nums.Text.Equals("") || add.Text.Equals("") || credit.Text.Equals("") || pass_num.Text.Equals(""))
            {
                MessageBox.Show(Program.MessageAlert);
            }
            else
            {
                con = new OracleConnection(conStr);
                con.Open();

                
                OracleCommand cmd2 = new OracleCommand();
                cmd2.Connection = con;
                cmd2.CommandText = "select PRICE,NUM_OF_SEATS from PRO_SEAT where F_SEAT = :fssn";
                cmd2.CommandType = CommandType.Text;
                cmd2.Parameters.Add("fssn", int.Parse(flight_num.Text));
                string x = "SEAT PRICE : ", y = "", seats = "";
                OracleDataReader dr = cmd2.ExecuteReader();
                while (dr.Read())
                {
                    y = dr[0].ToString();
                    seats = dr[1].ToString();
                }

                int r = int.Parse(y);
                r *= int.Parse(nums.Text);
                x = r.ToString();

                /*  (user name )        
                 *your flight (from (airport) / to(airport)) 
                 * in (date ) at (time )
                     * your plane landing in (date ) at (time)
                 * total price " "
                  * (seat price * ticket number)
                 * * /
                 */
                //----------------------------------
                OracleCommand cmd3 = new OracleCommand();
                cmd3.Connection = con;
                cmd3.CommandText = "select * from PRO_FLIGHT f, PRO_AIRPORT w where ((FLIGHT_NUM =:fssn) and (f.airport_tssn1 = w.airport_num and f.airport_tssn2 = w.city) )";
                cmd3.CommandType = CommandType.Text;
                cmd3.Parameters.Add("fssn", int.Parse(flight_num.Text));
                string[] data = new string[20];
                dr = cmd3.ExecuteReader();
                while (dr.Read())
                {
                    for (int i = 0; i < 13; i++)
                    {
                        data[i] = dr[i].ToString();

                    }
                }

                OracleCommand cmd4 = new OracleCommand();
                cmd4.Connection = con;
                cmd4.CommandText = "select w.* from PRO_FLIGHT f, PRO_AIRPORT w where ((FLIGHT_NUM =:fssn) and (f.airport_fssn1 = w.airport_num and f.airport_fssn2 = w.city) )";
                cmd4.CommandType = CommandType.Text;
                cmd4.Parameters.Add("fssn", int.Parse(flight_num.Text));

                dr = cmd4.ExecuteReader();
                while (dr.Read())
                {

                    data[13] = dr["CITY"].ToString();

                    data[14] = dr["AIRPORT_NUM"].ToString();

                    data[15] = dr["NAME"].ToString();
                }
                String t = "you are book for flight from " + data[12] + "/" + data[10] + "to " + data[15] + "/" + data[13] + "\n in " + data[1] + "\n and landing in " + data[2] + "\n number of tickets: " + nums.Text + "\n Total Price :-  " + x;
                string title = "Confirmation";
                MessageBoxButtons buttons = MessageBoxButtons.OKCancel;
                DialogResult result = MessageBox.Show(t, title, buttons);
                if (result == DialogResult.OK)
                {
                    int rest = int.Parse(seats) - int.Parse(nums.Text.ToString());
                    if (rest < 0)
                    {
                        MessageBox.Show("out of tickets");
                    }
                    else
                    {
                        OracleCommand command = new OracleCommand();
                        command.Connection = con;
                        command.CommandText = "update PRO_CUSTOMER set PASSPORT_NUM = :pass , CREDIT_NUM =:credit , ADDRESS=:addd where EMAIL= :maill ";
                        command.CommandType = CommandType.Text;
                        command.Parameters.Add("pass", pass_num.Text);
                        command.Parameters.Add("addd", add.Text);
                        command.Parameters.Add("credit", credit.Text);
                        command.Parameters.Add("maill", Program.UserEmail);
                        int ret = command.ExecuteNonQuery();
                        if (ret == -1) MessageBox.Show("Invalid problem1");


                        OracleCommand commandtst = new OracleCommand();
                        commandtst.Connection = con;
                        commandtst.CommandText = "select FLIGHT_NUM_FSSN , NUM_OF_FLIGHTS , EMAIL_CSSN from PRO_CUST_BOOK_FLIGHT where FLIGHT_NUM_FSSN=:fssn and EMAIL_CSSN=:maill";
                        commandtst.CommandType = CommandType.Text;
                        commandtst.Parameters.Add("fssn", int.Parse(flight_num.Text));
                        commandtst.Parameters.Add("maill", Program.UserEmail);
                        dr = commandtst.ExecuteReader();
                        string tst = "", tstnums = "", tstmail = "";
                        while (dr.Read())
                        {
                            tst = dr[0].ToString();
                            tstnums = dr[1].ToString();
                            tstmail = dr[2].ToString();


                        }


                        if (tst == "")

                        {
                            OracleCommand cmd = new OracleCommand();
                            cmd.Connection = con;
                            cmd.CommandText = "insert into PRO_CUST_BOOK_FLIGHT (flight_num_fssn , email_cssn , num_of_flights) values( :fssn , :email,:nums)  ";
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.Add("fssn", int.Parse(flight_num.Text));
                            cmd.Parameters.Add("email", Program.UserEmail);
                            cmd.Parameters.Add("nums", int.Parse(nums.Text));
                            ret = cmd.ExecuteNonQuery();
                            if (ret == -1) MessageBox.Show("Invalid problem2");
                        }
                        else
                        {
                            int tickets = int.Parse(nums.Text) + int.Parse(tstnums);
                            OracleCommand cmd = new OracleCommand();
                            cmd.Connection = con;
                            cmd.CommandText = "update PRO_CUST_BOOK_FLIGHT set NUM_OF_FLIGHTS = :nums where  FLIGHT_NUM_FSSN = :fssn and EMAIL_CSSN=:maill";
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.Add("nums", tickets);
                            cmd.Parameters.Add("fssn", int.Parse(flight_num.Text));
                            cmd.Parameters.Add("maill", Program.UserEmail);
                            ret = cmd.ExecuteNonQuery();
                            if (ret == -1) MessageBox.Show("Invalid problem2");
                        }
                        if (rest != 0)
                        {
                            OracleCommand command2 = new OracleCommand();
                            command2.Connection = con;
                            command2.CommandText = "update PRO_SEAT set NUM_OF_SEATS = :rest where F_SEAT= :seat ";
                            command2.CommandType = CommandType.Text;
                            command2.Parameters.Add("rest", rest.ToString());
                            command2.Parameters.Add("seat", flight_num.Text);

                            ret = command2.ExecuteNonQuery();
                            if (ret == -1) MessageBox.Show("Invalid problem command2");
                        }
                        else
                        {
                            OracleCommand command2 = new OracleCommand();
                            command2.Connection = con;
                            command2.CommandText = "update PRO_SEAT set NUM_OF_SEATS = :rest, STATUS='y' where F_SEAT= :seat ";
                            command2.CommandType = CommandType.Text;
                            command2.Parameters.Add("rest", rest.ToString());
                            command2.Parameters.Add("seat", flight_num.Text);

                            ret = command2.ExecuteNonQuery();
                            if (ret == -1) MessageBox.Show("Invalid problem command2");
                        }
                        MessageBox.Show("Booking Procees DONE");
                    }
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Process Canceled");
                    this.Close();
                }
                //-------------------------------------


            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime t = DateTime.Now;
            this.label7.Text = t.ToString();
        }
    }
}
