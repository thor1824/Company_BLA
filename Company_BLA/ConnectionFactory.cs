using System.Data.SqlClient;

namespace Company_BLA
{
    public static class ConnectionFactory
    {

        public static SqlConnection GetUserConnection()
        {
            string connetionString;
            connetionString = @"Data Source=DESKTOP-24P1GTP;Initial Catalog=Company;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False";

            SqlConnection cnn = new SqlConnection(connetionString);
            return cnn;
        }
    }
}
