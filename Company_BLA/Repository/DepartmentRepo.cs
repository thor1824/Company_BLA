using Company_BLA.Model;
using System;
using System.Collections.Generic;

namespace Company_BLA.Repository
{
    public class DepartmentRepo : IDepartmentRepository
    {
        public Department CreateDepartment(Department department)
        {
            //using (var con = ConnectionFactory.GetUserConnection())
            //{
            //    con.Open();

            //    Console.WriteLine("Connection open");

            //    con.Close();
            //}
            throw new NotImplementedException();
        }

        public void DeleteDepartment(int dNumb)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Department> GetAllDepartment()
        {
            throw new NotImplementedException();
        }

        public Department GetDepartment(int id)
        {
            throw new NotImplementedException();
        }

        public void UpdateDepartmentManager(int dNumb, string mgrSSN)
        {
            throw new NotImplementedException();
        }

        public void UpdateDepartmentName(int dNumb, string dName)
        {
            throw new NotImplementedException();
        }
    }
}
