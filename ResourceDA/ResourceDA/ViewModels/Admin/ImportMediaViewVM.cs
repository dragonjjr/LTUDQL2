using MediaInfoDotNet;
using Microsoft.Win32;

using ResourceDA.Command;
using ResourceDA.Models;
using ResourceDA.windownsCustom;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;


namespace ResourceDA.ViewModels.Admin
{
   
    class ImportMediaViewVM : DependencyObject
    {

        public static readonly DependencyProperty MediaProperty;
        public static readonly DependencyProperty BitRateProperty;
        public static readonly DependencyProperty WidthProperty;
        public static readonly DependencyProperty HeightProperty;
        public static readonly DependencyProperty DsKindOfVideoAddProperty;

        string sourcePostFile ;
        string destinationPosertFile;
        string sourceSourceFile;
        string destinationSourceFile;


        //command
        public ICommand CmdMyICommandThatShouldHandleLoaded { get; }
        public ICommand CmdimportMedia { get; }
        public ICommand CmdBrowsMedia { get; }
        public ICommand CmdBrowsPosterMedia { get; }
        static ImportMediaViewVM()
        {
            MediaProperty = DependencyProperty.Register("Media", typeof(Medium), typeof(ImportMediaViewVM));
            BitRateProperty = DependencyProperty.Register("BitRateMedia", typeof(String), typeof(ImportMediaViewVM));
            WidthProperty = DependencyProperty.Register("WidthMedia", typeof(String), typeof(ImportMediaViewVM));
            HeightProperty = DependencyProperty.Register("HeightMedia", typeof(String), typeof(ImportMediaViewVM));
            DsKindOfVideoAddProperty = DependencyProperty.Register("DSKindOfVideoAdd", typeof(ListCollectionView), typeof(ImportMediaViewVM));
        }

        public Medium Media
        {
            get => (Medium)GetValue(MediaProperty);
            set => SetValue(MediaProperty, value);
        }

        public String BitRateMedia
        {
            get => (String)GetValue(BitRateProperty);
            set => SetValue(BitRateProperty, value);
        }

        public String WidthMedia
        {
            get => (String)GetValue(WidthProperty);
            set => SetValue(WidthProperty, value);
        }

        public String HeightMedia
        {
            get => (String)GetValue(HeightProperty);
            set => SetValue(HeightProperty, value);
        }

        public ListCollectionView DSKindOfVideoAdd
        {
            get => (ListCollectionView)GetValue(DsKindOfVideoAddProperty);
            set => SetValue(DsKindOfVideoAddProperty, value);
        }

        public ImportMediaViewVM()
        {
            //command
            CmdMyICommandThatShouldHandleLoaded = new RelayCommandNoParameter(MyICommandThatShouldHandleLoaded);
            CmdimportMedia = new RelayCommand<object>(importMedia);
            CmdBrowsMedia = new RelayCommand<object>(BrowsMedia);
            CmdBrowsPosterMedia = new RelayCommand<object>(BrowsPosterMedia);

            //load data
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSKindOfVideoAdd = new ListCollectionView(qLMEDIA.KindOfVideos.ToList());
            }

            Media = new Medium();
        }

