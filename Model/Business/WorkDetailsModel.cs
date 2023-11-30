using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_workdetails")]
    public class WorkDetailsModel: Entity
    {

        public int UId { get; set; }
        public DateTime BeginTime { get; set; }
        public DateTime EndTime { get; set; }
        [Computed]
        public string RealName { get; set; }

        [Computed]
        public string DocterName { get; set; }
        public int PID { get; set; }

        [Computed]

        public string Department { get; set; }


        [Computed]

        public int Type1 { get; set; } = -1;
        public int Type { get; set; }
        public string Remark { get; set; }
    }
}
