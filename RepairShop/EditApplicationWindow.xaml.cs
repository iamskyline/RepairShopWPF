using RepairShop.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
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
    /// Логика взаимодействия для EditApplicationWindow.xaml
    /// </summary>
    public partial class EditApplicationWindow : Window
    {
        private Model.Application _currentApplication;
        public EditApplicationWindow(Model.Application application)
        {
            _currentApplication = application;
            DataContext = _currentApplication;
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            try
            {
                equipmentComboBox.SelectedItem = _currentApplication.Equipment_type.Type_name;
                equipmentComboBox.ItemsSource = RepairShopEntities
                    .GetContext().Equipment_type.Select(t => t.Type_name).ToList();
                malfunctionComboBox.SelectedItem = _currentApplication.Malfunction_type.Type_name;
                malfunctionComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Malfunction_type.Select(m => m.Type_name).ToList();
                performerComboBox.SelectedItem = _currentApplication.Performer.Tel;
                performerComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Performer.Select(p => p.Tel).ToList();
                clientComboBox.SelectedItem = _currentApplication.Client.Tel;
                clientComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Client.Select(c => c.Tel).ToList();
                priorityComboBox.SelectedItem = _currentApplication.Priority_type.Type_name;
                priorityComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Priority_type.Select(p => p.Type_name).ToList();
                statusComboBox.SelectedItem = _currentApplication.Application_statuses.Status_name;
                statusComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Application_statuses.Select(s => s.Status_name).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void saveChangesBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите сохранить данные?",
                "Изменение данных", MessageBoxButton.YesNo,
                MessageBoxImage.Warning);
                if (result == MessageBoxResult.Yes)
                {
                    UpdateApplication();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void UpdateApplication()
        {
            using (var context = new RepairShopEntities())
            {
                Model.Application application = context.Application.Find(_currentApplication.ID);

                var equiment = RepairShopEntities.GetContext().Equipment_type.FirstOrDefault(t => t.Type_name == equipmentComboBox.Text);
                var status = RepairShopEntities.GetContext().Application_statuses.FirstOrDefault(s => s.Status_name == statusComboBox.Text);
                var performer = RepairShopEntities.GetContext().Performer.FirstOrDefault(p => p.Tel == performerComboBox.Text);
                var client = RepairShopEntities.GetContext().Client.FirstOrDefault(c => c.Tel == clientComboBox.Text);
                var priotity = RepairShopEntities.GetContext().Priority_type.FirstOrDefault(p => p.Type_name == priorityComboBox.Text);
                var malfunction = RepairShopEntities.GetContext().Malfunction_type.FirstOrDefault(m => m.Type_name == malfunctionComboBox.Text);
                DateTime date = DateTime.Now;
                string dateTimeString = dateTimeTextBox.Text;
                if (DateTime.TryParseExact(dateTimeString, "dd.MM.yyyy HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime parsedDateTime))
                    date = parsedDateTime;
                else
                {
                    MessageBox.Show("Введена некорректная дата и/или время. Пожалуйста, введите в формате 'гг.мм.дд чч.мм'.");
                    return;
                }

                application.Equipment_type_ID = equiment.ID;
                application.Application_status_ID = status.ID;
                application.Performer_ID = performer.ID;
                application.Client_ID = client.ID;
                application.Priority_type_ID = priotity.ID;
                application.Malfunction_type_ID = malfunction.ID;
                application.Issue.Description = issueDescriptionTextBox.Text;
                application.Equipment_serial_number = serialNumberDescriptionTextBox.Text;
                application.Planned_end_date = date;

                context.SaveChanges();
                MessageBox.Show("Данные успешно обновлены!");
            }
        }
    }
}
