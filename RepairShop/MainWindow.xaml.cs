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
                itemsControl.ItemsSource = RepairShopEntities.GetContext()
                    .Application.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузиь список с " +
                    $"заявками! {ex.Message}");
            }
        }

        private void LoadDataToComboBoxes()
        {
            try
            {
                var equipmentTypes = RepairShopEntities.GetContext()
                    .Equipment_type.Select(types => types.Type_name).ToList();
                equipmentTypes.Insert(0, "Все типы");
                equipmentTypeComboBox.ItemsSource = equipmentTypes;
                var malfunctionTypes = RepairShopEntities
                    .GetContext().Malfunction_type.Select(type => type.Type_name).ToList();
                malfunctionTypes.Insert(0, "Все типы");
                malfunctionTypeComboBox.ItemsSource = malfunctionTypes;
                equipmentTypeComboBox.SelectedIndex = 0;
                malfunctionTypeComboBox.SelectedIndex = 0;
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
            EditApplicationWindow window = new EditApplicationWindow((sender as Button)
                .DataContext as Model.Application);
            window.Show();
        }

        private void searchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            SortApplications();
        }

        private void equipmentTypeComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortApplications();
        }

        private void malfunctionTypeComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortApplications();
            ShowStatisticsMalfunction();
        }

        private void SortApplications()
        {
            var applications = RepairShopEntities.GetContext()
                    .Application.ToList();
            if (equipmentTypeComboBox.SelectedIndex > 0)
            {
                string selectedEquipment = equipmentTypeComboBox.SelectedItem as string;
                applications = applications.Where(a => a.Equipment_type.Type_name
                    == selectedEquipment).ToList();
            }
            if (malfunctionTypeComboBox.SelectedIndex > 0)
            {
                string selectedMalfunction = malfunctionTypeComboBox.SelectedItem as string;
                applications = applications.Where(m => m.Malfunction_type.Type_name == selectedMalfunction).ToList();
            }
            if (searchTextBox.Text.Length > 0)
            {
                applications = applications.Where(a => a.Equipment_serial_number
                .ToLower().Contains(searchTextBox.Text.ToLower())).ToList();
            }
            itemsControl.ItemsSource = applications;
        }

        private void ShowStatisticsMalfunction()
        {
            var malfunctionIndexType = malfunctionTypeComboBox.SelectedIndex;
            if (malfunctionIndexType > 0)
            {
                string malfunctionType = malfunctionTypeComboBox.SelectedItem as string;
                int malfunctionId = RepairShopEntities.GetContext().Malfunction_type
                    .Where(m => m.Type_name == malfunctionType)
                    .Select(m => m.ID).FirstOrDefault();
                int quantity = RepairShopEntities.GetContext().Application
                    .Where(a => a.Malfunction_type_ID == malfunctionId).Count();
                statisticsTextBox.Text = $"ВСЕГО заявок с типом " +
                    $"неисправности \"{malfunctionType}\" было найдено {quantity} шт.";
            }
            else
                statisticsTextBox.Text = string.Empty;
        }
    }
}
