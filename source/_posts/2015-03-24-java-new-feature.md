---
layout: post
title: "Java, 8765……"
date: 2015-03-24 16:06:38 +0800
comments: true
categories: ["开发"]

---

猛然瞥到Java7 马上就要EoPU了。  
目测四周的同学们，很多还生活在Java4/5时代，应该组织一个茶话会，大家一起来谈谈新特性，看看哪些能让俺们的Coding生活活得更容易，又有哪些能让我们的程序更强大。

<!-- more -->

如上，我已将特性的意义分为两个方面，一方面是帮助Coding，让俺们J农的Coding生活更容易，这里的Coding一般指既定框架下的业务逻辑Coding。另一方面是创造更多的可能性，或者使这种创造更容易，倾向于构建良好的系统结构。

### 帮助Coding
1.  枚举
1.  范型
1.  异常处理
1.  Annotation
1.  线程模型  
Java5 加入了一堆的线程工具，诸如Excutor、BlockingQueue……，Java7 又引入了Fork/Join模型。
1.  Lambda和函数式接口  
函数风格编程的基础，Java8 引入。
1.  Stream风格API  
J农眼红已久，随着Lambda的加入终于拥有了。Java8 引入。
1.  Optional  
作为最简单常用的一种monad，算是给后续继续引入函数风格带一个头。就Optional本身来说，对于Java农来说也算是一种解脱的契机：请带走NullPointerException。 Java8 引入。
1.  Date API  
新的日期时间类API，又一个“终于来了”……提起旧的Date，J农苦水一筐一筐的。  
据说就是Joda date库直接搬来的，其实还是略有不同。 Java8 引入。  
[http://www.tuicool.com/articles/2Yvmeu](http://www.tuicool.com/articles/2Yvmeu)
	  
### 创造更多

1.  范型和枚举  
作为类型系统的完善，也许能帮助我们表达设计意图，做出更加鲁棒的框架。
1.  Annotation
1.  脚本引擎和Compiler API   
1.  线程模型 
1.  Lambda等函数特征  
函数风格的编程成为可能：  
	1. 那些适合建模成函数风格的业务也许可以有更恰当的表达。  
	2. 以函数为复用单位，函数跟函数组合，跟对象与对象组合，有不同的组合方式。  
	
	比如说，一个scala的http server框架——unfiltered。  
这个框架把响应http请求的过程抽象为一个函数：Request -> ResponseFunction, 同时ResponseFunction又是一个函数：Response -> Response。函数风格的组合让响应过程看起来非常简洁。  
	现在使用Java也可以尝试搭建类似的风格了。
	