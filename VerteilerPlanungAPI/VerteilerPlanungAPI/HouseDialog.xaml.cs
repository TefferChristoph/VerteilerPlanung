using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace VerteilerPlanungAPI
{
    /// <summary>
    /// Interaktionslogik für HouseDialog.xaml
    /// </summary>
    public partial class HouseDialog : Window
    {
        public string Zip { set; get; }
        public string City { set; get; }
        public string Address { set; get; }
        public int Floors { set; get; }

        public HouseDialog()
        {
            InitializeComponent();
        }

        private void btnAddHouse_Click(object sender, RoutedEventArgs e)
        {
            if(tbZip.Text.Length == 0)
            {
                tblZip.Focus();
            }
            if (tbCity.Text.Length == 0)
            {
                tblCity.Focus();
            }
            if (tbAddress.Text.Length == 0)
            {
                tblAddress.Focus();
            }
            if (tblFloors.Text.Length == 0)
            {
                tblFloors.Focus();
            }
            else
            {
                try
                {
                    Floors = Int32.Parse(tbFloors.Text);

                    Zip = tbZip.Text;
                    Address = tbAddress.Text;
                    City = tbCity.Text;
                    DialogResult = true;
                    Close();

                }
                catch (Exception ex)
                {
                    DialogResult = false;
                    MessageBox.Show(ex.Message);
                }
            }
        }

        
    }
}
