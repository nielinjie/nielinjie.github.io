---
layout: post
title: "Android 上的 Scala， 实战之路（二）"
date: 2011-11-14 16:04:04 +0800
comments: true
categories: [Scala, Android]
---


### 二、Hello World即遭不测

显然，首先是来一个Hello World。

<!-- more -->

直接使用android-plugin的项目模板。生成的程序非常简单，当然，Hello World都非常简单。
Activity类的代码如下。
```
class MainActivity extends Activity {  
  override def onCreate(savedInstanceState: Bundle) {  
    super.onCreate(savedInstanceState)  
    setContentView(new TextView(this) {  
      setText("Hello World")  
    })  
  }  
}  
```
很简单，可以运行，就不截图了。
然后我把我的代码改成这样。

```
import Helper._  
class MainActivity extends Activity {  
  override def onCreate(savedInstanceState: Bundle) {  
    super.onCreate(savedInstanceState)  
    setContentView((new TextView(this)).doto {  
      text =>  
      text.setText("Hello World")  
    })  
  }  
}  
```

这里的doto方法是我自己的一个公共模块里的方法（作为一个jar引入到工程中）,是我从clojure里面看着顺眼结果来的，作用是有机会调用一个object的一系列方法，然后还能返回这个对象本身。代码如下——
```
object Helper {  
  implicit def helpersWrap[A](obj: A) = new {  
    def doto(f: A => Unit): A = {  
      val re = obj  
      f(re)  
      re  
    }  
  }  
}  
```

再运行，不测——NoSuchMethodException
看了log，发现了问题在于——虚拟机企图在Object上去找doto方法，肯定是找不到的。
于是我换了一种写法——
```
object Helper2 {  
  class Wrapped[A](val obj:A){  
    def doto(f: A => Unit): A = {  
      val re = obj  
      f(re)  
      re  
    }  
  }  
  implicit def helpersWrap[A](obj: A) = new Wrapped(obj)  
}  
```
可以运行了，然而问题在哪里呢？为什么jvm中运行效果一样的两种写法在Dalvik虚拟机里面表现出不一样的结果呢？
看了一下两种写法编译出来的class代码
第一种（运行错误的一种——object Helper）
{% img /images/scala_on_android/help2.png%}


第二种（运行正确的一种——object Helper2）
{% img /images/scala_on_android/help1.png%}




可以看到，两种写法编译出来的方法type不同，主要是返回类型不同。这种差异确实是源代码差异的直接体现。从被调用方的情况看不出什么特别的情况。于是转换一下思路，从调用方来看看呢。
专门写了个简单的调用方，代码如下——
```
object UseHelper {  
  import Helper._  
  def test = {  
    "hellow helper".doto {  
      s =>  
        s.length()  
    }  
  }  
}  
object UseHelper2 {  
  import Helper2._  
  def test = {  
    "hellow helper".doto {  
      s =>  
        s.length()  
    }  
  }  
}  
```
编译，再次看class文件。
UseHelper
{% img /images/scala_on_android/use1.png%}



UseHelper2
{% img /images/scala_on_android/use2.png%}




可以看到，编译出来的class代码是非常不同的。
虽然源代码几乎相同，但Helper的调用方使用的是reflection方式的调用，而Helper2的调用方没有使用Reflection，直接是调用了特定的类上面的方法。
那么为什么使用reflection的方式在Dalvik虚拟机上不能正常运行呢？有待进一步的研究。
