---
layout: post
title: "分布式事务，也谈（之二）"
date: 2016-09-26 16:08:48 +0800
comments: true
categories: ["架构"]
series: ["分布式事务，也谈 2"]
published: true
---

如前一篇提到的 [^2]，本篇谈一谈实现。[^1]

<!--more-->

过程管理常常被实现为一个状态机，那就顺着这个思路尝试一番。

* 每个操作实现为一个状态机，称为“操作状态机”，它的撤销也可以视为一个操作，也实现为一个操作状态机。
* 使用一个外层状态机处理决策过程，实现决策表。称为“决策状态机”。
* 操作状态机嵌入决策状态机，作为内嵌状态[^3]。



[^1]: 按照一贯原则，此处不会有任何“干货”，也不会有任何可以直接应用的代码。
[^2]: 本篇所有概念和名词都延续自上一篇：[分布式事务，也谈](/blog/2016/09/19/transaction/)
[^3]: [Hierarchically_nested_states](https://en.wikipedia.org/wiki/UML_state_machine#Hierarchically_nested_states)