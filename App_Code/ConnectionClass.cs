using System;
using Oracle.DataAccess.Client;
using System.Data;
using System.Configuration;

public static class ConnectionClass
{
    private static String strConexao = ConfigurationManager.ConnectionStrings["OradbCon"].ConnectionString;
    public static OracleConnection connection = new OracleConnection(strConexao);
    private static OracleCommand cmd;
    private static OracleDataAdapter da;
    private static DataSet ds;
    private static String SQL;
    public static string Conexao()
    {
        string info = "";
        try
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
                info = "Conectado com a Versão Oracle " + connection.ServerVersion + " Utilizando a fonte " + connection.DataSource;
            }
        }
        catch (OracleException ex)
        {
            return ex.Message;
        }
        return info + " Estado da Conexao " + connection.State.ToString() + " OK";
    }
    public static void FinalizarConexao()
    {
        try
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static DataTable RetornarDataTable(string command)
    {
        Conexao();
        cmd = new OracleCommand(command, connection);
        cmd.CommandType = CommandType.Text;
        da = new OracleDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        //  FinalizarConexao();
        return ds.Tables[0];
    }
    public static void ExecutarComando(string sqlComando)
    {
        try
        {
            Conexao();
            OracleCommand cmd = new OracleCommand(sqlComando, connection);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            FinalizarConexao();
        }
    }
    public static int ExecutarComandoRetorno(string sqlComando)
    {
        try
        {
            Conexao();
            OracleCommand cmd = new OracleCommand(sqlComando, connection);
            int d = Convert.ToInt32(cmd.ExecuteScalar());
            return d;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            FinalizarConexao();
        }
    }

    public static DataSet RetornarDataSet(string sqlComando)
    {
        try
        {
            Conexao();
            ds = new DataSet();
            cmd = new OracleCommand(sqlComando, connection);
            da = new OracleDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}