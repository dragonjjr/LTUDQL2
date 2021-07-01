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
        public ICommand CmdKindofMedia { get; }
        public ICommand CmdStatisticalChartMediaByRevenue { get; }
        public ICommand CmdMediaCountstatisticsView { get; }

        public DashboardViewVM()
        {
            CmdManageAccounts = new RelayCommandNoParameter(showManageAccounts);
            CmdMediaManage = new RelayCommandNoParameter(showMediaManage);
            CmdStatisticalChartMedia = new RelayCommandNoParameter(showStatisticalChartMedia);
            CmdKindofMedia = new RelayCommandNoParameter(showKindofMedia);
            CmdStatisticalChartMediaByRevenue = new RelayCommandNoParameter(showStatisticalChartMediaByRevenue);
            CmdMediaCountstatisticsView = new RelayCommandNoParameter(showMediaCountstatisticsView);
        }

        private void showMediaCountstatisticsView()
        {
            MediaCountstatisticsView w = new MediaCountstatisticsView();
            w.ShowDialog();
        }

        private void showStatisticalChartMediaByRevenue()
        {
            StatisticalChartMediaByRevenue w = new StatisticalChartMediaByRevenue();
            w.ShowDialog();
        }

        private void showKindofMedia()
        {
            KindOfMediaManageView w = new KindOfMediaManageView();
            w.ShowDialog();
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
