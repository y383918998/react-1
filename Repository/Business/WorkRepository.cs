using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Collections.Generic;
using System.Linq;

namespace RightControl.Repository
{
    public class WorkRepository : BaseRepository<WorkModel>, IWorkRepository
    {
        /// <summary>
        /// 获取上周排期数据
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public List<WorkModel> GetWeek()
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = "SELECT * FROM t_work where YEARWEEK(BeginTime, 1) = YEARWEEK(DATE_SUB(CURDATE(), INTERVAL 1 WEEK), 1);";
                var data = conn.Query<WorkModel>(sql, null).ToList();
                return data;
            }
        }
    }
}
