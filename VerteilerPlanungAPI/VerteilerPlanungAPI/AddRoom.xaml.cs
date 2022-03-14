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
    /// Interaktionslogik für AddRoom.xaml
    /// </summary>
    /// 



    public partial class AddRoom : Window
    {

        public string Name { set; get; }
        public int Floor { set; get; }
        public AddRoom(int f)
        {
            InitializeComponent();
            for(int i = 1; i <= f; i++)
            {
                cbFloors.Items.Add(i);
            }
            cbFloors.SelectedIndex = 0;
        }

        private void btnAddRoom_Click(object sender, RoutedEventArgs e)
        {
            if(tbRoom.Text.Length == 0)
            {
                tblRoom.Focus();
            }
            else
            {
                Name = tbRoom.Text;
                Floor = Int32.Parse(cbFloors.SelectedItem.ToString());
                DialogResult = true;
                Close();
            }
        }

    }
}
