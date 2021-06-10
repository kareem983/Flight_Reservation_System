using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Flight_Reservation_system
{
    public partial class FlightsReport : Form
    {
        FlightsCrystalReport1 cr;
        public FlightsReport()
        {
            InitializeComponent();
        }

        private void FlightsReport_Load(object sender, EventArgs e)
        {
            try
            {
                cr = new FlightsCrystalReport1();
                crystalReportViewer1.ReportSource = cr;
            }
            catch
            {
                MessageBox.Show(Program.ReportMessageAlert);
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
