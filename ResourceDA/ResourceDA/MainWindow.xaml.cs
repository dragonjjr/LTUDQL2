using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace ResourceDA
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public class EmailCheck
        {
            public string Email { get; set; }
            public string Password { get; set; }
        }
        public MainWindow()
        {
            
            InitializeComponent();
            
            this.DataContext = new EmailCheck();
            
        }

        private void btnShowSignIn_Click(object sender, RoutedEventArgs e)
        {
            GridMain.Visibility = Visibility.Collapsed;

            GridPhu.Visibility = Visibility.Visible;
            
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtEmail.Focus();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            GridMain.Visibility = Visibility.Visible;
            GridMainHome.Visibility = Visibility.Visible;
            GridMainStep1.Visibility = Visibility.Collapsed;
            GridDangKy.Visibility = Visibility.Collapsed;
            GridPhu.Visibility = Visibility.Collapsed;
        }

        private void btnSignIn_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("a");
        }

        private void txtPassword_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            BindingExpression be = txtPassword.GetBindingExpression(TextBox.TextProperty);
            be.UpdateSource();
        }

        private void txtEmail_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            BindingExpression be = txtEmail.GetBindingExpression(TextBox.TextProperty);
            be.UpdateSource();
        }

        private void btnGetStarted_Click(object sender, RoutedEventArgs e)
        {
            GridMainStep1.Visibility = Visibility.Visible;
            GridMainHome.Visibility = Visibility.Collapsed;
        }

        private void btnContinue_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(txtEmailDangKy.getText);
            MessageBox.Show(txtPassDangKy.getText);
        }

        private void btnSeethePlans_Click(object sender, RoutedEventArgs e)
        {
            GridMainStep1.Visibility = Visibility.Collapsed;
            GridDangKy.Visibility = Visibility.Visible;
        }
    }
}
