using Company_BLA.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Company_BLA.Repository
{
    public class DepartmentRepo : IDepartmentRepository
    {
        // Thorbjørn
        public Department CreateDepartment(Department department)
        {
            Department returnDepartment;
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_CreateDepartment", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DName", department.DName);
                cmd.Parameters.AddWithValue("@MgrSSN", department.MgrSSN);

                var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                var newId = (int)returnParameter.Value;
                department.DNumber = newId;
                department.MgrStartDate = DateTime.UtcNow;
                returnDepartment = department;
            }
            return returnDepartment;
        }

        // Christian
        public void DeleteDepartment(int dNumb)
        {
            throw new NotImplementedException();
        }

        // Thorbjørn
        public IEnumerable<Department> GetAllDepartment()
        {
            var departments = new List<Department>();
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_GetAllDepartments", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        var dep = new Department
                        {
                            DName = (string)rdr["DName"],
                            DNumber = (int)rdr["DNumber"],
                            MgrSSN = (int)rdr["MgrSSN"],
                            MgrStartDate = (DateTime)rdr["MgrStartDate"],
                            numberOfEmployee = (int)rdr["NoEmployee"]
                        };
                        departments.Add(dep);
                    }
                }
            }
            return departments;
        }

        // Christian
        public Department GetDepartment(int id)
        {
            //using (SqlDataReader rdr = cmd.ExecuteReader())
            //{
            //    // iterate through results, printing each to console
            //    while (rdr.Read())
            //    {
            //        Console.WriteLine("Product: {0,-35} Total: {1,2}", rdr["ProductName"], rdr["Total"]);
            //    }
            //}
            throw new NotImplementedException();
        }

        // Christian
        public void UpdateDepartmentManager(int dNumb, string mgrSSN)
        {
            throw new NotImplementedException();
        }

        // Thorbjørn
        public void UpdateDepartmentName(int dNumb, string dName)
        {
      
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_UpdateDepartmentName", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DNumber", dNumb);
                cmd.Parameters.AddWithValue("@DName", dName);

                cmd.ExecuteNonQuery();

            }

            throw new NotImplementedException();
        }
    }
}
