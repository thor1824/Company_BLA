using System.Data.SqlClient;

namespace Company_BLA
{
    public static class ConnectionFactory
    {

        public static SqlConnection GetUserConnection()
        {
            string connetionString;
            connetionString = @"Data Source=(localdb)\ProjectsV13;Initial Catalog=Company;
        Integrated Security=True;
        Connect Timeout=30;
        Encrypt=False;
        TrustServerCertificate=False;
        ApplicationIntent=ReadWrite;
        MultiSubnetFailover=False";

            SqlConnection cnn = new SqlConnection(connetionString);
            return cnn;
        }
    }
}
