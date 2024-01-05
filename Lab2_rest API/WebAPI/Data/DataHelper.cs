using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using MySql.Data.MySqlClient;
namespace WebAPI.Data
{
    public class DataHelper
    {
        public static string DBConnString = System.Configuration.ConfigurationManager.ConnectionStrings["mysqlconn"].ConnectionString;

        public static System.Data.IDbConnection GetConn()
        {
            var conn = new MySqlConnection(DBConnString);
            conn.Open();
            return conn;
        }

        public static int Execute(string sql, object obj)
        {
            using (var conn = GetConn())
            {
                return conn.Execute(sql, obj);

            }
        }


        public static int ExecuteScalar(string sql,object obj)
        {
            using (var conn = GetConn())
            {
                return int.Parse( conn.ExecuteScalar(sql, obj).ToString());
                
            }
        }

        public static List<T> Query<T>(string sql, object obj)
        {
            using (var conn = GetConn())
            {
                var data= conn.Query<T>(sql, obj);

               return data.ToList();
            }
        }

    }
}