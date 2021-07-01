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

namespace ResourceDA.ViewModels.User
{
    class ProfileViewVM : DependencyObject, INotifyPropertyChanged
    {
        public static readonly DependencyProperty DsProfileProperty;
        public static readonly DependencyProperty ProfileProperty;
        public static readonly DependencyProperty ProflieNewProperty;

        public event PropertyChangedEventHandler PropertyChanged;
        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ICommand CmdUpdateProfile { get; }
        public ICommand CmdDeleteProfile { get; }
        public ICommand CmdAddProfile { get; }

        static ProfileViewVM()
        {
            DsProfileProperty = DependencyProperty.Register("DSProfile", typeof(ListCollectionView), typeof(ProfileViewVM));
            ProfileProperty = DependencyProperty.Register("Profile", typeof(Profile), typeof(ProfileViewVM));
            ProflieNewProperty = DependencyProperty.Register("ProfileNew", typeof(Profile), typeof(ProfileViewVM));
        }

        public ListCollectionView DSProfile
        {
            get => (ListCollectionView)GetValue(DsProfileProperty);
            set => SetValue(DsProfileProperty, value);
        }

        public Profile Profile
        {
            get => (Profile)GetValue(ProfileProperty);
            set => SetValue(ProfileProperty, value);
        }
        public Profile ProfileNew
        {
            get => (Profile)GetValue(ProflieNewProperty);
            set => SetValue(ProflieNewProperty, value);
        }

        public ProfileViewVM()
        {
            CmdUpdateProfile = new RelayCommand<object>(UpdateProfile);
            CmdDeleteProfile = new RelayCommand<object>(DeleteProfile);
            CmdAddProfile = new RelayCommand<object>(AddProfile);


            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSProfile = new ListCollectionView(qLMEDIA.Profiles.ToList());

                DSProfile.CurrentChanged += (obj, e) =>
                {
                    var profileCur = DSProfile.CurrentItem as Profile;
                    Profile = new Profile
                    {
                        Id =profileCur.Id,
                        IdAccount = 1,
                        Name = profileCur.Name,
                        Age = profileCur.Age
                    };
                };
            }
            ProfileNew = new Profile() { Id=1};
        }

        void UpdateProfile(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var profileUpdate = qLMEDIA.Profiles.Single(prof => prof.Id == Profile.Id);
                profileUpdate.IdAccount = Profile.IdAccount;
                profileUpdate.Name = Profile.Name;
                profileUpdate.Age = Profile.Age;
                qLMEDIA.SaveChanges();

                var profileCur = DSProfile.CurrentItem as Profile;
                profileCur.IdAccount = Profile.IdAccount;
                profileCur.Name = Profile.Name;
                profileCur.Age = Profile.Age;

                MessTimeout w = new MessTimeout("Update success ! ", 2000);
                w.ShowDialog();
            }
        }

        void DeleteProfile(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var profileDel = qLMEDIA.Profiles.FirstOrDefault(prof => prof.Id == Profile.Id);
                qLMEDIA.Profiles.Remove(profileDel);
                qLMEDIA.SaveChanges();

                int index = DSProfile.IndexOf(DSProfile.CurrentItem);
                DSProfile.MoveCurrentToFirst();
                DSProfile.CancelEdit();
                DSProfile.RemoveAt(index);

                // MessageBox.Show("delete succ" + accountDel.UserName);

                MessTimeout w = new MessTimeout("Delete success :" + profileDel.IdAccount, 2000);
                w.ShowDialog();
            }
        }

        void AddProfile(object obj)
        {
            try
            {
                using (var qLMEDIA = new QLMEDIAEntities())
                {
                    qLMEDIA.Profiles.Add(ProfileNew);
                    qLMEDIA.SaveChanges();

                    DSProfile.AddNewItem(ProfileNew);
                    DSProfile.CommitNew();
                    MessTimeout w = new MessTimeout("Add success :" + ProfileNew.IdAccount, 2000);
                    w.ShowDialog();

                }
            }
            catch
            {
                MessTimeout w = new MessTimeout("Error", 2000);
                w.ShowDialog();
            }
           
        }
    }
}
