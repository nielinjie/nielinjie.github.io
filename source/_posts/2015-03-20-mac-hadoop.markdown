---
layout: post
title: "Mac上尝试Hadoop"
date: 2015-03-20 17:06:38 +0800
comments: true
categories: ["开发","Hadoop"]
published: false

---


在Mac单机上安装和尝试了一下Hadoop。
<!-- more -->

1. 安装Hadoop：  
  	* [installing-hadoop-on-mac-osx-yosemite](http://amodernstory.com/2014/09/23/installing-hadoop-on-mac-osx-yosemite/)， 完全照着装的。
2. 简单的代码：  
	* [Gist](https://gist.github.com/nielinjie/4a1d8cbfda7d76c559a5)  
	* 使用的时[前一篇](/blog/2015/03/17/pped2kLinks/)中皮皮书屋的资源列表，从edonkey连接中解码出名称。没什么实际意义，纯粹试试环境能不能用。
3. 运行：  
IDE里面可以直接运行，只讲一下classpath：  
我加入了下面目录中的所有jar，应该有些不是必须的。但先这样来吧。

		(base)/common/
		(base)/common/lib/
		(base)/hdfs/
		(base)/mapreduce/
		(base)/yarn/

	其中的`base`是hadoop安装目录里面的库目录，在我这个安装里面是`/usr/local/Cellar/hadoop/2.6.0/libexec/share/hadoop/`
