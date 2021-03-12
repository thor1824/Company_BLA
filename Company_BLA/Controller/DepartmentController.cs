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
            Console.WriteLine("\nEnter Department Id");
            var id = Int32.Parse(Console.ReadLine());
            var dep = _repo.GetDepartment(id);
            Console.WriteLine("");
            PrintDepartment(dep);

        }
        public void ReadALL()
        {
            Console.Write("\nFetching All Departments...");

            var departments = _repo.GetAllDepartment();

            Console.WriteLine("Done!");
            Console.WriteLine("\n Deparments:");
            Console.WriteLine("------------------------------------------");
            foreach (var item in departments)
            {
                PrintDepartment(item);
                Console.WriteLine("------------------------------------------");

            }

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
            Console.WriteLine("\n Enter department Number");
            var dNumber = Int32.Parse(Console.ReadLine());

            Console.WriteLine("\n Enter New Manager SSN");
            var mgrSSN = Int32.Parse(Console.ReadLine());

            Console.Write("\nUpdating Department...");

            try
            {
                _repo.UpdateDepartmentManager(dNumber, mgrSSN);
                Console.WriteLine("Done!");
            }
            catch (Exception e)
            {
                Console.WriteLine("Failed!");
                Console.WriteLine("Error: " + e.Message);
            }

        }
        public void Delete()
        {
            Console.WriteLine("\n Enter department Number");
            var dNumber = Int32.Parse(Console.ReadLine());


            Console.Write("\nDeleting the Department...");

            try
            {
                _repo.DeleteDepartment(dNumber);
                Console.WriteLine("Done!");
            }
            catch (Exception e)
            {
                Console.WriteLine("Failed!");
                Console.WriteLine("Error: " + e.Message);
            }

        }

        private void PrintDepartment(Department department)
        {
            Console.WriteLine($"ID:\t{department.DNumber}\nName:\t{department.DName}\nMgrSSN:\t{department.MgrSSN}\nManager Starting Date:\t{department.MgrStartDate}");
        }
    }
}
