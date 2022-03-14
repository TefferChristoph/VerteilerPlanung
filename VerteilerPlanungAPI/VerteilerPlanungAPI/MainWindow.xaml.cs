/*
 * Teffer Christoph,
 * VerteilerPlanung-API
 */




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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data;

namespace VerteilerPlanungAPI
{


    public partial class MainWindow : Window
    {
        SqlConnection conn;
        SqlCommand command;
        int HouseId { set; get; }
        int RoomId { set; get; }

        int Floors { set; get; }
        public MainWindow()
        {
            InitializeComponent();
            LoginFrm log = new LoginFrm();
            log.ShowDialog();
            if (log.Connected)
            {
                conn = log.Con;
            }
        }

        
        void testCmd()
        {
            /*
            command = new SqlCommand("Select * from House");
            
            command.Connection = conn;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable("House");
            adapter.Fill(dataTable);

            dataGrid.ItemsSource = dataTable.DefaultView;
            conn.Close();
            */
            command = new SqlCommand("HouseHoldList", conn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@house", "1");
            command.Parameters.AddWithValue("@room", "-1");

            command.ExecuteNonQuery();

            SqlDataAdapter adap = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            dataGrid.ItemsSource = dt.DefaultView;
            
        }

        private void AddDataGridColumn(string name, string binding)
        {
            DataGridTextColumn col = new DataGridTextColumn();
            col.Header = name;
            col.Binding = new Binding(binding);
            col.Width = new DataGridLength(1, DataGridLengthUnitType.Star);
            dataGrid.Columns.Add(col);
        }
     

        void PrintRoomList(int house, int room =-1)
        {
            dataGrid.Columns.Clear();
            AddDataGridColumn("Raum", "Raum");
            AddDataGridColumn("Gerät", "Geraet");
            //AddDataGridColumn("Stärke", "Power");
            AddDataGridColumn("Ampere", "Ampere");
            AddDataGridColumn("Anzahl", "number");
            command = new SqlCommand("SocketList", conn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@house", SqlDbType.Int).Value = house;
            command.Parameters.AddWithValue("@room", SqlDbType.Int).Value = room;
            command.ExecuteNonQuery();

            SqlDataAdapter adap = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGrid.ItemsSource = dt.DefaultView;
        }

        

        private void miRoomListAll_Click(object sender, RoutedEventArgs e)
        {
            if(HouseId == 0)
            {
                MessageBox.Show("Bitte zuerst ein Haus auswählen");
            }
            else
            {
                PrintRoomList(HouseId);
            }
        }
        private void miRoomList_Click(object sender, RoutedEventArgs e)
        {
            if (HouseId == 0)
            {
                MessageBox.Show("Bitte zuerst ein Haus auswählen");
            }
            else
            {
                PrintRoomList(HouseId, RoomId);
            }

        }



        private void miListHouse_Click(object sender, RoutedEventArgs e)
        {
            dataGrid.Columns.Clear();

            AddDataGridColumn("ID", "house_id");
            AddDataGridColumn("PLZ", "zip");
            AddDataGridColumn("Stadt", "city");
            AddDataGridColumn("Adresse", "adress");
            AddDataGridColumn("Stockwerke", "floors");
            command = new SqlCommand("getHouses", conn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.ExecuteNonQuery();

            SqlDataAdapter adap = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            dataGrid.ItemsSource = dt.DefaultView;
        }

        private void miSelectHouse_Click(object sender, RoutedEventArgs e)
        {
            DataRowView row = dataGrid.SelectedItem as DataRowView;
            HouseId = Int32.Parse(row.Row[0].ToString());
            Floors = Int32.Parse(row.Row[4].ToString());

            
            command = new SqlCommand("getRooms", conn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@house", SqlDbType.Int).Value = HouseId;

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Room r = new Room(HouseId, Int32.Parse(reader[0].ToString()), reader[1].ToString());
                cbRooms.Items.Add(r.Descr);
                cbRooms.SelectedIndex = 0;
            }

        }

        private void miNewHouse_Click(object sender, RoutedEventArgs e)
        {
            HouseDialog hd = new HouseDialog();
            hd.ShowDialog();
            if(hd.DialogResult.HasValue && hd.DialogResult.Value)
            {
                command = new SqlCommand("insertHouse", conn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@adress", hd.Address);
                command.Parameters.AddWithValue("@zip", hd.Zip);
                command.Parameters.AddWithValue("@city", hd.City);
                command.Parameters.AddWithValue("@Floors", hd.Floors + "");

                command.ExecuteNonQuery();
            }
           
        }

        private void miNewRoom_Click(object sender, RoutedEventArgs e)
        {
            AddRoom ar = new AddRoom(Floors);
            ar.ShowDialog();
            if(ar.DialogResult.HasValue && ar.DialogResult.Value)
            {
                command = new SqlCommand("insertRoom", conn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@house", HouseId);
                command.Parameters.AddWithValue("@descr", ar.Name);
                command.Parameters.AddWithValue("@floor", ar.Floor + "");

                command.ExecuteNonQuery();

            }
        }

        private void cbRooms_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RoomId = cbRooms.SelectedIndex + 1;
        }
    }
}
