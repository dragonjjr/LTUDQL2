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

namespace ResourceDA
{
    /// <summary>
    /// Interaction logic for TextBoxWithPlaceHolder.xaml
    /// </summary>
    public partial class TextBoxWithPlaceHolder : UserControl
    {
        public class register
        {
            public string Email { get; set; }

            public string Password { get; set; }

            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string CardNumber { get; set; }

            public string ExpirationDate { get; set; }

            public string SecurityCode { get; set; }
        }

        public TextBoxWithPlaceHolder()
        {
            InitializeComponent();
            DataContext = new register();
        }



        public string PlaceHolder
        {
            get { return (string)GetValue(PlaceHolderProperty); }
            set { SetValue(PlaceHolderProperty, value); }
        }

        // Using a DependencyProperty as the backing store for PlaceHolder.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty PlaceHolderProperty =
            DependencyProperty.Register("PlaceHolder", typeof(string), typeof(TextBoxWithPlaceHolder));





        public string Text
        {
            get { return (string)GetValue(TextProperty); }
            set { SetValue(TextProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Text.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty TextProperty =
            DependencyProperty.Register("Text", typeof(string), typeof(TextBoxWithPlaceHolder));
        public string getText
        {
            get { return email.Text; }
        }
        public bool IsPassword
        {
            get { return (bool)GetValue(IsPasswordProperty); }
            set { SetValue(IsPasswordProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsPassword.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPasswordProperty =
            DependencyProperty.Register("IsPassword", typeof(bool), typeof(TextBoxWithPlaceHolder));


        public bool IsFirstName
        {
            get { return (bool)GetValue(IsFirstNameProperty); }
            set { SetValue(IsFirstNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsPassword.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsFirstNameProperty =
            DependencyProperty.Register("IsFirstName", typeof(bool), typeof(TextBoxWithPlaceHolder));



        public bool IsLastName
        {
            get { return (bool)GetValue(IsLastNameProperty); }
            set { SetValue(IsLastNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsLastName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsLastNameProperty =
            DependencyProperty.Register("IsLastName", typeof(bool), typeof(TextBoxWithPlaceHolder));

        public bool IsCardNumber
        {
            get { return (bool)GetValue(IsCardNumberProperty); }
            set { SetValue(IsCardNumberProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsLastName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsCardNumberProperty =
            DependencyProperty.Register("IsCardNumber", typeof(bool), typeof(TextBoxWithPlaceHolder));




        public bool IsExpirationDate
        {
            get { return (bool)GetValue(IsExpirationDateProperty); }
            set { SetValue(IsExpirationDateProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsExpirationDate.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsExpirationDateProperty =
            DependencyProperty.Register("IsExpirationDate", typeof(bool), typeof(TextBoxWithPlaceHolder));



        public bool IsSecurityCode
        {
            get { return (bool)GetValue(IsSecurityCodeProperty); }
            set { SetValue(IsSecurityCodeProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsSecuritycode.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsSecurityCodeProperty =
            DependencyProperty.Register("IsSecurityCode", typeof(bool), typeof(TextBoxWithPlaceHolder));



        public bool IsEmail
        {
            get { return (bool)GetValue(IsEmailProperty); }
            set { SetValue(IsEmailProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsEmail.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsEmailProperty =
            DependencyProperty.Register("IsEmail", typeof(bool), typeof(TextBoxWithPlaceHolder));



        private void passbox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            email.Text = passbox.Password;
        }
    }
}
