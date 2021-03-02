using System;

namespace Company_BLA.Model
{
    public class Department
    {
        public int? DNumber { get; set; }
        public string DName { get; set; }
        public int MgrSSN { get; set; }
        public DateTime? MgrStartDate { get; set; }
    }
}
