using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
   public interface IWorkService: IBaseService<WorkModel>
    {

        List<WorkModel> GetWeek();




       

    }
}
