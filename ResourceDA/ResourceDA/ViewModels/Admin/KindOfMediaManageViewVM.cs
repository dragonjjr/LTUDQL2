using ResourceDA.Command;
using ResourceDA.Models;
using ResourceDA.windownsCustom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;

namespace ResourceDA.ViewModels.Admin
{
    class KindOfMediaManageViewVM: DependencyObject
    {
        public static readonly DependencyProperty DsMediaProperty;
        public static readonly DependencyProperty DsMediaOtherProperty;
        public static readonly DependencyProperty DsKindOfMediaProperty;
        public static readonly DependencyProperty KindOfVideoProperty;

        public ICommand CmdUpdateKindOfVideo { get; }
        public ICommand CmdAddKindOfVideo { get; }
        public ICommand CmdDeleteKindOfVideo { get; }
        public ICommand CmdAddMediaToKindOfVideo { get; }
        public ICommand CmdRemoveMediaToKindOfVideo { get; }


        static KindOfMediaManageViewVM()
        {
            DsMediaProperty = DependencyProperty.Register("DsMedia", typeof(ListCollectionView), typeof(KindOfMediaManageViewVM));
            DsMediaOtherProperty = DependencyProperty.Register("DsMediaOther", typeof(ListCollectionView), typeof(KindOfMediaManageViewVM));
            DsKindOfMediaProperty = DependencyProperty.Register("DsKindOfMedia", typeof(ListCollectionView), typeof(KindOfMediaManageViewVM));
            KindOfVideoProperty = DependencyProperty.Register("KindOfVideo", typeof(KindOfVideo), typeof(KindOfMediaManageViewVM));
        }

        public ListCollectionView DsMedia
        {
            get => (ListCollectionView)GetValue(DsMediaProperty);
            set => SetValue(DsMediaProperty, value);
        }

        public ListCollectionView DsMediaOther
        {
            get => (ListCollectionView)GetValue(DsMediaOtherProperty);
            set => SetValue(DsMediaOtherProperty, value);
        }

        public ListCollectionView DsKindOfMedia
        {
            get => (ListCollectionView)GetValue(DsKindOfMediaProperty);
            set => SetValue(DsKindOfMediaProperty, value);
        }
       
        public KindOfVideo KindOfVideo
        {
            get => (KindOfVideo)GetValue(KindOfVideoProperty);
            set => SetValue(KindOfVideoProperty, value);
        }



        public KindOfMediaManageViewVM()
        {
            CmdAddKindOfVideo = new RelayCommand<object>(AddKindOfVideo);
            CmdDeleteKindOfVideo = new RelayCommand<object>(DeleteKindOfVideo);
            CmdUpdateKindOfVideo = new RelayCommand<string>(UpdateKindOfVideo);
            CmdRemoveMediaToKindOfVideo = new RelayCommand<Int32>(RemoveMediaToKindOfVideo);
            CmdAddMediaToKindOfVideo = new RelayCommand<Int32>(AddMediaToKindOfVideo);

            loading();
        }

        private void loading()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DsKindOfMedia = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
            }

            DsKindOfMedia.CurrentChanged += (_, e) =>
            {
                var KindCur = DsKindOfMedia.CurrentItem as KindOfVideo;
                KindOfVideo = new KindOfVideo
                {
                    Id = KindCur.Id,
                    Name = KindCur.Name
                };

                using (var qLMEDIA = new QLMEDIAEntities())
                {
                    DsMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.Genre == KindCur.Id).ToList());
                    //DsMediaOther = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.Genre != KindCur.Id).ToList());
                    //DsMediaOther = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.Genre != KindCur.Id || medi.Genre == null).
                    //   Join(qLMEDIA.KindOfVideos,  //inner sequence
                    //                       Med => Med.Genre == null ? 0 : Med.Genre, //outerKeySelector 
                    //                       KindOf => KindOf.Id == null ? 0 : KindOf.Id, //innerKeySelector
                    //                       (Med, dataKindOf) => new // resultSelector 
                    //                        {
                    //                           NameGrene = Med.Genre == 0 ? "none" : dataKindOf.Name,
                    //                           MediaName = Med.Name,
                    //                           Mediaid = Med.Id,
                    //                           dataPost = Med.PostedDate,
                    //                           IMDB = Med.IMDB,
                    //                           Describe = Med.Describe,
                    //                           Time = Med.Time,
                    //                           Directors = Med.Directors,
                    //                           Actor = Med.Actor,
                    //                       }).ToList());
                    
