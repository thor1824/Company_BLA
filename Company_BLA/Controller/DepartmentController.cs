using Company_BLA.Model;
using Company_BLA.Repository;
using System;

namespace Company_BLA.Service
{
    public class DepartmentController : IDepartmentController
    {
        private readonly IDepartmentRepository _repo;

        public DepartmentController(IDepartmentRepository repo)
        {
            _repo = repo;
        }

        /**
         *Each metod sould go somthing like:
         *Console.WriteLine("Enter Department Name:");
         *string input = Console.ReadLine();
         *rins and repeat
         */
        public void Create()
        {
            Console.WriteLine("\nEnter department Name");
            var dname = Console.ReadLine();

            Console.WriteLine("\nEnter Manager SSN");
            var mgrSSN = Int32.Parse(Console.ReadLine());

            Console.Write("\nCreating Department...");

            try
            {
                var newDep = _repo.CreateDepartment(new Department { DName = dname, MgrSSN = mgrSSN });


                if (newDep != null)
                {
                    Console.WriteLine("Done!");
                    PrintDepartment(newDep);
                }
                else
                {
                    Console.WriteLine("Failed!");
                    Console.WriteLine("Department is NULL");
                }

            }
            catch (Exception e)
            {
                Console.WriteLine("Failed!");
                Console.WriteLine("Error: " + e.Message);
            }
        }

        public void Read()
        {
            throw new NotImplementedException();

        }
        public void ReadALL()
        {
            throw new NotImplementedException();

        }
        public void UpdateName()
        {
            Console.WriteLine("\n Enter department Number");
            var dNumber = Int32.Parse(Console.ReadLine());

            Console.WriteLine("\n Enter New Department Name");
            var dName = Console.ReadLine();

            Console.Write("\nUpdating Department...");

            try
            {
                //maybe add a old name vs new name in before done need read for that. 
                _repo.UpdateDepartmentName(dNumber, dName);
                Console.WriteLine("Done!");
            }
            catch (Exception e)
            {
                Console.WriteLine("Failed!");
                Console.WriteLine("Error: " + e.Message);
            }

        }
        public void UpdateMgr()
        {
            throw new NotImplementedException();

        }
        public void Delete()
        {
            throw new NotImplementedException();

        }

        private void PrintDepartment(Department department)
        {
            Console.WriteLine($"ID:\t{department.DNumber}\nName:\t{department.DName}\nMgrSSN:\t{department.MgrSSN}\nManager Starting Date:\t{department.MgrStartDate}");
        }
    }
}
