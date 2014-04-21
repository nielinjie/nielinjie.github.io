---
layout: post
title: "Android 上的 Scala， 实战之路（一）"
date: 2011-11-14 15:04:04 +0800
comments: true
categories: [Scala, Android]
series: ["Android上的Scala 2"]

---

### 一、先开始再说


因为已经习惯用Scala开发，所以在开始尝试Android平台开发的时候，没有使用Java。
在这个文章系列中，将把尝试的过程和遇到的问题（希望都能带上解决办法）分享给大家，希望对大家有所帮助。
<!-- more -->



先讲讲开发环境。对于比较熟悉Java编程的同学，开发工具应该说关系不大，如果没有找到既能支持Scala又能支持Android的IDE，我们还有终极方案——命令行。只要能了解清楚Scala编译和Android构建的各个步骤，都能找到对应的命令行工具。
我自己的情况是已经习惯了sbt, 如果大家也使用sbt，android-plugin（https://github.com/jberkel/android-plugin ）将是个非常有帮助的build工具。

构建过程并不复杂，与Java的Android开发没有太多不同。只是把Java的编译，变成Scala编译。
有一个步骤可能需要说明一下。

proguard，这个步骤比较特别，貌似Java开发不一定需要这一步。其作用是把依赖的.jar文件进行裁剪，只保留下有用的class和方法，使得最终部署的文件足够小。对于Java开发的同学，如果依赖的东西不多，这一步就不一定要做。如果依赖了较多的jar文件，就可以尝试用这个步骤，把jar里面需要的class和方法抠出来。对于Scala开发的同学，一般这一步是必须的，毕竟每个可运行的Scala程序都依赖于Scala runtime包，而这个包自己就相当不小。这一步是事故多发地带，以后会再提到。
