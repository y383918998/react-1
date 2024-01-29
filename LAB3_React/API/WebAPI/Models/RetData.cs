using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class RetData
    {

        public int Code { get; set; }
        public bool Status { get; set; }
        public string Msg { get; set; }
        public object Data { get; set; }
    }
}