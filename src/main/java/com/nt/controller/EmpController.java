package com.nt.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.Employee;
import com.nt.service.IEmployeeMgmtService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmpController {

	@Autowired
	private IEmployeeMgmtService empService;

	@GetMapping("/")
	public String showHome() {
		return "home";
	}

	@GetMapping("/report")
	public String showEmployeeReport(Map<String, Object> map) {
		System.out.println("EmployeeOperationController.showEmployeeReport()");

		Iterable<Employee> itEmps = empService.getAllEmployee();
		System.out.println("Employee data: " + itEmps);

		map.put("empsList", itEmps);

		return "show_employee_report";
	}

	@GetMapping("/emp_add")
	public String showFromForsaveEmployee(@ModelAttribute("emp") Employee emp) {
		return "register_employee";
	}

	@PostMapping("/emp_add")
	public String saveEmployee(@ModelAttribute("emp") Employee emp, HttpSession ses) {

		String msg = empService.registerEmployee(emp);

		ses.setAttribute("resultMsg", msg);

		return "redirect:report";
	}

	@GetMapping("/emp_edit")
	public String showEditEmployeeFromPage(@RequestParam("no") int no, @ModelAttribute("emp") Employee emp) {
		Employee emp1 = empService.getEmployeeByNo(no);

		BeanUtils.copyProperties(emp1, emp);

		return "update_employee";
	}

	@PostMapping("/emp_edit")
	public String editEmployee(RedirectAttributes attrs, @ModelAttribute("emp") Employee emp) {
		String msg = empService.updateEmployee(emp);

		attrs.addFlashAttribute("resultMsg", msg);

		return "redirect:report";
	}

	@GetMapping("/emp_delete")
	public String deleteEmployee(RedirectAttributes attrs, @RequestParam int no) {
		String msg = empService.deleteEmployeeById(no);

		attrs.addFlashAttribute("resultMsg", msg);

		return "redirect:report";
	}

	@GetMapping("/emp_search")
	public String showReport(Map<String, Object> map, @ModelAttribute("emp") Employee emp) {
		try {
			List<Employee> list = empService.getAllEmployee();
			map.put("empList", list);

			return "show_report";
		} catch (Exception e) {
			e.printStackTrace();
			map.put("errorMsg", e.getMessage());
			return "error";
		}
	}

	@PostMapping("/emp_search")
	public String showReportWithDynamicSearch(@ModelAttribute("emp") Employee emp, Map<String, Object> map) {

		List<Employee> list = empService.showEmployeeReportWithDynamicSearch(emp);

		System.out.println("EmpController.showReportWithDynamicSearch()");
		map.put("empsList", list);

		return "show_employee_report";
	}
}
