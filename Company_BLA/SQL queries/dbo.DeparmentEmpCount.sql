
CREATE VIEW DeparmentEmpCount
AS SELECT d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate, count(e.SSN) as EmpCount
	FROM Department as d LEFT JOIN Employee as e ON e.Dno = d.DNumber
	GROUP BY d.DNumber, d.DName, d.MgrSSN, d.MgrStartDate;