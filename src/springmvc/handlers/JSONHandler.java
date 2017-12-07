package springmvc.handlers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import springmvc.dao.EmployeeDao;
import springmvc.entities.Employee;

@Controller
public class JSONHandler {
	@Autowired
	private EmployeeDao employeeDao;
	@ResponseBody//如果添加了json包，那么通过这个注解返回的对象格式化为json字符串
	@RequestMapping(value="/testJSON")
	public Collection<Employee> testJSON(){
		Collection<Employee> emps=employeeDao.getAll();
		return emps;
	}
}
