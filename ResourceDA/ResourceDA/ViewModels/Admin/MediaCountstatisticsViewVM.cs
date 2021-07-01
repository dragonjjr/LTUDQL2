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
    class MediaCountstatisticsViewVM: DependencyObject, INotifyPropertyChanged
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

        public static readonly DependencyProperty DsKindOfMediaaProperty;

        public ListCollectionView DsKindOfMediaa
        {
            get => (ListCollectionView)GetValue(DsKindOfMediaaProperty);
            set => SetValue(DsKindOfMediaaProperty, value);
        }

        private ObservableCollection<String> valuesIMDBOutgrow = new ObservableCollection<string>()
        {
          "1", "2", "3", "4", "5", "6","7", "8", "9" 
        };

        public event PropertyChangedEventHandler PropertyChanged;

        static MediaCountstatisticsViewVM()
        {
            seriesCollectionProperty = DependencyProperty.Register("seriesCollection", typeof(SeriesCollection), typeof(MediaCountstatisticsViewVM));
            LabelsProperty = DependencyProperty.Register("Labels", typeof(string[]), typeof(MediaCountstatisticsViewVM));
            DsKindOfMediaaProperty = DependencyProperty.Register("DsKindOfMediaa", typeof(ListCollectionView), typeof(MediaManageViewVM));
            // FormatterProperty = DependencyProperty.Register("Formatter", typeof(Func<double, string>), typeof(MediaCountstatisticsViewVM));
        }

        public ObservableCollection<string> ValuesIMDBOutgrow
        {
            get { return valuesIMDBOutgrow; }
            set
            {
                valuesIMDBOutgrow = value;
                OnPropertyChanged();
            }
        }

        private string selectedValueIMDBOutgrow;
        public string SelectedValueIMDBOutgrow
        {

            get { return selectedValueIMDBOutgrow; }
            set
            {

                int IMDBOutgrowcur = int.Parse(value);
                var KindOfMediaCur = DsKindOfMediaa.CurrentItem as KindOfVideo;

                try
                {
                    using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                    {
                        var groupJoin = qLMEDIA.Media.Where(p => p.Genre == KindOfMediaCur.Id && p.IMDB >= IMDBOutgrowcur)
                                    .GroupJoin(qLMEDIA.ListMediaViews,  //inner sequence
                                            Med => Med.Id, //outerKeySelector 
                                            MediaVie => MediaVie.IdMedia, //innerKeySelector
                                            (Med, dataViewGroup) => new // resultSelector 
                                            {
                                                sumView = dataViewGroup.Sum(x => x.Views),
                                                MediaName = Med.Name
                                            }).ToList();

                        var ListMedia = groupJoin.OrderByDescending(s => s.sumView).ToList();

                        String[] arrName1 = new String[ListMedia.Count];
                        int[] arrLikes1 = new int[ListMedia.Count];

                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrName1[i] = ListMedia[i].MediaName;
                        }
                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            if (ListMedia[i].sumView != null)
                            {
                                arrLikes1[i] = (int)(int)ListMedia[i].sumView;
                            }
                            else
                            {
                                arrLikes1[i] = 0;
                            }

                        }

                        setupChart(arrName1, arrLikes1);
                    }
                }
                catch (Exception ex)
                {
                    MessTimeout w = new MessTimeout(ex.Message, 3000);
                    w.ShowDialog();
                }

                selectedValueIMDBOutgrow = value;
                OnPropertyChanged();
            }
        }


     
     
        private void setupChart(String[] arrName, int[] arrLikes)
        {
            seriesCollection = new SeriesCollection
                {
                    new ColumnSeries
                    {
                        Title = "View",
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

        public MediaCountstatisticsViewVM()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DsKindOfMediaa = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
                
            }

            DsKindOfMediaa.CurrentChanged += (_, e) =>
            {
                if ((DsKindOfMediaa.CurrentItem as KindOfVideo).Id == -1)
                {

                }
                else
                {
                    var KindOfMediaCur = DsKindOfMediaa.CurrentItem as KindOfVideo;
                    KindOfVideo = new KindOfVideo
                    {
                        Id = KindOfMediaCur.Id,
                        Name = KindOfMediaCur.Name
                    };

                    if (selectedValueIMDBOutgrow == null)
                    {
                        selectedValueIMDBOutgrow = "1";
                    }
                    int IMDBOutgrow = int.Parse(selectedValueIMDBOutgrow);

                    using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                    {
                        var groupJoin = qLMEDIA.Media.Where(p => p.Genre == KindOfMediaCur.Id && p.IMDB >= IMDBOutgrow)
                                    .GroupJoin(qLMEDIA.ListMediaViews,  //inner sequence
                                            Med => Med.Id, //outerKeySelector 
                                            MediaVie => MediaVie.IdMedia, //innerKeySelector
                                            (Med, dataViewGroup) => new // resultSelector 
                                            {
                                                sumView = dataViewGroup.Sum(x => x.Views),
                                                MediaName = Med.Name
                                            }).ToList();

                        var ListMedia = groupJoin.OrderByDescending(s => s.sumView).ToList();

                        String[] arrName1 = new String[ListMedia.Count];
                        int[] arrLikes1 = new int[ListMedia.Count];

                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            arrName1[i] = ListMedia[i].MediaName;
                        }
                        for (int i = 0; i < ListMedia.Count; i++)
                        {
                            if (ListMedia[i].sumView != null)
                            {
                                arrLikes1[i] = (int)(int)ListMedia[i].sumView;
                            }
                            else
                            {
                                arrLikes1[i] = 0;
                            }

                        }

                        setupChart(arrName1, arrLikes1);
                    }
                }
            };

        }
    }
}
