using LiveCharts;
using LiveCharts.Wpf;
using ResourceDA.Models;
using ResourceDA.windownsCustom;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace ResourceDA.ViewModels.Admin
{
    class StatisticalChartMediaByRevenueVM : DependencyObject, INotifyPropertyChanged
    {

        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        //public string[] Labels { get; set; }
        //public Func<double, string> Formatter { get; set; }
        public static readonly DependencyProperty seriesCollectionProperty;
        public static readonly DependencyProperty LabelsProperty;
        // public static readonly DependencyProperty FormatterProperty;

        private ObservableCollection<String> valuesMonth = new ObservableCollection<string>()
        {
          "1", "2", "3", "4", "5", "6","7", "8", "9" ,"10", "11", "12"
        };

        private ObservableCollection<String> valuesYear = new ObservableCollection<string>()
        {
            "2021", "2020" ,"2019","2018","2017"
        };

        public event PropertyChangedEventHandler PropertyChanged;

        static StatisticalChartMediaByRevenueVM()
        {
            seriesCollectionProperty = DependencyProperty.Register("seriesCollection", typeof(SeriesCollection), typeof(StatisticalChartMediaByRevenueVM));
            LabelsProperty = DependencyProperty.Register("Labels", typeof(string[]), typeof(StatisticalChartMediaByRevenueVM));
            // FormatterProperty = DependencyProperty.Register("Formatter", typeof(Func<double, string>), typeof(StatisticalChartMediaByRevenueVM));
        }

        public ObservableCollection<string> ValuesMonth
        {
            get { return valuesMonth; }
            set
            {
                valuesMonth = value;
                OnPropertyChanged();
            }
        }

        private string selectedValueMonth;
        public string SelectedValueMonth
        {

            get { return selectedValueMonth; }
            set
            {
                if (selectedValueYear == null)
                {
                    selectedValueYear = "2020";
                }

                int yearcur = int.Parse(selectedValueYear);
                int monthcur = int.Parse(value);

                try
                {
                    using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                    {
                        
                        var ListMedia = qLMEDIA.PaymentHistories.Where(p => p.Date.Year == yearcur && p.Date.Month == monthcur)
                                       .GroupBy(l => new { l.Date.Day })
                                       .Select(cl => new
                                       {
                                           date = cl.Key,
                                           money = cl.Sum(c => c.Money),
                                       }).ToList();

                        String[] arrName1 = new String[ListMedia.Count];
                        int[] arrLikes1 = new int[ListMedia.Count];

                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrName1[i] = ListMedia[i].date.ToString();
                        }
                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrLikes1[i] = (int)ListMedia[i].money;
                        }

                        setupChart(arrName1, arrLikes1);
                    }
                }
                catch (Exception ex)
                {
                    MessTimeout w = new MessTimeout(ex.Message, 3000);
                    w.ShowDialog();
                }

                selectedValueMonth = value;
                OnPropertyChanged();
            }  
        }

        public ObservableCollection<string> ValuesYear
        {
            get { return valuesYear; }
            set
            {
                valuesMonth = value;
                OnPropertyChanged();
            }
        }

        private string selectedValueYear;
        public string SelectedValueYear
        {

            get { return selectedValueYear; }
            set
            {
                int yearcur = int.Parse(value);
                    try
                    {
                        using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                        {
                            //var ListMedia = qLMEDIA.Media.OrderByDescending(s => s.Likes).Take(40).ToList();
                            //var ListMedia = qLMEDIA.PaymentHistories.ToList();
                            var ListMedia = qLMEDIA.PaymentHistories.Where(p => p.Date.Year == yearcur)
                                           .GroupBy(l => new {/* l.Date.Year,*/ l.Date.Month })
                                           .Select(cl => new
                                           {
                                               date = cl.Key,
                                               money = cl.Sum(c => c.Money),
                                           }).ToList();

                            String[] arrName1 = new String[ListMedia.Count];
                            int[] arrLikes1 = new int[ListMedia.Count];

                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrName1[i] = ListMedia[i].date.ToString();
                            }
                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrLikes1[i] = (int)ListMedia[i].money;
                            }

                            setupChart(arrName1, arrLikes1);
                        }
                    }
                    catch (Exception ex)
                    {
                        MessTimeout w = new MessTimeout(ex.Message, 3000);
                        w.ShowDialog();
                    }
                selectedValueYear = value;
                OnPropertyChanged();
            }
        }

        private void setupChart(String[] arrName, int[] arrLikes)
        {
            seriesCollection = new SeriesCollection
                {
                    new LineSeries
                    {
                        Title = "Like",
                        Values = new ChartValues<int>(arrLikes),
                        Fill = System.Windows.Media.Brushes.DarkRed
                    }
                };

            Labels = arrName;
        }



        public SeriesCollection seriesCollection
        {
            get => (SeriesCollection)GetValue(seriesCollectionProperty);
            set => SetValue(seriesCollectionProperty, value);
        }

        public string[] Labels
        {
            get => (string[])GetValue(LabelsProperty);
            set => SetValue(LabelsProperty, value);
        }
        public KindOfVideo KindOfVideo { get; private set; }

        //public Func<double, string> Formatter
        //{
        //    get => (Func<double, string>)GetValue(FormatterProperty);
        //    set => SetValue(FormatterProperty, value);
        //}



        public StatisticalChartMediaByRevenueVM()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                //var ListMedia = qLMEDIA.Media.OrderByDescending(s => s.Likes).Take(40).ToList();
                //var ListMedia = qLMEDIA.PaymentHistories.ToList();
                 var ListMedia = qLMEDIA.PaymentHistories.Where(p => p.Date.Year == 2020)
                                .GroupBy(l => new {/* l.Date.Year,*/ l.Date.Month })
                                .Select(cl => new 
                                {
                                    date = cl.Key,
                                    money = cl.Sum(c => c.Money),
                                }).ToList();

                String[] arrName1 = new String[ListMedia.Count];
                int[] arrLikes1 = new int[ListMedia.Count];

                for (int i = 0; i < ListMedia.Count; i++)
                {
                    arrName1[i] = ListMedia[i].date.ToString();
                }
                for (int i = 0; i < ListMedia.Count; i++)
                {
                    arrLikes1[i] = (int)ListMedia[i].money;
                }

                setupChart(arrName1, arrLikes1);
            }

        }
    }
}
