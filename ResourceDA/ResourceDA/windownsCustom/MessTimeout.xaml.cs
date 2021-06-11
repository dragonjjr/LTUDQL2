using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ResourceDA.windownsCustom
{
    /// <summary>
    /// Interaction logic for MessTimeout.xaml
    /// </summary>
    public partial class MessTimeout : Window
    {
        string message;
        long timeCountdown;
        public MessTimeout(string mess, long time)
        {
            message = mess;
            timeCountdown = time;
            InitializeComponent();
            txMess.Text = message;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Timer t = new Timer();
            t.Interval = timeCountdown;
            t.Elapsed += new ElapsedEventHandler(t_Elapsed);
            t.Start();
        }

        void t_Elapsed(object sender, ElapsedEventArgs e)
        {
            this.Dispatcher.Invoke(new Action(() =>
            {
                this.Close();
            }), null);
        }
    }

}
