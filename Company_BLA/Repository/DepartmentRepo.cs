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
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_DeleteDepartment", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DNumber", dNumb);

                cmd.ExecuteNonQuery();

            }
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
                            MgrSSN = (decimal)rdr["MgrSSN"],
                            MgrStartDate = (DateTime)rdr["MgrStartDate"],
                            NumberOfEmployee = (int)rdr["EmpCount"]
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
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_GetDepartment", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DNumber", id);

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    rdr.Read();
                    var dep = new Department
                    {
                        DName = (string)rdr["DName"],
                        DNumber = (int)rdr["DNumber"],
                        MgrSSN = (decimal)rdr["MgrSSN"],
                        MgrStartDate = (DateTime)rdr["MgrStartDate"],
                        NumberOfEmployee = (int)rdr["EmpCount"]
                    };
                    return dep;
                }
            }
        }

        // Christian
        public void UpdateDepartmentManager(int dNumb, int mgrSSN)
        {
            using (var conn = ConnectionFactory.GetUserConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_UpdateDepartmentManager", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DNumber", dNumb);
                cmd.Parameters.AddWithValue("@MgrSSN", mgrSSN);

                cmd.ExecuteNonQuery();
            }
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
        }
    }
}
