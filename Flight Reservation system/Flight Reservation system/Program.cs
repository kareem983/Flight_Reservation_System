using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Flight_Reservation_system
{

    static class Program
    {
        public static string UserName="";
        public static string UserEmail="";
        public static string UserPassword="";
        public static string MessageAlert = "please fill all required data to complete process";
        public static string ReportMessageAlert = "There is Wrong Data Display";
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Home());
            
        }
    }
}
