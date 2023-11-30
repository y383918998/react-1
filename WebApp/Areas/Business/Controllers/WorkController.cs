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
    public class WorkController : BaseController
    {
        public IWorkService workService { get; set; }
        public IUserService userService { get; set; }
        public IWorkDetailsService workDetailsService { get; set; }

        public SelectList UserList { get { return new SelectList(userService.GetUserList(4), "Id", "RealName"); } }
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
        public JsonResult List(WorkModel filter, PageInfo pageInfo)
        {
            var result = workService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = workService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }


        public ActionResult Add()
        {
            ViewBag.UId = UserList;
            return View();
        }
        [HttpPost]
        public ActionResult Add(WorkModel model)
        {


            if ((model.EndTime.Minute-model.BeginTime.Minute)%15!=0)
            {
                return Json(ErrorTip("Time range error"));
            }
            model.CreateOn = DateTime.Now;
            model.CreateBy = Operator.UserId;
            var id = workService.AddModel(model);
            var result = id>0 ? SuccessTip() : ErrorTip();
            if (id>0)
            {
                var beginTime = model.BeginTime;
                var endTime = model.BeginTime;
                int i = 0;
                while (endTime<model.EndTime)
                {
                    if (i>0)
                    {
                        beginTime=endTime.AddMinutes(1);
                    }
                    
                    endTime=endTime.AddMinutes(15);
                    WorkDetailsModel  detailsModel = new WorkDetailsModel();
                    detailsModel.PID=id;
                    detailsModel.CreateOn = DateTime.Now;
                    detailsModel.CreateBy = Operator.UserId;
                    detailsModel.BeginTime=beginTime;
                    detailsModel.EndTime=endTime;
                    detailsModel.Status=false;
                    detailsModel.UId=0;
                    workDetailsService.CreateModel(detailsModel);
                    i++;
                   

                }
            }
           


            return Json(result);
        }

     
        public ActionResult Edit(int Id)
        {
            var model = workService.ReadModel(Id);
            ViewBag.UId = UserList;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(WorkModel model)
        {
            if ((model.EndTime.Minute-model.BeginTime.Minute)%15!=0)
            {
                return Json(ErrorTip("Time range error"));
            }
            model.CreateOn = DateTime.Now;
            model.CreateBy = Operator.UserId;
            var oldData= workService.ReadModel(model.Id);
            var result = workService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            //删掉以前范围的数据
            workDetailsService.DeleteByWhere(" where begintime>='"+oldData.BeginTime+"' and endtime <='"+oldData.EndTime+"'");
            var beginTime = model.BeginTime;
            var endTime = model.BeginTime;
            int i = 0;
            while (endTime<model.EndTime)
            {
                if (i>0)
                {
                    beginTime=endTime.AddMinutes(1);
                }
                endTime=endTime.AddMinutes(15);
                WorkDetailsModel detailsModel = new WorkDetailsModel();
                detailsModel.PID=model.Id;
                detailsModel.CreateOn = DateTime.Now;
                detailsModel.CreateBy = Operator.UserId;
                detailsModel.BeginTime=beginTime;
                detailsModel.EndTime=endTime;
                detailsModel.Status=false;
                detailsModel.UId=0;
                workDetailsService.CreateModel(detailsModel);
                i++;
            }
            return Json(result);
        }

        [HttpPost]
        public ActionResult Copy()
        {
            var data= workService.GetWeek();
            if (data.Count>0)
            {
                foreach (var item in data)
                {
                    item.BeginTime=item.BeginTime.AddDays(7);
                    item.EndTime=item.EndTime.AddDays(7);
                    var id= workService.AddModel(item);
                    if (id>0)
                    {
                        var beginTime = item.BeginTime;
                        var endTime = item.BeginTime;
                        workDetailsService.DeleteByWhere(" where begintime>='"+beginTime+"' and endtime <='"+endTime+"'");
                        int i = 0;
                        while (endTime<item.EndTime)
                        {
                            if (i>0)
                            {
                                beginTime=endTime.AddMinutes(1);
                            }
                            endTime=endTime.AddMinutes(15);
                            WorkDetailsModel detailsModel = new WorkDetailsModel();
                            detailsModel.PID=id;
                            detailsModel.CreateOn = DateTime.Now;
                            detailsModel.CreateBy = Operator.UserId;
                            detailsModel.BeginTime=beginTime;
                            detailsModel.EndTime=endTime;
                            detailsModel.Status=false;
                            detailsModel.UId=0;
                            workDetailsService.CreateModel(detailsModel);
                            i++;
                        }
                    }
                }
                var result = SuccessTip();
                return Json(result);
            }
            else
            {
                return Json(ErrorTip());
            }
        }

    }
}