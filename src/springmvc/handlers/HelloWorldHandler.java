package springmvc.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//类似Sturts2中的Action
//把Handler交给控制器管理（每个Handler都是单例的）
@Controller
public class HelloWorldHandler {
	@RequestMapping(value="/helloWorld")
	public String helloWorld(){
		System.out.println("hello world...");
		return "success";
	}
	@RequestMapping(value="/testRequestParam")
	public String testRequestParam(@RequestParam(value="username") String username,@RequestParam(value="age") 
	 Integer age){
		System.out.println(username+"---"+age);
		return "success";
	}
	@RequestMapping(value="/testPathVariable/{id}")
	public String testPathVariable(@PathVariable(value="id") Integer id){
		System.out.println(id);
		return "success";
	}
}
