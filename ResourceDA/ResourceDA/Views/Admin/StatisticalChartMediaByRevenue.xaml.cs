﻿using ResourceDA.ViewModels.Admin;
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

namespace ResourceDA.Views.Admin
{
    /// <summary>
    /// Interaction logic for StatisticalChartMediaByRevenue.xaml
    /// </summary>
    public partial class StatisticalChartMediaByRevenue : Window
    {
        public StatisticalChartMediaByRevenue()
        {
            InitializeComponent();
            DataContext = new StatisticalChartMediaByRevenueVM();
        }
    }
}
