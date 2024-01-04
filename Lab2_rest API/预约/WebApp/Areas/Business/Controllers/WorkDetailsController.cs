using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Business.Controllers
{
    public class WorkDetailsController : BaseController
    {
      
        public IWorkDetailsService workDetailsService { get; set; }

      
        // GET: Business/Work
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            return View();
        }
        /// <summary>
        /// 加载数据列表
        /// </summary>
        /// <param name="filter"></param>
        /// <param name="pageInfo"></param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult List(WorkDetailsModel filter, PageInfo pageInfo)
        {
            filter.UId=Operator.UserId;
            var result = workDetailsService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult Edit(WorkDetailsModel model)
        {
            var detailsModel = workDetailsService.ReadModel(model.Id);
            detailsModel.Remark=model.Remark;
            detailsModel.Type=1;
            var result = workDetailsService.UpdateModel(detailsModel) ? SuccessTip() : ErrorTip();
            return Json(result);


        }


    }
}