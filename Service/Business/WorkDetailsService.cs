using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.Service
{
    public class WorkDetailsService : BaseService<WorkDetailsModel>, IWorkDetailsService
    {
       



        public dynamic GetListByFilter(WorkDetailsModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = @" t_workdetails a
            inner join t_work b
            on a.PID=b.Id
            inner join t_user c
            on b.UId=c.Id
            left join t_user d
            on a.UID=d.Id";

            string where = " where 1=1 ";
            if (!string.IsNullOrEmpty(filter.RealName))
            {
                filter.RealName="%"+filter.RealName+"%";
                where += " and d.RealName like @RealName";
            }
            if (!string.IsNullOrEmpty(filter.Department))
            {
                filter.Department="%"+filter.Department+"%";
                where += " and c.Department like @Department";
            }

            if (filter.Type1==0)
            {
                if (filter.UId<=0)
                {
                    where+=" and a.Status=0";
                }
            }
            else if (filter.Type1==1)
            {

                where+=" and a.UId=@UId and Type=1 and a.Status=1";
            }

            else if (filter.Type1==-1)
            {
                if (filter.UId>0)
                {
                    where+=" and b.UId=@UId and Type=@Type";
                }
            }
            _where+=where;
            pageInfo.returnFields = string.Format("a.*,c.RealName as DocterName,d.RealName,c.Department    ", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }




    }
}
