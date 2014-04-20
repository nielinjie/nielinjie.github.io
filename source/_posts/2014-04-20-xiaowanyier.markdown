---
layout: post
title: "向Octopress贡献：动态内容"
date: 2014-04-20 23:06:38 +0800
comments: true
categories: [开发, octopress]
---

同学们往右看：就是那个一坨一坨飘一飘的东西。8-D  
每个圆表示一个category，它的大小表示该category名下文章的数量（相对的）；两个圆之间的连线表示两个category有联系，也就是说有文章同时属于这两个category。
两个圆距离越近，则category的关系越密切，同时属于这两个category的文章越多。  
点击圆形，将来到一个显示该category下所有文章的页面。

<!-- more -->

这只是一个初步的demo，有兴趣的同学可以沿着这个思路创造更多有意思的动态内容。

* 新建一个静态的文件，让Jekyll在generate的时候将整个site的数据写进去。这里我放在根目录，用的是json格式。
* 定制aside添加一个html文件，我这里是category.html。
* category.html里面用js绘制需要的动态内容。引用上面的json文件，你可以利用所有数据为所欲为。
* 代码看这里：[http://github.com/nielinjie/nielinjie.github.io/commit](http://github.com/nielinjie/nielinjie.github.io/commit/3abeab7a7f6d5170be3ae1f7294314470063e88b)。

至于显示category文章的页面，比较简单。通过url上queryString传递相应参数即可。
