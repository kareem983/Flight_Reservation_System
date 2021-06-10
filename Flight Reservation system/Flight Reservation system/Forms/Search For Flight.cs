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
    public partial class Search_For_Flight : Form
    {
        OracleConnection conn;
        OracleDataAdapter da;
        OracleCommandBuilder cb;
        DataSet ds;

        string ordb = "Data source=orcl;User Id=scott; Password=tiger;";

        public Search_For_Flight()
        {
            InitializeComponent();
            dataGridView1.Visible = false;
        }

        private void Search_For_Flight_Load(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "PRO_get_city";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("cities", OracleDbType.RefCursor, ParameterDirection.Output);
            OracleDataReader orc = cmd.ExecuteReader();
            List<string> stringtxt = new List<string>();
            while (orc.Read())
            {
                //Console.WriteLine(orc[0]);
                stringtxt.Add((string)orc[0]);
            }
            List<string> distinct = stringtxt.Distinct().ToList();
            foreach (string value in distinct)
            {
                cmb_1.Items.Add(value);
                cmb_2.Items.Add(value);
            }
            orc.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (cmb_1.Text.Equals("") || cmb_2.Text.Equals(""))
                {
                    MessageBox.Show(Program.MessageAlert);
                }
                else
                {
                    dataGridView1.Visible = true;
                    OracleCommand cmd = new OracleCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "PRO_SEARCH_FOR_Flight";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("sourcee", cmb_1.SelectedItem.ToString());
                    cmd.Parameters.Add("des", cmb_2.SelectedItem.ToString());
                    cmd.Parameters.Add("cities", OracleDbType.RefCursor, ParameterDirection.Output);
                    da = new OracleDataAdapter(cmd);
                    cb = new OracleCommandBuilder(da);
                    ds = new DataSet();
                    da.Fill(ds);
                    dataGridView1.DataSource = ds.Tables[0];
                    //conn.Close();
                }
            }
            catch
            {
                dataGridView1.Visible = false;
                MessageBox.Show("Wrong Places\nPlease Select Right Place");
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
             this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.Columns.Clear();
            dataGridView1.Visible = false;
            cmb_1.Text = "";
            cmb_2.Text = "";
        }
    }
}
