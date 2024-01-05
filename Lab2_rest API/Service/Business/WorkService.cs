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
    public class WorkService : BaseService<WorkModel>, IWorkService
    {
        public IWorkRepository repository { get; set; }

        public List<WorkModel> GetWeek()
        {
            return repository.GetWeek();
        }

        public dynamic GetListByFilter(WorkModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = " t_work a INNER JOIN t_user b on a.UId=b.Id";
            if (!string.IsNullOrEmpty(filter.RealName))
            {
                filter.RealName="%"+filter.RealName+"%";
                _where += " and b.RealName like @RealName";
            }
            pageInfo.returnFields = string.Format("a.*,b.RealName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }

    
    }
}
