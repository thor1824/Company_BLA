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
            throw new NotImplementedException();
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
            throw new NotImplementedException();

        }
        public void UpdateMgr()
        {
            throw new NotImplementedException();

        }
        public void Delete()
        {
            throw new NotImplementedException();

        }
    }
}
