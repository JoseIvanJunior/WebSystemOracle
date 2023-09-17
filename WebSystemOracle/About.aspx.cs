using Oracle.DataAccess.Client;
using System;
using System.Data;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Web.UI.WebControls;

namespace WebSystemOracle
{
    public partial class About : Page
    {
        OracleConnection con = new OracleConnection("DATA SOURCE=192.168.0.7;" + "PERSIST SECURITY INFO=True;USER ID=system; password=1q2w3e4r; Pooling = False;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Show_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM vw_salario_liquido";
            OracleCommand command = new OracleCommand(query, con);
            OracleDataAdapter adapter = new OracleDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);

            ReportDocument report = new ReportDocument();
            report.Load(Server.MapPath("frmCrystalReport.rpt"));
            report.SetDataSource(ds.Tables["table"]);

            CrystalReportSource1.ReportSource = report;

            report.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Relatório Financeiro");
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int selectedID = Convert.ToInt32(btn.CommandArgument);

            // Armazene o ID em uma variável de sessão para acessá-lo na próxima página
            Session["SelectedID"] = selectedID;

            // Redirecione para a próxima página
            Response.Redirect("Contact.aspx?ID=" + selectedID);
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                // Encontre o controle Label que exibe o valor do preço
                Label lblSalarioLiquido = (Label)e.Item.FindControl("lblSalarioLiquido");

                if (lblSalarioLiquido != null)
                {
                    // Formate o valor como moeda
                    decimal preco = Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "salario_liquido"));
                    lblSalarioLiquido.Text = preco.ToString("C");
                }
            }
        }

    }
}