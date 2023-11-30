﻿using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DapperExtensions
{
    public class DapperHelper
    {
        public static string connectionString;

        public static MySqlConnection MySqlCon()
        {
            string mysqlConnectionStr = connectionString;
            var connection = new MySqlConnection(mysqlConnectionStr);
            connection.Open();
            return connection;
        }

        /// <summary>
        /// 执行insert与update脚本
        /// </summary>
        public static int ExcuteSqlString(string sqlStr)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                return conn.Execute(sqlStr);
            }
        }

        /// <summary>
                /// 执行查询脚本
                /// </summary>
        public static List<T> QuerySqlString<T>(string sqlStr, object parms)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                return conn.Query<T>(sqlStr, parms) as List<T>;
            }
        }


        public static List<dynamic> Query(string sql, object parms)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                var r = conn.Query(sql, parms).ToList();
                return r;
            }

        }
        public static T ExecuteScalar<T>(string sql, object parms)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                var r = conn.ExecuteScalar<T>(sql, parms);
                return r;
            }

        }

        /// <summary>
        /// 执行一条sql
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Param"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static bool Execute<T>(T Param, string sql)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                return conn.Execute(sql, Param) > 0;
            }
        }


        public static bool Execute(object Param, string sql)
        {
            using (IDbConnection conn = DapperHelper.MySqlCon())
            {
                return conn.Execute(sql, Param) > 0;
            }
        }

        public static async Task<SqlPages> GetPage<T>(SqlPageInfo page) where T : class, new()
        {
            var sqlData = new SqlPages();
            var skipSize = page.index == 1 ? 0 : page.size * page.index;
            StringBuilder sb = new StringBuilder();
            sb.Append($" select count(0) from  {page.tableName}   where {(string.IsNullOrEmpty(page.where) ? " 1=1 " : page.where) }  ; ");
            sb.Append($" select {page.field} from  {page.tableName} where{(string.IsNullOrEmpty(page.where) ? " 1=1 " : page.where) }  ");
            sb.Append($" order by {page.orderFiled}  {((string.IsNullOrEmpty(page.order) ? " desc" : page.order))}  ");
            sb.Append($" limit {skipSize},{page.size} ;");
            using (MySqlConnection conn = DapperHelper.MySqlCon())
            {
                using (var reader = conn.QueryMultiple(sb.ToString(), page.paramsObj))
                {
                    sqlData.total = await reader.ReadFirstAsync<long>();
                    sqlData.GetT = await reader.ReadAsync<T>();
                    sqlData.size = page.size;
                    sqlData.index = page.index;
                    return sqlData;
                }
            }

        }
        public class SqlPageInfo
        {
            /// <summary>
            /// 要查询的表名
            /// </summary>
            public string tableName { get; set; }
            /// <summary>
            /// 要查询的字段
            /// </summary>
            public string field { get; set; }
            /// <summary>
            /// 条件
            /// </summary>
            public string where { get; set; }
            /// <summary>
            /// 排序的字段
            /// </summary>
            public string orderFiled { get; set; }
            /// <summary>
            /// 排序的方法 desc 或者是 asc
            /// </summary>
            public string order { get; set; }
            /// <summary>
            /// 每页的数据条数
            /// </summary>
            public int size { get; set; }
            /// <summary>
            /// 当前页码
            /// </summary>
            public int index { get; set; }
            /// <summary>
            /// 需要传递给dapper的参数化内容
            /// </summary>
            public object paramsObj { get; set; }
        }
        public class SqlPages
        {
            /// <summary>
            /// 总数据
            /// </summary>
            public long total { get; set; }
            /// <summary>
            /// 每页大小
            /// </summary>
            public int size { get; set; }
            /// <summary>
            /// 当前页码
            /// </summary>
            public int index { get; set; }
            /// <summary>
            /// 返回的数据
            /// </summary>
            public object GetT { get; set; }
        }

    }

}
