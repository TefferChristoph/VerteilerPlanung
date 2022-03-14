using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data;

namespace VerteilerPlanungAPI
{
    /// <summary>
    /// Interaktionslogik für LoginFrm.xaml
    /// </summary>
    public partial class LoginFrm : Window
    {
        public SqlConnection Con;
        public bool Connected;
        public LoginFrm()
        {
            InitializeComponent();

        }

        public void closeCon()
        {
            Connected = false;
            Con.Close();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            string conStr;

            if(tbUsername.Text.Length == 0)
            {
                errormessage.Text = "Benutzernamen eingeben!";
                tbUsername.Focus();
            }
            else
            {
                string userName = tbUsername.Text;
                string pw = pwBox.Password;
                conStr = @"Data Source=DESKTOP-FOASM6G;
                                Initial Catalog=Verteilerplanung;
                                 User ID=" + userName + ";Password="+pw;
                                
                                ;
                Con = new SqlConnection(conStr);

                try
                {
                    Con.Open();
                    MessageBox.Show("Mit der DB verbunden");
                    Connected = true;
                    Close();
                } catch (Exception ex)
                {
                    MessageBox.Show("Datenbank konnte nicht geöffnet werden");
                    Connected = false;
                }
            }
        }
    }
}
