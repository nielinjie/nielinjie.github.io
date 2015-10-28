---
layout: post
title: "WD My Book Live 作为下载机"
date: 2013-01-23 21:36:38 +0800
comments: true
categories: [个人]
---


入了一个家用存储设备： [西部数据（WD）My Book Live 3.5英寸家庭网络硬盘3TB(WDBACG0030HCH)](http://www.360buy.com/product/502047.html) 京东号称降价￥400，现在入看来还是比较合算的。
<!-- more -->
本来只是作为一个纯粹的硬盘来入手的。入了以后才发现可以用来下载。很好，可以不用开着下载电脑也不错。

### 一、BT下载
首先想到的是BT下载，也是网上提到比较多的。

网上的相关指南非常多（[比如这个](http://bbs.weiphone.com/read-htm-tid-5033256.html)），大同小异，一般先装好fpkmgr，再安装Transmission。很容易，依葫芦画瓢没有遇到任何问题。

但问题是效果不佳，在我的网络环境中，即使yyets上的热门影片往往只能数十K的速度，远远称不上理想。对于BT下载并不精通，初步看了下原因，貌似Tracker好多都连不上。不知道是种子本身的原因还是Transmission配置的原因。反正跟以前用电脑挂迅雷比起来差太远，不实用。

### 二、aria2和迅雷离线下载

这种方式是利用aria2下载迅雷离线中已经下载好的内容，相当于“取回本地”操作。

* 安装aria2，网上有很多例子，一般是使用optware安装[^1]。需要注意的是，optware自己的repository里面的aria2非常老，貌似是1.4的版本，最大的问题是没有rpc支持，远程控制不方便，比如不能使用后面提到的YAAW。我的办法是先安装这个版本，把依赖都自动装好，然后网上找了个1.15版本的文件[2]，直接替换掉1.4的文件。目前为止，运行得不错。
* 对迅雷离线页面的简单hack，从页面提取URL供aria2 http下载。有写好的js和插件。[3]
* 使用YAAW添加下载任务和管理下载过程。[4]

这种方式效果很好，宽带带宽基本占满，可以支持迅雷离线所支持的一切合适，比如http、ftp、bt、donkey、磁链等等。家人也可以随时把下载要求直接放入迅雷离线，后续统一拿到本地。




[^1]: 网上教程大多是要自己先安装optware。而我的机器里面已经有了optware，不知道是出厂带来的还是安装fpkmgr时候安装的。只需要把他（ipkg）加入到path中即可。

[2]: http://pan.baidu.com/share/link?shareid=139721&uk=2033032603
[3]: http://blog.binux.me/ThunderLixianExporter/
[4]: http://blog.binux.me/yaaw/
