using ResourceDA.Command;
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
using System.Windows.Input;

namespace ResourceDA.ViewModels.Admin
{
    class MediaManageViewVM : DependencyObject, INotifyPropertyChanged
    {
        public static readonly DependencyProperty DsMediaProperty;
        public static readonly DependencyProperty DsKindOfVideoAddProperty;
        public static readonly DependencyProperty MediaProperty;
        public static readonly DependencyProperty MediaNewProperty;
        public static readonly DependencyProperty DsKindOfMediaProperty;

        // commbox
        private ObservableCollection<String> valuesIMDB = new ObservableCollection<string>()
        {
            "1", "2", "3", "4", "5", "6","7", "8", "9"
        };

        public event PropertyChangedEventHandler PropertyChanged;
        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ObservableCollection<string> ValuesIMDB
        {
            get { return valuesIMDB; }
            set
            {
                valuesIMDB = value;
                OnPropertyChanged();
            }
        }

        private string selectedValueIMDB;
        public string SelectedValueIMDB
        {
            get { return selectedValueIMDB; }
            set
            {
                double outGrow = double.Parse(value);
                //MessTimeout w = new MessTimeout(value, 1000);
                //w.ShowDialog();
                using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                {
                    DSMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.FileFormat == "MEDIA" && medi.IMDB >= outGrow).ToList());
                    DSMedia.CurrentChanged += (obj, e1) =>
                    {
                        var MediaCur = DSMedia.CurrentItem as Medium;
                        Media = new Medium
                        {
                            Id = MediaCur.Id,
                            Name = MediaCur.Name,
                            Describe = MediaCur.Describe,
                            Time = MediaCur.Time,
                            Directors = MediaCur.Directors,
                            Source = MediaCur.Source,
                            PostedDate = MediaCur.PostedDate,
                            TypeMedia = MediaCur.TypeMedia,
                            Actor = MediaCur.Actor,
                            Genre = MediaCur.Genre,
                            IMDB = MediaCur.IMDB
                        };
                    };
                }

