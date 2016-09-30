using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Data.SqlClient;
using DataLayer.Model;

namespace DataLayer
{
    public class DataConnector
    {
        //protected OleDbDataAdapter dataAdapter = new OleDbDataAdapter();
        protected SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private string errorMessage = "";

        private SqlConnection connection;

        //method to open connection
        public DataConnector(string connectionString)
        {
            connection = new SqlConnection(connectionString);
            this.dataAdapter.SelectCommand = new SqlCommand("", connection);
            this.dataAdapter.InsertCommand = new SqlCommand("", connection);
        }

        public platform_user login(string username, string password)
        {
            platform_user platformUser = new platform_user();
            connection.Open();
            SqlCommand queryPlatformUser = new SqlCommand(String.Format("SELECT * FROM platform_user WHERE name='{0}' AND surname='{1}'", username, password), connection);
            try
            {
                using (SqlDataReader reader = queryPlatformUser.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        platformUser.name = Convert.ToString(reader["name"]);
                        platformUser.surname = Convert.ToString(reader["surname"]);
                    }
                }
            }

            catch (Exception e)
            {
                errorMessage = e.Message;
            }
            finally
            {
                dataAdapter.SelectCommand.Connection.Close();
            }

            return platformUser;
        }

        public DataTable selectData(string query)
        {
            DataTable dataTable = new DataTable();
            try
            {
                dataAdapter.SelectCommand.CommandText = query;
                dataAdapter.SelectCommand.Connection.Open();
                dataAdapter.Fill(dataTable);            
            }
            catch (Exception e)
            {
                errorMessage = e.Message;
                //please log the error into the console or logging mechanism
            }
            finally
            {
                dataAdapter.SelectCommand.Connection.Close();
            }

            return dataTable;
        }

        private int dataInsert(string query)
        {
            int rowsAffected = 0;
            try
            {
                dataAdapter.UpdateCommand.CommandText = query;
                dataAdapter.UpdateCommand.Connection.Open();
                rowsAffected = dataAdapter.UpdateCommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                errorMessage = e.Message;
            }
            finally
            {
                dataAdapter.UpdateCommand.Connection.Close();
            }

            return rowsAffected;
        }

        public int updateData(string query)
        {
            return dataInsert(query);
        }

        public int deleteData(string query)
        {
            return dataInsert(query);
        }

    }
}