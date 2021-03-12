using Company_BLA.Model;
using System.Collections.Generic;

namespace Company_BLA.Repository
{
    public interface IDepartmentRepository
    {
        Department CreateDepartment(Department department);
        IEnumerable<Department> GetAllDepartment();
        Department GetDepartment(int id);
        void DeleteDepartment(int dNumb);
        void UpdateDepartmentName(int dNumb, string dName);
        void UpdateDepartmentManager(int dNumb, int mgrSSN);
    }
}
