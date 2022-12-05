using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Odbc;
using System.Data;

namespace DataBaseWrapper
{
    public class CommandParameter
    {
        public string Name { get; set; }
        public object Value { get; set; }

        public CommandParameter(string name, object val)
        {
            Name = name;
            Value = val;
        }
    }

    public class DataBase
    {
        OdbcConnection connection;

        public bool IsOpen
        {
            get
            {
                return connection.State == ConnectionState.Open;
            }
        }

        public DataBase(string connectionString)
        {
            connection = new OdbcConnection(connectionString);
        }

        public void Open()
        {
            connection.Open();
        }

        public void Close()
        {
            connection.Close();
        }

        public DataTable RunQuery(string sqlCmd)
        {
            DataTable dt = new DataTable();
            OdbcDataAdapter da = new OdbcDataAdapter(sqlCmd, connection);
            da.Fill(dt);
            return dt;
        }

        public DataTable RunQuery(string sqlcmd, params CommandParameter[] parameters)
        {
            DataTable dt = new DataTable();
            OdbcCommand cmd = new OdbcCommand(sqlcmd,connection);

            foreach(CommandParameter parameter in parameters)
            {
                cmd.Parameters.AddWithValue(parameter.Name,parameter.GetType()).Value = parameter.Value;
            }

            OdbcDataAdapter da = new OdbcDataAdapter(cmd.CommandText, connection);
            da.Fill(dt);
            return dt;
        }

        public Object RunQueryScalar(string sqlCmd)
        {
            object output = null;
            OdbcCommand cmd = new OdbcCommand(sqlCmd, connection);
            if (connection.State == ConnectionState.Open)
            {
                output = cmd.ExecuteScalar();
                
            }
            else
            {
                try
                {
                    connection.Open();
                    output = cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    connection.Close();
                }
                
            }
            return output;
        }

        public int RunNonQuery(string sqlCmd)
        {
            OdbcCommand cmd = new OdbcCommand(sqlCmd, connection);
            int effectedLines = 0;
            if(connection.State == ConnectionState.Open)
            {
                effectedLines = cmd.ExecuteNonQuery();
                return effectedLines;
            }
            else
            {
                connection.Open();
                effectedLines = cmd.ExecuteNonQuery();
                connection.Close();
                return effectedLines;
            }
        }

        
    }


}
