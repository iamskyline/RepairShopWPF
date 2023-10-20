using RepairShop.Model;
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

namespace RepairShop
{
    /// <summary>
    /// Логика взаимодействия для NewApplicationWindow.xaml
    /// </summary>
    public partial class NewApplicationWindow : Window
    {
        public NewApplicationWindow()
        {
            InitializeComponent();
            LoadDataToComboBoxes();
        }

        private void LoadDataToComboBoxes()
        {
            try
            {
                equipmentComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Equipment_type.Select(type => type.Type_name).ToList();
                malfunctionComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Malfunction_type.Select(type => type.Type_name).ToList();
                clientComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Client.Select(client => client.Tel).ToList();
                statusComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Application_statuses.Select(status => status.Status_name).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузить данные " +
                    $"в списки выбора: {ex.Message}");
            }
        }

        private void createApplicationBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
