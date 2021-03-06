//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ResourceDA.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Runtime.CompilerServices;

    public partial class Profile : INotifyPropertyChanged
    {
        string _Name;
        int _IdAccount, _Age;
        public int IdAccount {
            get => _IdAccount;
            set
            {
                if (_IdAccount != value)
                {
                    _IdAccount = value;
                    OnPropertyChanged();
                }
            }
        }
        public int Id { get; set; }
        public string Name {
            get => _Name;
            set
            {
                if (_Name != value)
                {
                    _Name = value;
                    OnPropertyChanged();
                }
            }
        }
        public Nullable<int> Age {
            get => _Age;
            set
            {
                if (_Age != value && value != null)
                {
                    _Age = (int)value;
                    OnPropertyChanged();
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}

