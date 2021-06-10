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
    public partial class Profile : Form
    {
        string ordb;
        OracleConnection conn;
        string email;
        string FName;
        string LName;
        string Address;
        string Passport;
        string Credit;
        public Profile()
        {
            InitializeComponent();
        }

        private void Profile_Load(object sender, EventArgs e)
        {
            ordb = Program.ConnStr;
            conn = new OracleConnection(ordb);
            conn.Open();
            email = Program.UserEmail;
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "PRO_GET_USER_DATA";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("email_", email );
            

            OracleParameter FNameParameter = new OracleParameter("FIRST_NAME", OracleDbType.Varchar2, 50);
            FNameParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(FNameParameter);

            OracleParameter LNameParameter = new OracleParameter("LAST_NAME", OracleDbType.Varchar2, 50);
            LNameParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(LNameParameter);

            OracleParameter AddressParameter = new OracleParameter("ADDRESS", OracleDbType.Varchar2, 50);
            AddressParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(AddressParameter);

            OracleParameter PassNumParameter = new OracleParameter("PASSPORT_NUM", OracleDbType.Int32,2000);
            PassNumParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(PassNumParameter);

            OracleParameter CreditNumParameter = new OracleParameter("CREDIT_NUM", OracleDbType.Varchar2, 20);
            CreditNumParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(CreditNumParameter);
            

            try
            {
                int ret = cmd.ExecuteNonQuery();
            }
            catch(Exception ex) {
                MessageBox.Show("Faild to get data");
            }

             FName =   FNameParameter.Value.ToString();
             LName =   LNameParameter.Value.ToString();
             Address = AddressParameter.Value.ToString();
             Passport = PassNumParameter.Value.ToString();
             Credit =   CreditNumParameter.Value.ToString();
          
            
            textBox1.Text = FNameParameter.Value.ToString();
            textBox2.Text = LNameParameter.Value.ToString();
            label5.Text = textBox1.Text + " " + textBox2.Text;
            textBox3.Text = email;
            textBox4.Text = AddressParameter.Value.ToString();
            textBox5.Text = PassNumParameter.Value.ToString();
            textBox6.Text = CreditNumParameter.Value.ToString();


            OracleCommand cmd2 = new OracleCommand();
            cmd2.Connection = conn;
            cmd2.CommandText = "PRO_GET_USER_PHONES";
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add("email", email);
            cmd2.Parameters.Add("phones", OracleDbType.RefCursor, ParameterDirection.Output);
            try
            {

                OracleDataReader dr = cmd2.ExecuteReader();

                dr.Read();
                label10.Text = dr[0].ToString();
                dr.Read();
                label11.Text = dr[0].ToString();

                dr.Close();
            }catch(Exception ex)
            {
                MessageBox.Show("Faild to get phone data");
            }


        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;

                // cmd.CommandText = "insert into PRO_CUSTOMER (email, first_name, last_name, password) Values(:email, :first, :last, :password)";
             //     cmd.CommandText = "update PRO_CUSTOMER set FIRST_NAME = :first , LAST_NAME = :last , address = :address , passport_num = :passport , credit_num = :credit WHERE email = :email_ ";
               //  cmd.CommandType = CommandType.Text;

                cmd.CommandText = "PRO_UPDATE_CUSTOMER_DATA";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("email", email);
                cmd.Parameters.Add("first", textBox1.Text);
                cmd.Parameters.Add("last", textBox2.Text);
                cmd.Parameters.Add("address", textBox4.Text);
                cmd.Parameters.Add("passport", int.Parse(textBox5.Text));
                cmd.Parameters.Add("credit", int.Parse(textBox6.Text));

               // cmd.Parameters.Add("email_", email);

                int ret = cmd.ExecuteNonQuery();
                /*if (ret == -1) MessageBox.Show("Invalid problem1");
                else*/ MessageBox.Show("Data Updated Successfull");

                label5.Text = textBox1.Text.ToString() + " " + textBox2.Text.ToString();
                FName = textBox1.Text ;
                LName= textBox2.Text ;
                email= textBox3.Text  ;
                Address=textBox4.Text ;
                Passport =textBox5.Text ;
                Credit =textBox6.Text ;


            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.Message.ToString());
                 MessageBox.Show("Faild to update");

            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = FName;
            textBox2.Text = LName;
            textBox3.Text = email;
            textBox4.Text = Address;
            textBox5.Text = Passport;
            textBox6.Text = Credit;

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
