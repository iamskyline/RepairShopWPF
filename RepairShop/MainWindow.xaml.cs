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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RepairShop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadAllApplications();
            LoadDataToComboBoxes();
        }

        private void LoadAllApplications()
        {
            try
            {
                itemsControl.ItemsSource = RepairShopEntities.GetContext().Application.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузиь список с заявками! {ex.Message}");
            }
        }

        private void LoadDataToComboBoxes()
        {
            try
            {
                equipmentTypeComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Equipment_type.Select(types => types.Type_name).ToList();
                malfunctionTypeComboBox.ItemsSource = RepairShopEntities
                    .GetContext().Malfunction_type.Select(type => type.Type_name).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузить ключевые типы для поиска " +
                    $"по фильтрам!\n{ex.Message}");
            }
        }

        private void addApplicationBtn_Click(object sender, RoutedEventArgs e)
        {
            NewApplicationWindow window = new NewApplicationWindow();
            window.Show();
        }

        private void editApplicationBtn_Click(object sender, RoutedEventArgs e)
        {
            EditApplcationWindow window = new EditApplcationWindow();
            window.Show();
        }
    }
}
