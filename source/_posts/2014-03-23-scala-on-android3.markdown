---
layout: post
title: "Android 上的 Scala， 实战之路（三）"
date: 2011-11-14 17:04:04 +0800
comments: true
categories: [Scala, Android]
series: ["Android上的Scala 3"]

---

### 三、介个是数据库接口？

完成了hello world，我便开始学习android的数据库接口。

<!-- more -->

这里提一下，受到各种文档和资料关于“Android上四大组件”的说法影响，开始一直觉得content provider对于访问数据库是必须的。后来才发现这个理解是错的，正确的理解是：content provider是用于向外发布数据的，只有需要向外提供数据的时候，应用才提供content provider。我汗。
所以对content provider的探索暂时停止了，学习数据库接口。

据说是提供完全的sqlite支持的，然而发现：功能貌似是有的，接口完全似是而非……
可以传入sql语句、放入参数、运行、遍历结果，啥都能做，问题是以一种奇怪的方式。
如果只是转换编程口音，ok，可以忍。问题在于早已依赖于jdbc之上的种种类库，sql template不能用？orm不能用？手写sql字符串拼接？手写各种get set和各种try finally close？我感到在这样的世界生活是很困难的。
于是我几乎要开始写一个jdbc drvier。


幸好找到了这个—— http://code.google.com/p/sqldroid/ 。

ps：这里提到了Android中没有暴露内建jdbc driver的原因，有兴趣的同学可以看看。
搞定了基础设施，开始搭建上层建筑。我选择的是scalaQuery（http://scalaquery.org/ ），小巧实用，强类型的sql dsl和composable的结果处理方式非常合我的胃口。
写了一小段hello world……好吧，这回是hello database。
不出大家所料：无法运行。
NullpointException抛出。


很快看出了问题，sqldroid并非是一个完全的实现，只实现了比较常使用的方法。而scalaQuery恰恰使用了不那么常用的方法。——感谢开源世界的一切，问题很容易定位并解决。
一般使用preparedStatment进行select，使用的是executeQuery方法，直接获得返回的resultset。但scalaquery不一样，它的select调用execute方法，再调用getResultset得到resultset。于是，在帮sqldroid实现了getResult方法之后，两者和谐了。

ps：此前还有NosuchMethodException（Exception还是Error？记不清楚了。）抛出，是sqldroid使用了较新android api的缘故，调整了所使用的api版本，于是我的模拟器用上了很欢型的android4。

“hello database”完整代码如下。代码还没有充分体现出scalaQuery的“强类型sql dsl”或者“composable结果处理”，这些后面应该会再做提及。
```
import org.scalaquery.ql.basic.{ BasicTable => Table }  
import org.scalaquery.ql.TypeMapper._  
import org.scalaquery.ql._  
import android.util.Log  
import org.scalaquery.session._  
import org.scalaquery.session.Database.threadLocalSession  
import org.scalaquery.ql.extended.SQLiteDriver.Implicit._  
import android.content.Context  
import android.database.sqlite.{ SQLiteDatabase, SQLiteOpenHelper }  

class Repository {  
  val dataPath = "/data/data/net.nielinjie.beautyFans"  
  val db = Database.forURL("jdbc:sqldroid:" + dataPath + "/main.sqlite", driver = "org.sqldroid.SqldroidDriver")  
  db.withSession {  
    try {  
      SitesDB.Sites.ddl  
    }  
  }  
  object Sites {  
    def list(): List[String] = {  
      db.withSession {  
        (for (s <- Query(SitesDB.Sites)) yield s.name).list  
      }  
    }  
  }  
}  

object SitesDB {  
  object Sites extends Table[(Int, String, String, Option[String])]("sites") {  
    def id = column[Int]("id", O.NotNull)  
    def name = column[String]("name")  
    def url = column[String]("url")  
    def description = column[Option[String]]("description")  
    def * = id ~ name ~ url ~ description  
  }  
}  
```
