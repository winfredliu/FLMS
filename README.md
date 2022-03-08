# FLMS

不要乱删，或乱改别人的文件！文件修改之后，及时add和commit，不要放在暂存区和工作区里。

## 项目组第一天

测试使用dev分支，用完及删除，暂时保留sql和README.md

## 项目组第六天

### 开发情况：

简易版人事And工资信息管理系统

开发工具：IDEA+Maven+Tomcat

技术栈：

- 后端：Spring+SpringMVC+Mybatis+MySQL
- 前端：Bootstrap前端框架+jsp+ajax+jquery

项目描述：项目分为四大模块，分别是员工信息管理，公司职位管理，人事管理，账号管理，共为系统设置了四大角色，公司高层，财务，普通员工，系统管理员。

- 系统管理员对所有用户账号进行管理，拥有查询，删除还有修改某个账号权限等功能
- 公司高层进行员工信息管理，公司职位管理，以及人事管理，可以查询员工工资信息
- 财务负责工资管理，工资结算，导出工资报表
- 员工和每个角色都可以查询自己的工资记录，查询公司公布的职位信息

实现功能：

- 系统的登录、注册、修改密码、修改账号个人信息
- 对员工信息，公司职位信息的增删改，以及条件查询
- 人事管理，包括为员工添加职位，员工职位的修改
- 工资结算，工资发放，工资按月份查询，以及其余条件查询，导出工资Excel报表

## 项目组第七天

对项目进一步开发

### 数据库介绍

#### jobs（岗位表）

jsalary: 基本工资

jbonus: 奖金

员工应发工资=jsalary+jbonus，董事长暂不设置工资

jdept: 部门

jname: 岗位名称

jno: 岗位编号，编号唯一

jid: 主键

#### user（登陆注册用户表）

user_id: 主键

usercode: 用户名

password: 登陆密码

authority: 用户级别，分为公司高层，系统管理员，财务，普通员工

wno: 工号（外键，与wokers.wno绑定）

注意：暂时存在一个小问题，注册用户时，该用户的工号已经绑定，工号又与职位绑定。假设员工后来升职或换岗（用户级别发生改变），但该员工登陆系统不会改变，因为级别不会变，所以修改员工改为信息时，应该同步修改user的authority（事务）。

#### wj(工号与岗位编号一对一关系表)

id: 主键

wno: 工号（外键，与wokers.wno绑定）

jno: 岗位编号，编号唯一（外键，与jobs.jno绑定）

#### workers（员工表）

wid: 主键

wno: 工号

wname: 员工名

wsex: 性别

wnative: 籍贯

wphone: 手机号（未设置检验）

#### wsalary

wsid: 主键

wno：工号

wname: 名字

jno: 岗位编号

jname: 岗位名称

jdept: 岗位部门

jsalary: 每月基本工资

jbonus: 每月奖金

董事长不设置jsalary和jbonus

### 登录逻辑验证

一些相关类请阅读项目源码和jvm源码

```java
// 用户登录
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode, String password,String validateCode, Model model, HttpSession session) {
		// 通过账号密码查询用户
		User user = userService.findUser(usercode, password);
		System.out.println(user);
		if (user != null) {
			String rightCode= (String) session.getAttribute(ValidateCode.VALIDATECODE);
			if(rightCode.equalsIgnoreCase(validateCode)){
				// 将用户对象添加到Session
				user.setPassword(null);
				session.setAttribute("USER_SESSION", user);
				String auth=user.getAuthority();
				switch (auth.trim()){
					case "财务":
						return "customer";
					case "系统管理员":
						return "admin";
					case "普通员工"	:
						return "employee";
					case "公司高层"	:
						return "leader";
				}
			}
			else{
				model.addAttribute("msg", "验证码输入错误！");
				return "login";
			}
		}
		model.addAttribute("msg", "账号或密码错误！");
		return "login";
	}
```

具体原理不再阐述

注册用户指定级别

```java
// 注册
	@RequestMapping(value = "/Register.action", method = RequestMethod.POST)
	public String Register(User user, Model model) {
		String wno=user.getWno();
		Wj wj = wjService.findWJByWno(wno);
		String jno = wj.getJno();
		List<Jobs> jobsByJno = jobService.findJobsByJno(jno);
		String jname = jobsByJno.get(0).getJname();
		String jdept = jobsByJno.get(0).getJdept();
		if(jname.contains("经理")||jname.contains("董事长")){
			user.setAuthority("公司高层");
		}else if(jdept.contains("财务部")){
			user.setAuthority("财务");
		}else if(jname.contains("信息化专员")){
			user.setAuthority("系统管理员");
		}else{
			user.setAuthority("普通员工");
		}
		userService.insertUser(user);
		model.addAttribute("msg", "注册成功,请登录");
		return "login";
	}
```

嗯，是不是相当简单呢？理论上可以再划分更多的级别。

