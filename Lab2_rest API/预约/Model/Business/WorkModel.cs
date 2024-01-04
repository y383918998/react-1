using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_work")]
    public class WorkModel: Entity
    {

        public int UId { get; set; }

        public DateTime BeginTime { get; set; }
        public DateTime EndTime { get; set; }

        [Computed]
        public string RealName { get; set; }


    }
}