        void MyICommandThatShouldHandleLoaded()
        {
            refresh();
            try
            {
                
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Title = "Brows Media";
                if (openFileDialog.ShowDialog() == true)
                {
                    var myVideo = new MediaFile(openFileDialog.FileName);

                    if (myVideo.Video.Count > 0)
                    {
                        var vid = myVideo.Video[0];


                        sourceSourceFile = openFileDialog.FileName;
                        destinationSourceFile = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName + @"\Assets\video\" + openFileDialog.FileName.Substring(openFileDialog.FileName.LastIndexOf(@"\") + 1);

                        // setup porperty Media 

                        KindOfVideo KindOfVideoAddCur = DSKindOfVideoAdd.CurrentItem as KindOfVideo;
                        //Media.Describe = Media.Describe;

                        TimeSpan t = TimeSpan.FromMilliseconds(vid.Duration);
                        string timeFormat = string.Format("{0:D2}h:{1:D2}m:{2:D2}s:{3:D3}ms",
                                                t.Hours,
                                                t.Minutes,
                                                t.Seconds,
                                                t.Milliseconds);
                        Media.Time = timeFormat.Substring(4, 2) + ":" + timeFormat.Substring(8, 2);

                        Media.Name = openFileDialog.FileName.Substring(openFileDialog.FileName.LastIndexOf(@"\") + 1,
                             openFileDialog.FileName.LastIndexOf(".") - openFileDialog.FileName.LastIndexOf(@"\") -1);

                        //Media.Directors = Media.Directors;
                        Media.Source = openFileDialog.FileName;
                        //Media.PostedDate = DateTime.Now;
                        //Media.Actor = Media.Actor;
                        Media.Genre = KindOfVideoAddCur.Id;
                        //Media.IMDB = Media.IMDB;
                        //Media.Poster = Media.Poster.Substring(Media.Poster.LastIndexOf(@"\") + 1);
                        BitRateMedia = vid.bitRate.ToString();
                        WidthMedia = vid.Width.ToString();
                        HeightMedia = vid.Height.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }

            
        }
        void importMedia(object obj)
        {
            try
            {
                KindOfVideo KindOfVideoAddCur = DSKindOfVideoAdd.CurrentItem as KindOfVideo;
                using (var qLMEDIA = new QLMEDIAEntities())
                {
                    Media.Genre = KindOfVideoAddCur.Id;
                    if (Media.Poster != null)
                    {
                        Media.Poster = Media.Poster.Substring(Media.Poster.LastIndexOf(@"\") + 1);
                    }
                    Media.Source = Media.Source.Substring(Media.Source.LastIndexOf(@"\") + 1);

                    // copy file to fodel assets
                    try
                    {
                        if (sourcePostFile != null) {
                            File.Copy(sourcePostFile, destinationPosertFile, true);
                        }
                        File.Copy(sourceSourceFile, destinationSourceFile, true);
                    }
                    catch (IOException iox)
                    {
                        MessTimeout w1 = new MessTimeout(iox.Message, 3000);
                        w1.ShowDialog();
                    }
                    
                    qLMEDIA.Media.Add(Media);
                    qLMEDIA.SaveChanges();

                    MessTimeout w = new MessTimeout("Import success : " + Media.Name, 1000);
                    w.ShowDialog();
                    // khoi tao lai mac dinh Media
                    refresh();
                }
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }


        }

        void BrowsMedia(object obj)
        {
            try
            {

                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Title = "Brows Media";
                if (openFileDialog.ShowDialog() == true)
                {
                    var myVideo = new MediaFile(openFileDialog.FileName);

                    if (myVideo.Video.Count > 0)
                    {
                        var vid = myVideo.Video[0];


                        sourceSourceFile = openFileDialog.FileName;
                        destinationSourceFile = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName + @"\Assets\video\" + openFileDialog.FileName.Substring(openFileDialog.FileName.LastIndexOf(@"\") + 1);

                        // setup porperty Media 

                        KindOfVideo KindOfVideoAddCur = DSKindOfVideoAdd.CurrentItem as KindOfVideo;
                        //Media.Describe = Media.Describe;

                        TimeSpan t = TimeSpan.FromMilliseconds(vid.Duration);
                        string timeFormat = string.Format("{0:D2}h:{1:D2}m:{2:D2}s:{3:D3}ms",
                                                t.Hours,
                                                t.Minutes,
                                                t.Seconds,
                                                t.Milliseconds);
                        Media.Time = timeFormat.Substring(4, 2) + ":" + timeFormat.Substring(8, 2);

                        Media.Name = openFileDialog.FileName.Substring(openFileDialog.FileName.LastIndexOf(@"\") + 1,
                             openFileDialog.FileName.LastIndexOf(".") - openFileDialog.FileName.LastIndexOf(@"\") -1 );

                        //Media.Directors = Media.Directors;
                        Media.Source = openFileDialog.FileName;
                        //Media.PostedDate = DateTime.Now;
                        //Media.Actor = Media.Actor;
                        Media.Genre = KindOfVideoAddCur.Id;
                        //Media.IMDB = Media.IMDB;
                        //Media.Poster = Media.Poster.Substring(Media.Poster.LastIndexOf(@"\") + 1);
                        BitRateMedia = vid.bitRate.ToString();
                        WidthMedia = vid.Width.ToString();
                        HeightMedia = vid.Height.ToString();

                    }
                }
            }
            catch (Exception ex)
            {
                MessTimeout w = new MessTimeout(ex.Message, 3000);
                w.ShowDialog();
            }
        }

        void BrowsPosterMedia(object obj)
        {

            
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Title = "Brows Poster Media";
            if (openFileDialog.ShowDialog() == true)
            {
                sourcePostFile = openFileDialog.FileName;
                destinationPosertFile = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName + @"\Assets\image\poster\" + openFileDialog.FileName.Substring(openFileDialog.FileName.LastIndexOf(@"\") + 1);
                Media.Poster = openFileDialog.FileName;
            }
        }

        void refresh ()
        {
            Media = new Medium();
            Media.PostedDate = DateTime.Now;
            sourcePostFile  = null;
            destinationPosertFile = null;
            sourceSourceFile = null;
            destinationSourceFile = null;
        }
    }
}
