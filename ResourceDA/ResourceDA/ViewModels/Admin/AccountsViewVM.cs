using ResourceDA.Command;
using ResourceDA.Models;
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
    class AccountsViewVM : DependencyObject
    {
        public static readonly DependencyProperty DsAccountProperty;
        public static readonly DependencyProperty AccountProperty;
        public static readonly DependencyProperty AccountNewProperty;

        public ICommand CmdUpdateAccount { get; }
        public ICommand CmdDeleteAccount { get; }
        public ICommand CmdAddAccount { get; }
        public ICommand CmdReAccount { get; }

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
            CmdReAccount = new RelayCommand<int>(reloadAccount);

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

        void UpdateAccount(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var accountUpdate = qLMEDIA.Accounts.Single(acc => acc.Id == Account.Id);
                accountUpdate.UserName = Account.UserName;
                accountUpdate.Image = Account.Image;
                accountUpdate.PhoneNumber = Account.PhoneNumber;
                accountUpdate.Address = Account.Address;
                qLMEDIA.SaveChanges();

                var accountCur = DSAccount.CurrentItem as Account;
                accountCur.UserName = Account.UserName;
                accountCur.Image = Account.Image;
                accountCur.PhoneNumber = Account.PhoneNumber;
                accountCur.Address = Account.Address;
            }
        }

        void DeleteAccount(object obj)
        {
            using (var qLMEDIA = new QLMEDIAEntities())
            {
                var accountDel = qLMEDIA.Accounts.FirstOrDefault(acc => acc.Id == Account.Id);
                qLMEDIA.Accounts.Remove(accountDel);
                qLMEDIA.SaveChanges();
                

                DSAccount.MoveCurrentToFirst();
                //DSAccount.Remove(accountDel);
                
                
                MessageBox.Show("da xoa");
                
            }
        }
        void reloadAccount(int a)
        {
            
        }

        void AddAccount(object obj)
        {

            using (var qLMEDIA = new QLMEDIAEntities())
            {
                AccountNew.ModuleAccount = "0";

                qLMEDIA.Accounts.Add(AccountNew);
                qLMEDIA.SaveChanges();

                DSAccount.AddNewItem(AccountNew);
                AccountNew = new Account();
                
            }
        }
    }
}
