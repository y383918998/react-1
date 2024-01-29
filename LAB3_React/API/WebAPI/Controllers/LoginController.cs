using RightControl.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Helpers;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class LoginController : ApiController
    {
        
        /// <summary>
        /// 登入
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        // POST api/values 登入
        public RetData Post([FromBody]UserModel model)
        {
            RetData retData = new RetData();
            model.PassWord = Md5.md5(model.PassWord, 32);
            string sql = "select * from t_user where username=@username and password=@password";
            var data=Data.DataHelper.Query<UserViewModel>(sql,new {username= model.UserName,password= model.PassWord });
            if (data.Count>0)
            {
                retData.Code=200;
                retData.Status=true;
                retData.Data=data.FirstOrDefault();
                return retData;
            }
            retData.Msg="用户名/密码错误";
            retData.Code=1001;
            return retData;
        }

       

    }
}
