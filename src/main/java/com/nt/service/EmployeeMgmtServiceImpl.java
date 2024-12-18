package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.nt.model.Employee;
import com.nt.repo.IEmployeeRepo;

@Service
public class EmployeeMgmtServiceImpl implements IEmployeeMgmtService {

	@Autowired
	private IEmployeeRepo empRepo;

	@Override
	public List<Employee> getAllEmployee() {
		return empRepo.findAll();
	}

	@Override
	public String registerEmployee(Employee emp) {
		return "Employee is saved with id value:" + empRepo.save(emp).getEmpno();
	}

	@Override
	public Employee getEmployeeByNo(int empno) {
		Employee emp = empRepo.findById(empno).orElseThrow(() -> new IllegalArgumentException());
		return emp;
	}

	@Override
	public String updateEmployee(Employee emp) {
		return "Employee is updated with having id value::" + empRepo.save(emp).getEmpno();
	}

	@Override
	public String deleteEmployeeById(int empno) {
		empRepo.deleteById(empno);

		return "Employee is Deleted with Id " + empno;
	}

	@Override
	public List<Employee> showEmployeeReportWithDynamicSearch(Employee emp) {
		if (emp.getEmpName() == null || emp.getEmpName().trim().isEmpty())
			emp.setEmpName(null);
		if (emp.getCity() == null || emp.getCity().trim().isEmpty())
			emp.setCity(null);
		if (emp.getSalary() == null)
			emp.setSalary(null);
		if (emp.getDeptno() == null || emp.getDeptno().toString().trim().isEmpty())
			emp.setDeptno(null);
		if (emp.getJob() == null || emp.getJob().trim().isEmpty())
			emp.setJob(null);
		
		System.out.println(emp);
		Example<Employee> example = Example.of(emp);
		List<Employee> list = empRepo.findAll(example);

		return list;
	}
}
