using ResourceDA.Command;
using ResourceDA.Views.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ResourceDA.ViewModels.Admin
{
    class DashboardViewVM
    {
        public ICommand CmdManageAccounts { get; }
        public ICommand CmdMediaManage { get; }
        public ICommand CmdStatisticalChartMedia { get; }

        public DashboardViewVM()
        {
            CmdManageAccounts = new RelayCommandNoParameter(showManageAccounts);
            CmdMediaManage = new RelayCommandNoParameter(showMediaManage);
            CmdStatisticalChartMedia = new RelayCommandNoParameter(showStatisticalChartMedia);
        }

        private void showManageAccounts()
        {
            AccountsView w = new AccountsView();
            w.ShowDialog();
        }
        
        private void showMediaManage()
        {
            MediaManageView w = new MediaManageView();
            w.ShowDialog();
        }
        
        private void showStatisticalChartMedia()
        {
            StatisticalChartMedia w = new StatisticalChartMedia();
            w.ShowDialog();
        }


    }
}
