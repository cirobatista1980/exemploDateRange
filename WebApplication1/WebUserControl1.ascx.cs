using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        public static DateTime DataInicial { get; set; }
        public static DateTime DataFinal { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataInicial = DateTime.Now.Date.AddDays(-6);
                DataFinal = DateTime.Now.Date;
                DataI.Value = DataFormatada(DataInicial);
                DataF.Value = DataFormatada(DataFinal);
            }
        }

        protected void Btn1_Click(object sender, EventArgs e) // 7 dias
        {
            DataInicial = DateTime.Now.Date.AddDays(-6);
            DataFinal = DateTime.Now.Date;
            DataI.Value = DataFormatada(DataInicial);
            DataF.Value = DataFormatada(DataFinal);
        }

        protected void Btn2_Click(object sender, EventArgs e) // 15 dias
        {
            DataInicial = DateTime.Now.Date.AddDays(-14);
            DataFinal = DateTime.Now.Date;
            DataI.Value = DataFormatada(DataInicial);
            DataF.Value = DataFormatada(DataFinal);
        }

        protected void Btn3_Click(object sender, EventArgs e) // 30 dias
        {
            DataInicial = DateTime.Now.Date.AddDays(-29);
            DataFinal = DateTime.Now.Date;
            DataI.Value = DataFormatada(DataInicial);
            DataF.Value = DataFormatada(DataFinal);
        }

        protected void Btn4_Click(object sender, EventArgs e) // 60 dias
        {
            DataInicial = DateTime.Now.Date.AddDays(-59);
            DataFinal = DateTime.Now.Date;
            DataI.Value = DataFormatada(DataInicial);
            DataF.Value = DataFormatada(DataFinal);
        }

        protected void Btn5_Click(object sender, EventArgs e) // Custom
        {
            DataInicial = DataFromString(DataI.Value);
            DataFinal = DataFromString(DataF.Value);
        }

        private DateTime DataFromString(string data)
        {
            return new DateTime(
                                    int.Parse(data.Substring(0, 4)),
                                    int.Parse(data.Substring(5, 2)),
                                    int.Parse(data.Substring(8, 2))
                                );
        }
        private string DataFormatada(DateTime data)
        {
            return data.ToString("yyyy-MM-dd");
        }
    }
}