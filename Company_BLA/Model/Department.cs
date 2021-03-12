using System;

namespace Company_BLA.Model
{
    public class Department
    {
        public int? DNumber { get; set; }
        public string DName { get; set; }
        public decimal MgrSSN { get; set; }
        public int? NumberOfEmployee { get; set; }
        public DateTime? MgrStartDate { get; set; }
    }
}
