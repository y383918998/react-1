using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class UserModel
    {
        public string UserName { get; set; }
        public string PassWord { get; set; }
    }


    public class UserViewModel
    {
        public string UserName { get; set; }
        public int Id { get; set; }
    }
}