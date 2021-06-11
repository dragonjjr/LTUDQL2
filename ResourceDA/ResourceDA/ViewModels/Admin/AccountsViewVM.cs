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
    class AccountsViewVM : DependencyObject, INotifyPropertyChanged
    {
        public static readonly DependencyProperty DsAccountProperty;
        public static readonly DependencyProperty AccountProperty;
        public static readonly DependencyProperty AccountNewProperty;

        // commbox
        private ObservableCollection<String> values = new ObservableCollection<string>()
        {
            "Level 1", "Level 2", "Level 3"
        };

        public event PropertyChangedEventHandler PropertyChanged;
        void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ObservableCollection<string> Values
        {
            get { return values; }
            set
            {
                values = value;
                OnPropertyChanged();
            }
        }

        private string selectedValue;
        public string SelectedValue
        {
            get { return selectedValue; }
            set
            {
                int level = Int32.Parse(value.Substring(value.Count() - 1));
                using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
                {
                    DSAccount = new ListCollectionView(qLMEDIA.Accounts.Where(acc => acc.ModuleAccount == "0" && acc.LevelAccount == level ).ToList());
                    DSAccount.CurrentChanged += (obj, e) =>
                    {
                        var accountCur = DSAccount.CurrentItem as Account;
                        Account = new Account
                        {
                            Id = accountCur.Id,
                            UserName = accountCur.UserName,
                            Image = accountCur.Image,
                            PhoneNumber = accountCur.PhoneNumber,
                            Address = accountCur.Address,
                            Password = accountCur.Password,
                            LevelAccount = accountCur.LevelAccount,
                            CreditCardNumber = accountCur.CreditCardNumber,
                            TaxCode = accountCur.TaxCode
                        };
                    };
                }

                selectedValue = value;
                OnPropertyChanged();
            }
        }

        public ICommand CmdUpdateAccount { get; }
        public ICommand CmdDeleteAccount { get; }
        public ICommand CmdAddAccount { get; }
        public ICommand CmdCriteriaAccountLevelAccount { get; }
        public ICommand CmdCriteriaAccountNone { get; }
       

        static AccountsViewVM()
        {
            DsAccountProperty = DependencyProperty.Register("DSAccount", typeof(ListCollectionView), typeof(AccountsViewVM));
            AccountProperty = DependencyProperty.Register("Account", typeof(Account), typeof(AccountsViewVM));
            AccountNewProperty = DependencyProperty.Register("AccountNew", typeof(Account), typeof(AccountsViewVM));
        }

        public ListCollectionView DSAccount
        {
            get => (ListCollectionView)GetValue(DsAccountProperty);
            set => SetValue(DsAccountProperty, value);
        }

        public Account Account
        {
            get => (Account)GetValue(AccountProperty);
            set => SetValue(AccountProperty, value);
        }
        public Account AccountNew
        {
            get => (Account)GetValue(AccountNewProperty);
            set => SetValue(AccountNewProperty, value);
        }

        public AccountsViewVM()
        {
            CmdUpdateAccount = new RelayCommand<object>(UpdateAccount);
            CmdDeleteAccount = new RelayCommand<object>(DeleteAccount);
            CmdAddAccount = new RelayCommand<object>(AddAccount);
            CmdCriteriaAccountLevelAccount = new RelayCommandNoParameter(reloadAccountLevelAccount);
            CmdCriteriaAccountNone = new RelayCommandNoParameter(reloadAccountNone);

            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSAccount = new ListCollectionView(qLMEDIA.Accounts.Where(acc => acc.ModuleAccount == "0").ToList());
                DSAccount.CurrentChanged += (obj, e) =>
                {
                    var accountCur = DSAccount.CurrentItem as Account;
                    Account = new Account
                    {
                        Id = accountCur.Id,
                        UserName = accountCur.UserName,
                        Image = accountCur.Image,
                        PhoneNumber = accountCur.PhoneNumber,
                        Address = accountCur.Address,
                        Password =accountCur.Password,
                        LevelAccount = accountCur.LevelAccount,
                        CreditCardNumber= accountCur.CreditCardNumber,
                        TaxCode = accountCur.TaxCode
                    };
                };
            }

            AccountNew = new Account();
        }

        void reloadAccountLevelAccount()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSAccount = new ListCollectionView(qLMEDIA.Accounts.Where(acc => acc.ModuleAccount == "0" && acc.LevelAccount == 2).ToList());
                DSAccount.CurrentChanged += (obj, e) =>
                {
                    var accountCur = DSAccount.CurrentItem as Account;
                    Account = new Account
                    {
                        Id = accountCur.Id,
                        UserName = accountCur.UserName,
                        Image = accountCur.Image,
                        PhoneNumber = accountCur.PhoneNumber,
                        Address = accountCur.Address,
                        Password = accountCur.Password,
                        LevelAccount = accountCur.LevelAccount,
                        CreditCardNumber = accountCur.CreditCardNumber,
                        TaxCode = accountCur.TaxCode
                    };
                };
            }
        }

        void reloadAccountNone()
        {
            using (QLMEDIAEntities qLMEDIA = new QLMEDIAEntities())
            {
                DSAccount = new ListCollectionView(qLMEDIA.Accounts.Where(acc => acc.ModuleAccount == "0").ToList());
                DSAccount.CurrentChanged += (obj, e) =>
                {
                    var accountCur = DSAccount.CurrentItem as Account;
                    Account = new Account
                    {
                        Id = accountCur.Id,
                        UserName = accountCur.UserName,
                        Image = accountCur.Image,
                        PhoneNumber = accountCur.PhoneNumber,
                        Address = accountCur.Address,
                        Password = accountCur.Password,
                        LevelAccount = accountCur.LevelAccount,
                        CreditCardNumber = accountCur.CreditCardNumber,
                        TaxCode = accountCur.TaxCode
                    };
                };
            }
        }

        void UpdateAccount(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var accountUpdate = qLMEDIA.Accounts.Single(acc => acc.Id == Account.Id);
                accountUpdate.UserName = Account.UserName;
                accountUpdate.Image = Account.Image;
                accountUpdate.PhoneNumber = Account.PhoneNumber;
                accountUpdate.Password = Account.Password;
                accountUpdate.LevelAccount = Account.LevelAccount;
                accountUpdate.CreditCardNumber = Account.CreditCardNumber;
                accountUpdate.TaxCode = Account.TaxCode;
                qLMEDIA.SaveChanges();

                var accountCur = DSAccount.CurrentItem as Account;
                accountCur.UserName = Account.UserName;
                accountCur.Image = Account.Image;
                accountCur.PhoneNumber = Account.PhoneNumber;
                accountCur.Password = Account.Password;
                accountCur.LevelAccount = Account.LevelAccount;
                accountCur.CreditCardNumber = Account.CreditCardNumber;
                accountCur.TaxCode = Account.TaxCode;

                MessTimeout w = new MessTimeout("Update success ! " , 2000);
                w.ShowDialog();
            }
        }

        void DeleteAccount(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var accountDel = qLMEDIA.Accounts.FirstOrDefault(acc => acc.Id == Account.Id);
                qLMEDIA.Accounts.Remove(accountDel);
                qLMEDIA.SaveChanges();

                int index = DSAccount.IndexOf(DSAccount.CurrentItem);
                DSAccount.MoveCurrentToFirst();
                DSAccount.CancelEdit();
                DSAccount.RemoveAt(index);

                // MessageBox.Show("delete succ" + accountDel.UserName);

                MessTimeout w = new MessTimeout("Delete success :" + accountDel.UserName, 2000);
                w.ShowDialog();

            }
        }

        void AddAccount(object obj)
        {

            using (var qLMEDIA = new QLMEDIAEntities())
            {
                AccountNew.ModuleAccount = "0";

                qLMEDIA.Accounts.Add(AccountNew);
                qLMEDIA.SaveChanges();
                
                DSAccount.AddNewItem(AccountNew);
                DSAccount.CommitNew();
                MessTimeout w = new MessTimeout("Add success :" + AccountNew.UserName, 2000);
                w.ShowDialog();
                AccountNew = new Account();
                
            }
        }
    }
}
