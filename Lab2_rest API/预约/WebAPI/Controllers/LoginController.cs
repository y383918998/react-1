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
        ////POST api/values 登入
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
            retData.Msg= "User name/password error";
            retData.Code=1001;
            return retData;
        }

        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="id"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        // PUT api/values/5  注册
        public RetData Put([FromBody] UserModel model)
        {
            RetData retData = new RetData();

            model.PassWord = Md5.md5(model.PassWord, 32);
            string sql = string.Empty;
            sql="select count(1) from t_user where username=@username";
            int ct = Data.DataHelper.ExecuteScalar(sql, new { username = model.UserName });
            if (ct>0)
            {
                retData.Code=1003;
                retData.Msg= "User already exists";
                return retData;
            }
            sql = "insert into t_user(username,password,RealName,RoleId,Status)values(@username,@password,@RealName,@RoleId,@Status)";
            ct=Data.DataHelper.Execute(sql, new { username = model.UserName, password = model.PassWord, RealName = model.UserName, RoleId = 5, Status = true });
            if (ct>0)
            {
                retData.Code=200;
                retData.Status=true;
                return retData;
            }
            retData.Code=1002;
            retData.Msg= "Invalid data";
            return retData;
        }
       
    }
}
