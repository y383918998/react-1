using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class ReservationController : ApiController
    {


        public class RVModel
        {
            public string BeginTime { get; set; }

            public string EndTime { get; set; }
            public string Department { get; set; }
            public string DocterName { get; set; }
            public string RealName { get; set; }
            public int  Id { get; set; }

        }

        public RetData Get([FromBody]RVModel rVModel)
        {
            RetData retData = new RetData();
            string sql = @"SELECT a.Id,a.BeginTime,a.EndTime,c.RealName as DocterName,d.RealName,c.Department FROM  t_workdetails a
            inner join t_work b
            on a.PID=b.Id
            inner join t_user c
            on b.UId=c.Id
            left join t_user d
            on a.UID=d.Id where a.BeginTime>=@BeginTime and a.EndTime<=@EndTime  and c.Department like @Department and a.status=0";

            if (string.IsNullOrEmpty(rVModel.BeginTime))
            {
                rVModel.BeginTime=DateTime.Now.ToString();
            }
            if (string.IsNullOrEmpty(rVModel.EndTime))
            {
                rVModel.EndTime=DateTime.Now.AddDays(7).ToString();
            }
            rVModel.Department="%"+rVModel.Department+"%";
            var data = Data.DataHelper.Query<RVModel>(sql, new { BeginTime = rVModel.BeginTime, EndTime = rVModel.EndTime, Department= rVModel.Department });
            retData.Code=200;
            retData.Status=true;
            retData.Data=data;
            return retData;
             
        }



        /// <summary>
        /// 取消预约/预约
        /// </summary>
        /// <param name="id"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        // PUT api/<controller>/5
        public RetData Put(int id, [FromBody] RModel model)
        {

            RetData retData = new RetData();
            string sql = string.Empty;
            if (model.Type==0)
            {
                 sql = "update t_workdetails set  uid=@uid ,status=1 where id=@id";
            }
            else
            { 
                 sql = "update t_workdetails set  uid=0 ,status=0 where id=@id";
            }
            var data = Data.DataHelper.Execute(sql,new { uid =model.UID,id=model.Id});
            retData.Code=200;
            retData.Status=true;
            return retData;

        }



        public class RModel
        {
           
            public int Id { get; set; }
            public int UID{ get; set; }
            /// <summary>
            /// 0 预约  1取消
            /// </summary>
            public int Type { get; set; } = 0;

        }

    }
}