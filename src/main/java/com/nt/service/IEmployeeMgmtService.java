package com.nt.service;

import java.util.List;

import com.nt.model.Employee;

public interface IEmployeeMgmtService {
   public List<Employee>getAllEmployee(); 
   
   public String registerEmployee(Employee emp);
   
   public Employee getEmployeeByNo(int empno);
   
   public String updateEmployee(Employee emp);
   
   public String deleteEmployeeById(int empno);
   
   public List<Employee> showEmployeeReportWithDynamicSearch(Employee emp);
}
