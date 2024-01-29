using RightControl.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class RegisterController : ApiController
    {

        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="id"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        public RetData Register([FromBody] UserModel model)
        {
            RetData retData = new RetData();
            model.PassWord = Md5.md5(model.PassWord, 32);
            string sql = string.Empty;
            sql="select count(1) from t_user where username=@username";
            int ct = Data.DataHelper.ExecuteScalar(sql, new { username = model.UserName });
            if (ct>0)
            {
                retData.Code=1003;
                retData.Msg="用户已存在";
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
            retData.Msg="无效数据";
            return retData;
        }
    }
}