                    DsMediaOther = new ListCollectionView((from Med in qLMEDIA.Media where  Med.Genre != KindCur.Id 
                                                          join u in qLMEDIA.KindOfVideos on Med.Genre equals u.Id into mar
                                                           from subMark in mar.DefaultIfEmpty()
                                                           select new 
                                                          {
                                                              NameGrene = subMark == null ? " ": subMark.Name,
                                                              MediaName = Med.Name,
                                                              Mediaid = Med.Id,
                                                              dataPost = Med.PostedDate,
                                                              IMDB = Med.IMDB,
                                                              Describe = Med.Describe,
                                                              Time = Med.Time,
                                                              Directors = Med.Directors,
                                                              Actor = Med.Actor,
                                                          }).ToList());

                }
            };
        }

        private void RemoveMediaToKindOfVideo(int obj)
        {
            
            try
            {
                using (var qLMEDIA = new QLMEDIAEntities())
                {
                    var MediaUpdate = qLMEDIA.Media.Single(medi => medi.Id == obj);

                    MediaUpdate.Genre = null;
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

                    int index = -1, count = 0;
                    DsMedia.Filter = (e) =>
                    {
                        Medium emp = e as Medium;
                        if (emp.Id == obj)
                        {
                            index = count;
                            return true;
                        }
                        count++;
                        return true;
                    };

                    DsMedia.MoveCurrentToFirst();
                    DsMedia.CancelEdit();
                    DsMedia.RemoveAt(index);

                    //reload DsMediaOther
                    var KindCur = DsKindOfMedia.CurrentItem as KindOfVideo;
                    DsMediaOther = new ListCollectionView((from Med in qLMEDIA.Media
                                                           where Med.Genre != KindCur.Id
                                                           join u in qLMEDIA.KindOfVideos on Med.Genre equals u.Id into mar
                                                           from subMark in mar.DefaultIfEmpty()
                                                           select new
                                                           {
                                                               NameGrene = subMark == null ? " " : subMark.Name,
                                                               MediaName = Med.Name,
                                                               Mediaid = Med.Id,
                                                               dataPost = Med.PostedDate,
                                                               IMDB = Med.IMDB,
                                                               Describe = Med.Describe,
                                                               Time = Med.Time,
                                                               Directors = Med.Directors,
                                                               Actor = Med.Actor,
                                                           }).ToList());

                    MessTimeout w = new MessTimeout("Remove success ! ", 1000);
                    w.ShowDialog();
                }
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }
        }

        private void AddMediaToKindOfVideo(Int32 obj)
        {
            
            try
            {
                using (var qLMEDIA = new QLMEDIAEntities())
                {
                    var MediaUpdate = qLMEDIA.Media.Single(medi => medi.Id == obj);
                    
                    MediaUpdate.Genre = (DsKindOfMedia.CurrentItem as KindOfVideo).Id;

                    qLMEDIA.SaveChanges();

                    //reload DsMedia
                    var KindCur = DsKindOfMedia.CurrentItem as KindOfVideo;
                    DsMedia = new ListCollectionView(qLMEDIA.Media.Where(medi => medi.Genre == KindCur.Id).ToList());

                    DsMediaOther = new ListCollectionView((from Med in qLMEDIA.Media
                                                           where Med.Genre != KindCur.Id
                                                           join u in qLMEDIA.KindOfVideos on Med.Genre equals u.Id into mar
                                                           from subMark in mar.DefaultIfEmpty()
                                                           select new
                                                           {
                                                               NameGrene = subMark == null ? " " : subMark.Name,
                                                               MediaName = Med.Name,
                                                               Mediaid = Med.Id,
                                                               dataPost = Med.PostedDate,
                                                               IMDB = Med.IMDB,
                                                               Describe = Med.Describe,
                                                               Time = Med.Time,
                                                               Directors = Med.Directors,
                                                               Actor = Med.Actor,
                                                           }).ToList());

                    MessTimeout w = new MessTimeout("add success ! ", 1000);
                    w.ShowDialog();
                }
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }
        }

        void UpdateKindOfVideo(string strName)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                qLMEDIA.KindOfVideos.Single(KindofDb => KindofDb.Id == KindOfVideo.Id).Name = KindOfVideo.Name;
                qLMEDIA.SaveChanges();

                (DsKindOfMedia.CurrentItem as KindOfVideo).Name = KindOfVideo.Name;

                MessTimeout w = new MessTimeout("Update success : " , 1000);
                w.ShowDialog();
            }
        }

        

        void AddKindOfVideo(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                //var rd = new Random();
                //string newId = null;
                //do
                //{
                //    newId = string.Format($"Kindof{rd.Next(100, 999)}");
                //} while (qLMEDIA.KindOfVideos.SingleOrDefault(Kindof => Kindof.Id == newId) != null);
                var KindofNew = new KindOfVideo
                {
                    Name = KindOfVideo.Name
                };
                qLMEDIA.KindOfVideos.Add(KindofNew);
                qLMEDIA.SaveChanges();

                //DsKindOfMedia.AddNewItem(KindofNew);
                loading();
                

                MessTimeout w = new MessTimeout("Add success : " + KindOfVideo.Name, 1000);
                w.ShowDialog();
            }
        }

        void DeleteKindOfVideo(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                int idKindOfMedia = (DsKindOfMedia.CurrentItem as KindOfVideo).Id;
                if (qLMEDIA.Media.FirstOrDefault(medi => medi.Genre == idKindOfMedia) != null)
                {
                    if (MessageBox.Show("We see many media of this type. Are you sure delete Type ?", "Delete Kind Of Video", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                    {
                        while (qLMEDIA.Media.FirstOrDefault(medi => medi.Genre == idKindOfMedia) != null)
                        {
                            var mediDel = qLMEDIA.Media.FirstOrDefault(medi => medi.Genre == idKindOfMedia);
                            qLMEDIA.Media.Remove(mediDel);
                            qLMEDIA.SaveChanges();
                        }

                        var KindofDel = qLMEDIA.KindOfVideos.FirstOrDefault(Kindof => Kindof.Id == idKindOfMedia);
                        qLMEDIA.KindOfVideos.Remove(KindofDel);
                        qLMEDIA.SaveChanges();

                        int index = DsKindOfMedia.IndexOf(DsKindOfMedia.CurrentItem);
                        DsKindOfMedia.MoveCurrentToFirst();
                        DsKindOfMedia.CancelEdit();
                        DsKindOfMedia.RemoveAt(index);
                    }

                }
                else {
                    var KindofDel = qLMEDIA.KindOfVideos.FirstOrDefault(Kindof => Kindof.Id == idKindOfMedia);
                    qLMEDIA.KindOfVideos.Remove(KindofDel);
                    qLMEDIA.SaveChanges();

                    int index = DsKindOfMedia.IndexOf(DsKindOfMedia.CurrentItem);
                    DsKindOfMedia.MoveCurrentToFirst();
                    DsKindOfMedia.CancelEdit();
                    DsKindOfMedia.RemoveAt(index);
                }
            }

        }

    }
}
