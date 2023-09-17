using Oracle.DataAccess.Client;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Web.UI;
using OracleCommand = Oracle.ManagedDataAccess.Client.OracleCommand;
using OracleConnection = Oracle.ManagedDataAccess.Client.OracleConnection;
using OracleDbType = Oracle.ManagedDataAccess.Client.OracleDbType;

namespace WebSystemOracle
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connectionString = "DATA SOURCE=192.168.0.7;" + "PERSIST SECURITY INFO=True;USER ID=system; password=1q2w3e4r; Pooling = False;";

            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM users_login WHERE usuario = :usuario AND password = :password";

                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    command.Parameters.Add("usuario", OracleDbType.Varchar2).Value = username;
                    command.Parameters.Add("password", OracleDbType.Varchar2).Value = password;

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        // Autenticação bem-sucedida, redirecione para a página principal
                        Response.Redirect("About.aspx");
                    }
                    else
                    {
                        // Credenciais inválidas, exiba uma mensagem de erro
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Credenciais inválidas. Tente novamente.";
                    }
                }
            }
        }
    }
}