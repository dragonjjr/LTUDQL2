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
using LiveCharts;
using LiveCharts.Wpf;
using ResourceDA.Models;
using ResourceDA.windownsCustom;

namespace ResourceDA.ViewModels.Admin
{

    class StatisticalChartMediaViewVM : DependencyObject, INotifyPropertyChanged
    {

        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        //public string[] Labels { get; set; }
        //public Func<double, string> Formatter { get; set; }
        public static readonly DependencyProperty seriesCollectionProperty;
        public static readonly DependencyProperty LabelsProperty;
        public static readonly DependencyProperty DsKindOfMediaProperty;
        // public static readonly DependencyProperty FormatterProperty;

        private ObservableCollection<String> valuesMonth = new ObservableCollection<string>()
        {
           "All", "1", "2", "3", "4", "5", "6","7", "8", "9" ,"10", "11", "12"
        };

        private ObservableCollection<String> valuesYear = new ObservableCollection<string>()
        {
            "2021", "2020" ,"2019","2018","2017"
        };

        public event PropertyChangedEventHandler PropertyChanged;

        static StatisticalChartMediaViewVM()
        {
            seriesCollectionProperty = DependencyProperty.Register("seriesCollection", typeof(SeriesCollection), typeof(StatisticalChartMediaViewVM));
            LabelsProperty = DependencyProperty.Register("Labels", typeof(string[]), typeof(StatisticalChartMediaViewVM));
            DsKindOfMediaProperty = DependencyProperty.Register("DsKindOfMedia", typeof(ListCollectionView), typeof(MediaManageViewVM));
            // FormatterProperty = DependencyProperty.Register("Formatter", typeof(Func<double, string>), typeof(StatisticalChartMediaViewVM));
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

        private string selectedValueMonth ;
        public string SelectedValueMonth
        {

            get { return selectedValueMonth; }
            set
            {
                if (selectedValueYear == null)
                {
                    selectedValueYear = "2020";
                }

                if (value == "All" && selectedValueYear == null)
                {
                    
                }else
                {
                    if (value != "All")
                    {
                        String[] arrName = new String[6];
                        int[] arrLikes = new int[6];

                        try
                        {
                            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                            {
                                var groupJoin = qLMEDIA.Media.GroupJoin(qLMEDIA.ListMediaLikes,  //inner sequence
                                            Med => Med.Id, //outerKeySelector 
                                            MediaLik => MediaLik.IdMedia, //innerKeySelector
                                            (Med, dataLikesGroup) => new // resultSelector 
                                        {
                                                datetimes = dataLikesGroup,
                                                MediaName = Med.Name,
                                                Mediaid = Med.Id
                                            }).ToList();

                                var ListMedia = groupJoin.OrderByDescending(s => s.datetimes.Where(m => m.Datatime.Value.Month == int.Parse(value) && m.Datatime.Value.Year == int.Parse(selectedValueYear)).Count()).Take(6)
                                    .Select(mediaa => new
                                    {
                                        mediName = mediaa.MediaName,
                                        mediLikes = mediaa.datetimes.Where(m => m.Datatime.Value.Month == int.Parse(value) && m.Datatime.Value.Year == int.Parse(selectedValueYear)).Count()
                                    }).ToList();


                                for (int i = 0; i < ListMedia.Count; i++)
                                {
                                    arrName[i] = ListMedia[i].mediName;
                                }
                                for (int i = 0; i < ListMedia.Count; i++)
                                {
                                    arrLikes[i] = (int)ListMedia[i].mediLikes;
                                }

                            }

                            setupChart(arrName, arrLikes);
                        }
                        catch (Exception ex)
                        {
                            MessTimeout w = new MessTimeout(ex.Message, 3000);
                            w.ShowDialog();
                        }
                    }
                    else
                    {
                        String[] arrName = new String[6];
                        int[] arrLikes = new int[6];

                        try
                        {
                            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                            {
                                var groupJoin = qLMEDIA.Media.GroupJoin(qLMEDIA.ListMediaLikes,  //inner sequence
                                            Med => Med.Id, //outerKeySelector 
                                            MediaLik => MediaLik.IdMedia, //innerKeySelector
                                            (Med, dataLikesGroup) => new // resultSelector 
                                            {
                                                datetimes = dataLikesGroup,
                                                MediaName = Med.Name,
                                                Mediaid = Med.Id
                                            }).ToList();

                                var ListMedia = groupJoin.OrderByDescending(s => s.datetimes.Where(m => m.Datatime.Value.Year == int.Parse(selectedValueYear)).Count()).Take(6)
                                    .Select(mediaa => new
                                    {
                                        mediName = mediaa.MediaName,
                                        mediLikes = mediaa.datetimes.Where(m =>  m.Datatime.Value.Year == int.Parse(selectedValueYear)).Count()
                                    }).ToList();


                                for (int i = 0; i < ListMedia.Count; i++)
                                {
                                    arrName[i] = ListMedia[i].mediName;
                                }
                                for (int i = 0; i < ListMedia.Count; i++)
                                {
                                    arrLikes[i] = (int)ListMedia[i].mediLikes;
                                }

                            }

                            setupChart(arrName, arrLikes);
                        }
                        catch (Exception ex)
                        {
                            MessTimeout w = new MessTimeout(ex.Message, 3000);
                            w.ShowDialog();
                        }
                    }
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

        private string selectedValueYear ;
        public string SelectedValueYear
        {

            get { return selectedValueYear; }
            set
            {
                if(selectedValueMonth == null)
                {
                    selectedValueMonth = "6";
                }

                if(selectedValueMonth == "All")
                {
                    String[] arrName = new String[6];
                    int[] arrLikes = new int[6];

                    try
                    {
                        using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                        {
                            var groupJoin = qLMEDIA.Media.GroupJoin(qLMEDIA.ListMediaLikes,  //inner sequence
                                        Med => Med.Id, //outerKeySelector 
                                        MediaLik => MediaLik.IdMedia, //innerKeySelector
                                        (Med, dataLikesGroup) => new // resultSelector 
                                    {
                                            datetimes = dataLikesGroup,
                                            MediaName = Med.Name,
                                            Mediaid = Med.Id
                                        }).ToList();


                            var ListMedia = groupJoin.OrderByDescending(s => s.datetimes.Where(m => m.Datatime.Value.Year == int.Parse(value)).Count()).Take(6)
                               .Select(mediaa => new
                               {
                                   mediName = mediaa.MediaName,
                                   mediLikes = mediaa.datetimes.Where(m => m.Datatime.Value.Year == int.Parse(value)).Count()
                               }).ToList();


                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrName[i] = ListMedia[i].mediName;
                            }
                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrLikes[i] = (int)ListMedia[i].mediLikes;
                            }

                        }

                        setupChart(arrName, arrLikes);
                    }
                    catch (Exception ex)
                    {
                        MessTimeout w = new MessTimeout(ex.Message, 3000);
                        w.ShowDialog();
                    }
                }
                else
                {
                    String[] arrName = new String[6];
                    int[] arrLikes = new int[6];

                    try
                    {
                        using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                        {
                            var groupJoin = qLMEDIA.Media.GroupJoin(qLMEDIA.ListMediaLikes,  //inner sequence
                                        Med => Med.Id, //outerKeySelector 
                                        MediaLik => MediaLik.IdMedia, //innerKeySelector
                                        (Med, dataLikesGroup) => new // resultSelector 
                                    {
                                            datetimes = dataLikesGroup,
                                            MediaName = Med.Name,
                                            Mediaid = Med.Id
                                        }).ToList();


                            var ListMedia = groupJoin.OrderByDescending(s => s.datetimes.Where(m => m.Datatime.Value.Month == int.Parse(selectedValueMonth)
                            && m.Datatime.Value.Year == int.Parse(value)).Count()).Take(6)
                               .Select(mediaa => new
                               {
                                   mediName = mediaa.MediaName,
                                   mediLikes = mediaa.datetimes.Where(m => m.Datatime.Value.Month == int.Parse(selectedValueMonth)
                            && m.Datatime.Value.Year == int.Parse(value)).Count()
                               }).ToList();


                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrName[i] = ListMedia[i].mediName;
                            }
                            for (int i = 0; i < ListMedia.Count; i++)
                            {
                                arrLikes[i] = (int)ListMedia[i].mediLikes;
                            }

                        }

                        setupChart(arrName, arrLikes);
                    }
                    catch (Exception ex)
                    {
                        MessTimeout w = new MessTimeout(ex.Message, 3000);
                        w.ShowDialog();
                    }
                }

                selectedValueYear = value;
                OnPropertyChanged();
            }
        }

        private void setupChart(String[] arrName, int[] arrLikes)
        {
            seriesCollection = new SeriesCollection
                {
                    new ColumnSeries
                    {
                        Title = "Like",
                        Values = new ChartValues<int>(arrLikes)
                    }
                };

            Labels = arrName;
            // Formatter = value => value.ToString();
        }

        public ListCollectionView DsKindOfMedia
        {
            get => (ListCollectionView)GetValue(DsKindOfMediaProperty);
            set => SetValue(DsKindOfMediaProperty, value);
        }

        public SeriesCollection seriesCollection{
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



        public StatisticalChartMediaViewVM()
        {
           

            try
            {
                using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                {
                    DsKindOfMedia = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
                    
                }

                DsKindOfMedia.CurrentChanged += (_, e) =>
                {
                    var KindOfMediaCur = DsKindOfMedia.CurrentItem as KindOfVideo;
                    KindOfVideo = new KindOfVideo
                    {
                        Id = KindOfMediaCur.Id,
                        Name = KindOfMediaCur.Name
                    };

                    string[] arrName = new string[6];
                    int[] arrLikes = new int[6];

                    using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                    {
                        var ListMedia = qLMEDIA.Media.Where(m => m.Genre == KindOfMediaCur.Id).OrderByDescending(s => s.Likes).Take(6).ToList();

                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrName[i] = ListMedia[i].Name.ToString();
                        }
                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrLikes[i] = (int)ListMedia[i].Likes;
                        }
                    }

                    setupChart(arrName, arrLikes);
                    

                };

                //// hehe load lại .
                //DsKindOfMedia.Refresh();

                
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }

            String[] arrName1 = new String[6];
            int[] arrLikes1 = new int[6];

            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                var ListMedia = qLMEDIA.Media.OrderByDescending(s => s.Likes).Take(6).ToList();

                for (int i = 0; i < ListMedia.Count; i++)
                {
                    arrName1[i] = ListMedia[i].Name.ToString();
                }
                for (int i = 0; i < ListMedia.Count; i++)
                {
                    arrLikes1[i] = (int)ListMedia[i].Likes;
                }

            }

            setupChart(arrName1, arrLikes1);
        }
    }
}
