using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CrystalDecisions.Shared;

namespace Flight_Reservation_system
{
    public partial class TownsReport : Form
    {
        TownsCrystalReport2 cr;
        public TownsReport()
        {
            InitializeComponent();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void TownsReport_Load(object sender, EventArgs e)
        {
            try
            {
                cr = new TownsCrystalReport2();
                foreach (ParameterDiscreteValue v in cr.ParameterFields[0].DefaultValues)
                {
                    comboBox1.Items.Add(v.Value.ToString());
                }
                foreach (ParameterDiscreteValue v in cr.ParameterFields[1].DefaultValues)
                {
                    comboBox2.Items.Add(v.Value.ToString());
                }
            }
            catch
            {
                MessageBox.Show(Program.ReportMessageAlert);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (comboBox1.Text.ToString().Equals("") || comboBox2.Text.ToString().Equals(""))
                {
                    MessageBox.Show(Program.MessageAlert);
                }
                else
                {
                    cr.SetParameterValue(0, comboBox1.SelectedItem.ToString());
                    cr.SetParameterValue(1, comboBox2.SelectedItem.ToString());
                    crystalReportViewer1.ReportSource = cr;
                }
            }
            catch
            {
                MessageBox.Show("Wrong Places\nPlease Select Right Place");
            }
        }
    }
}
