package springmvc.handlers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.dao.DepartmentDao;
import springmvc.dao.EmployeeDao;
import springmvc.entities.Employee;
//交给控制器管理
//交给控制器管理
@Controller
public class EmployeeHandler {
	//完成属性注入
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private DepartmentDao departmentDao;
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	public String findAll(Map<String,Object> map){//map集合用于存放数据在request域中，返回到页面
		map.put("emplist",employeeDao.getAll());
		return "list";
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.GET)
	public String toAdd(Map<String, Object> map){
		map.put("deplist", departmentDao.getDepartments());
		/**
		 * 表单回显必须强烈注意
		 */
		map.put("command", new Employee());
		return "add";
	}
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public String doAdd(Employee employee){//通过pojo对象封装提交的数据
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id){
		employeeDao.delete(id);
		return "redirect:/emps";
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public String toupdate(@PathVariable("id") Integer id,Map<String, Object> map){
		map.put("deplist", departmentDao.getDepartments());
		map.put("command", employeeDao.get(id));
		return "update";
	}
	//更新操作
	//只是单单下面不满足要求
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	public String doupdate(@ModelAttribute(value="update") Employee employee){
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	//还要包含下面部分
	//每一个处理器方法之前都要执行，必须设置required=false
	@ModelAttribute
	public void getEmployee(@RequestParam(value="id",required=false) Integer id,Map<String, Object> map){
		//完成先查，用查好的对象再装
		Employee employee = employeeDao.get(id);
		map.put("update", employee);
	}
}
