﻿using Company_BLA.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Company_BLA.Repository
{
    public class DepartmentRepo : IDepartmentRepository
    {
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
                var newId = (int) returnParameter.Value;
                department.DNumber = newId;
                department.MgrStartDate = DateTime.UtcNow;
                returnDepartment = department;
            }
            return returnDepartment;
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
