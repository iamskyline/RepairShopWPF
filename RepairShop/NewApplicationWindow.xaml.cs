using RepairShop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Application = RepairShop.Model.Application;

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
                performerComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Performer.Select(performer => performer.Tel).ToList();
                priorityComboBox.ItemsSource = RepairShopEntities.GetContext()
                    .Priority_type.Select(type => type.Type_name).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузить данные " +
                    $"в списки выбора: {ex.Message}");
            }
        }

        private void createApplicationBtn_Click(object sender, RoutedEventArgs e)
        {
            FormNewApplication();
        }

        private void FormNewApplication()
        {
            StringBuilder errors = CheckValidData();
            if (errors.Length == 0)
            {
                try
                {
                    using (var context = new RepairShopEntities())
                    {
                        var equiment = RepairShopEntities.GetContext().Equipment_type.FirstOrDefault(t => t.Type_name == equipmentComboBox.Text);
                        var status = RepairShopEntities.GetContext().Application_statuses.FirstOrDefault(s => s.Status_name == statusComboBox.Text);
                        var performer = RepairShopEntities.GetContext().Performer.FirstOrDefault(p => p.Tel == performerComboBox.Text);
                        var client = RepairShopEntities.GetContext().Client.FirstOrDefault(c => c.Tel == clientComboBox.Text);
                        var priotity = RepairShopEntities.GetContext().Priority_type.FirstOrDefault(p => p.Type_name == priorityComboBox.Text);
                        var malfunction = RepairShopEntities.GetContext().Malfunction_type.FirstOrDefault(m => m.Type_name == malfunctionComboBox.Text);

                        var newApplication = new Application
                        {
                            Equipment_type_ID = equiment.ID,
                            Application_status_ID = status.ID,
                            Performer_ID = performer.ID,
                            Issue = new Issue 
                            {
                                Description = issueDescriptionTextBox.Text
                            },
                            Client_ID = client.ID,
                            Priority_type_ID = priotity.ID,
                            Equipment_serial_number = serialNumberTextBox.Text,
                            Malfunction_type_ID = malfunction.ID
                        };
                        context.Application.Add(newApplication);
                        context.SaveChanges();
                        MessageBox.Show("Новая заявка успешно создана!",
                            "Заявка успешно создана", MessageBoxButton.OK,
                            MessageBoxImage.Information);
                        this.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else MessageBox.Show($"При заполнении формы заявки " +
                $"произошли следующие проблемы:\n\n{errors}", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private StringBuilder CheckValidData()
        {
            StringBuilder errors = new StringBuilder();

            if (equipmentComboBox.SelectedItem == null) { errors.AppendLine("Выберите тип оборудования!"); }
            if (malfunctionComboBox.SelectedItem == null) { errors.AppendLine("Выберите тип неисправности!"); }
            if (clientComboBox.SelectedItem == null) { errors.AppendLine("Выберите клиента!"); }
            if (performerComboBox.SelectedItem == null) { errors.AppendLine("Выберите мастера!"); }
            if (priorityComboBox.SelectedItem == null) { errors.AppendLine("Выберите тип приоритета!"); }
            if (statusComboBox.SelectedItem == null) { errors.AppendLine("Выберите статус заявки!"); }
            if (issueDescriptionTextBox.Text.Length == 0) { errors.AppendLine("Напишите описание проблемы!"); }
            if (serialNumberTextBox.Text.Length == 0) { errors.AppendLine("Введите серийный номер оборудования!"); }
            string input = serialNumberTextBox.Text;
            bool isNumeric = int.TryParse(input, out _);
            if (input.Length > 0 && !isNumeric){ errors.AppendLine("Серийный номер должен содержать только цифры!"); }

            return errors;
        }

        private void getBackBtn_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы действительно хотите вернуться назад?" +
                "\nВведенные данные будут утеряны!", 
                "Закрыть окно создания заявки", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes){ this.Close(); }
        }
    }
}
