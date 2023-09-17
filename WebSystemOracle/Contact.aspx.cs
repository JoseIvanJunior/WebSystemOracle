using System;
using System.Data;
using System.Web.UI;
using OracleConnection = Oracle.ManagedDataAccess.Client.OracleConnection;
using OracleCommand = Oracle.ManagedDataAccess.Client.OracleCommand;
using OracleDataAdapter = Oracle.ManagedDataAccess.Client.OracleDataAdapter;
using OracleDbType = Oracle.ManagedDataAccess.Client.OracleDbType;
using System.Web.UI.WebControls;

namespace WebSystemOracle
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifique se o parâmetro foi passado
                if (Session["SelectedID"] != null)
                {
                    int selectedID = (int)Session["SelectedID"];

                    // Use o parâmetro para consultar a view do banco de dados Oracle
                    // Substitua "SuaConsultaSQL" pela consulta SQL adequada para a sua view no Oracle
                    string consultaSQL = "SELECT * FROM vw_vencimentos_cargos WHERE pessoa_id = :pessoa_id";

                    string connectionString = "DATA SOURCE=192.168.0.7;" + "PERSIST SECURITY INFO=True;USER ID=system; password=1q2w3e4r; Pooling = False;";

                    using (OracleConnection connection = new OracleConnection(connectionString))
                    {
                        connection.Open();

                        using (OracleCommand command = new OracleCommand(consultaSQL, connection))
                        {
                            command.Parameters.Add("ID", OracleDbType.Int32).Value = selectedID;

                            using (OracleDataAdapter adapter = new OracleDataAdapter(command))
                            {
                                DataTable dt = new DataTable();
                                adapter.Fill(dt);

                                // Associe o DataTable à segunda ListView
                                ListView2.DataSource = dt;
                                ListView2.DataBind();
                            }
                        }
                    }
                }
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                // Encontre o controle Label que exibe o valor do preço
                Label lblSalario = (Label)e.Item.FindControl("lblSalario");
                Label lblvalor = (Label)e.Item.FindControl("lblvalor");

                if (lblSalario != null && lblvalor != null)
                {
                    // Formate o valor como moeda
                    decimal salario = Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "salario"));
                    lblSalario.Text = salario.ToString("C");

                    decimal valor = Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "valor"));
                    lblvalor.Text = valor.ToString("C");
                }
            }
        }
    }
}