                selectedValueIMDB = value;
                OnPropertyChanged();
            }
        }

        public ICommand CmdUpdateMedia { get; }
        public ICommand CmdDeleteMedia { get; }
        public ICommand CmdAddMedia { get; }
        public ICommand CmdCriteriaKindOfMedia { get; }
        public ICommand CmdCriteriaMediaNone { get; }


        static MediaManageViewVM()
        {
            DsMediaProperty = DependencyProperty.Register("DSMedia", typeof(ListCollectionView), typeof(MediaManageViewVM));
            DsKindOfVideoAddProperty = DependencyProperty.Register("DSKindOfVideoAdd", typeof(ListCollectionView), typeof(MediaManageViewVM));
            MediaProperty = DependencyProperty.Register("Media", typeof(Medium), typeof(MediaManageViewVM));
            MediaNewProperty = DependencyProperty.Register("MediaNew", typeof(Medium), typeof(MediaManageViewVM));
            DsKindOfMediaProperty = DependencyProperty.Register("DsKindOfMedia", typeof(ListCollectionView), typeof(MediaManageViewVM));
        }

        public ListCollectionView DSMedia
        {
            get => (ListCollectionView)GetValue(DsMediaProperty);
            set => SetValue(DsMediaProperty, value);
        }
        public ListCollectionView DSKindOfVideoAdd
        {
            get => (ListCollectionView)GetValue(DsKindOfVideoAddProperty);
            set => SetValue(DsKindOfVideoAddProperty, value);
        }

        public Medium Media
        {
            get => (Medium)GetValue(MediaProperty);
            set => SetValue(MediaProperty, value);
        }
        public Medium MediaNew
        {
            get => (Medium)GetValue(MediaNewProperty);
            set => SetValue(MediaNewProperty, value);
        }

        public ListCollectionView DsKindOfMedia
        {
            get => (ListCollectionView)GetValue(DsKindOfMediaProperty);
            set => SetValue(DsKindOfMediaProperty, value);
        }
        public KindOfVideo KindOfVideo { get; private set; }

        public MediaManageViewVM()
        {
            CmdUpdateMedia = new RelayCommand<object>(UpdateMedia);
            CmdDeleteMedia = new RelayCommand<object>(DeleteMedia);
            CmdAddMedia = new RelayCommand<object>(AddMedia);
            CmdCriteriaKindOfMedia = new RelayCommandNoParameter(reloadKindOfMedia);
            CmdCriteriaMediaNone = new RelayCommandNoParameter(reloadMediaNone);

            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DsKindOfMedia = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
                DSKindOfVideoAdd = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
            }

            DsKindOfMedia.CurrentChanged += (_, e) =>
            {
                var KindOfMediaCur = DsKindOfMedia.CurrentItem as KindOfVideo;
                KindOfVideo = new KindOfVideo
                {
                    Id = KindOfMediaCur.Id,
                    Name = KindOfMediaCur.Name
                };

                using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                {
                    DSMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.FileFormat == "MEDIA" && medi.Genre == KindOfMediaCur.Id).ToList());
                    DSMedia.CurrentChanged += (obj, e1) =>
                    {
                        var MediaCur = DSMedia.CurrentItem as Medium;
                        Media = new Medium
                        {
                            Id = MediaCur.Id,
                            Name = MediaCur.Name,
                            Describe = MediaCur.Describe,
                            Time = MediaCur.Time,
                            Directors = MediaCur.Directors,
                            Source = MediaCur.Source,
                            PostedDate = MediaCur.PostedDate,
                            TypeMedia = MediaCur.TypeMedia,
                            Actor = MediaCur.Actor,
                            Genre = MediaCur.Genre,
                            IMDB = MediaCur.IMDB
                        };
                    };
                }
            };

            // hehe load lại .
            DsKindOfMedia.Refresh();

            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.FileFormat == "MEDIA").ToList());
                DSMedia.CurrentChanged += (obj, e) =>
                {
                    var MediaCur = DSMedia.CurrentItem as Medium;
                    Media = new Medium
                    {
                        Id = MediaCur.Id,
                        Name = MediaCur.Name,
                        Describe = MediaCur.Describe,
                        Time = MediaCur.Time,
                        Directors = MediaCur.Directors,
                        Source = MediaCur.Source,
                        PostedDate = MediaCur.PostedDate,
                        TypeMedia = MediaCur.TypeMedia,
                        Actor = MediaCur.Actor,
                        Genre = MediaCur.Genre,
                        IMDB = MediaCur.IMDB
                    };
                };
            }

            MediaNew = new Medium();
            MediaNew.PostedDate = DateTime.Now;
            
        }

        void reloadKindOfMedia()
        {
            //using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            //{
            //    DsKindOfMedia = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
            //    DSKindOfVideoAdd = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
            //}

            //DsKindOfMedia.CurrentChanged += (_, e) =>
            //{
            //    var KindOfMediaCur = DsKindOfMedia.CurrentItem as KindOfVideo;
            //    KindOfVideo = new KindOfVideo
            //    {
            //        Id = KindOfMediaCur.Id,
            //        Name = KindOfMediaCur.Name
            //    };

            //    using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            //    {
            //        DSMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.FileFormat == "MEDIA" && medi.Genre == KindOfMediaCur.Id ).ToList());
            //        DSMedia.CurrentChanged += (obj, e1) =>
            //        {
            //            var MediaCur = DSMedia.CurrentItem as Medium;
            //            Media = new Medium
            //            {
            //                Id = MediaCur.Id,
            //                Name = MediaCur.Name,
            //                Describe = MediaCur.Describe,
            //                Time = MediaCur.Time,
            //                Directors = MediaCur.Directors,
            //                Source = MediaCur.Source,
            //                PostedDate = MediaCur.PostedDate,
            //                TypeMedia = MediaCur.TypeMedia,
            //                Actor = MediaCur.Actor
            //                  Genre = MediaCur.Genre
            //            };
            //        };
            //    }
            //};
        }

        void reloadMediaNone()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.FileFormat == "MEDIA").ToList());
                DSMedia.CurrentChanged += (obj, e) =>
                {
                    var MediaCur = DSMedia.CurrentItem as Medium;
                    Media = new Medium
                    {
                        Id = MediaCur.Id,
                        Name = MediaCur.Name,
                        Describe = MediaCur.Describe,
                        Time = MediaCur.Time,
                        Directors = MediaCur.Directors,
                        Source = MediaCur.Source,
                        PostedDate = MediaCur.PostedDate,
                        TypeMedia = MediaCur.TypeMedia,
                        Actor = MediaCur.Actor,
                        Genre = MediaCur.Genre,
                        IMDB = MediaCur.IMDB
                    };
                };
            }
        }

        void UpdateMedia(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var MediaUpdate = qLMEDIA.Media.Single(medi => medi.Id == Media.Id);
                MediaUpdate.Describe = Media.Describe;
                MediaUpdate.Time = Media.Time;
                MediaUpdate.Name = Media.Name;
                MediaUpdate.Directors = Media.Directors;
                MediaUpdate.Source = Media.Source;
                MediaUpdate.PostedDate = Media.PostedDate;
                MediaUpdate.TypeMedia = Media.TypeMedia;
                MediaUpdate.Actor = Media.Actor;
                MediaUpdate.Genre = Media.Genre;
                MediaUpdate.IMDB = Media.IMDB;
                //try
                //{
                //    qLMEDIA.SaveChanges();
                //}
                //catch (System.Data.Entity.Validation.DbEntityValidationException ex)
                //{
                //    foreach (var entityValidationErrors in ex.EntityValidationErrors)
                //    {
                //        foreach (var validationError in entityValidationErrors.ValidationErrors)
                //        {
                //            System.Diagnostics.Debug.WriteLine("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                //        }
                //    }
                //}
                qLMEDIA.SaveChanges();

                var MediaCur = DSMedia.CurrentItem as Medium;
                MediaCur.Describe = Media.Describe;
                MediaCur.Time = Media.Time;
                MediaCur.Name = Media.Name;
                MediaCur.Directors = Media.Directors;
                MediaCur.Source = Media.Source;
                MediaCur.PostedDate = Media.PostedDate;
                MediaCur.TypeMedia = Media.TypeMedia;
                MediaCur.Actor = Media.Actor;
                MediaUpdate.Genre = Media.Genre;
                MediaUpdate.IMDB = Media.IMDB;

                MessTimeout w = new MessTimeout("Update success ! ", 1000);
                w.ShowDialog();
            }
        }

        void DeleteMedia(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var MediaDel = qLMEDIA.Media.FirstOrDefault(medi => medi.Id == Media.Id);
                qLMEDIA.Media.Remove(MediaDel);
                qLMEDIA.SaveChanges();

                int index = DSMedia.IndexOf(DSMedia.CurrentItem);
                DSMedia.MoveCurrentToFirst();
                DSMedia.CancelEdit();
                DSMedia.RemoveAt(index);

                // MessageBox.Show("delete succ" + MediaDel.UserName);

                MessTimeout w = new MessTimeout("Delete success :" + MediaDel.Name, 1000);
                w.ShowDialog();

            }
        }

        void AddMedia(object obj)
        {
            KindOfVideo KindOfVideoAddCur = DSKindOfVideoAdd.CurrentItem as KindOfVideo;
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                MediaNew.FileFormat = "MEDIA";
                MediaNew.Genre = KindOfVideoAddCur.Id;

                qLMEDIA.Media.Add(MediaNew);
                qLMEDIA.SaveChanges();

                DSMedia.AddNewItem(MediaNew);
                DSMedia.CommitNew();
                MessTimeout w = new MessTimeout("Add success : " + MediaNew.Name, 1000);
                w.ShowDialog();
                MediaNew = new Medium();
                MediaNew.PostedDate = DateTime.Now;

            }
        }
    }
}
