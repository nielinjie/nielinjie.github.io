---
layout: post
title: "博客搬家了"
date: 2014-03-22 20:15:27 +0800
comments: true
categories: ["个人"]
---

看到了芝明同学的博客以及引擎octopress, 感觉漂亮又方便，于是把博客搬家了。
<!-- more -->
感谢octopress, 感谢芝明同学（http://zhaozhiming.github.io ），感谢github。听说github正在遭受ddos攻击，祝好运。

期间只遇到一个编码问题，如下。感谢这位同学的博客，问题很快解决了。
http://fedcuit.github.io/blog/2012/08/02/config-octopress-on-mac/
 见文章中的最后一个问题：YAML Exception

```
➜  octopress git:(source) ✗ rake generate
## Generating Site with Jekyll
identical source/stylesheets/screen.css
Configuration from /Users/nielinjie/Projects/octopress/_config.yml
Building site: source -> public
YAML Exception reading 2014-03-22-new-blog-site.markdown: invalid byte sequence in US-ASCII
/Users/nielinjie/Projects/octopress/plugins/backtick_code_block.rb:13:in `gsub': invalid byte sequence in US-ASCII (ArgumentError)
	from /Users/nielinjie/Projects/octopress/plugins/backtick_code_block.rb:13:in `render_code_block'
	from /Users/nielinjie/Projects/octopress/plugins/octopress_filters.rb:12:in `pre_filter'
	from /Users/nielinjie/Projects/octopress/plugins/octopress_filters.rb:28:in `pre_render'
	from /Users/nielinjie/Projects/octopress/plugins/post_filters.rb:112:in `block in pre_render'
	from /Users/nielinjie/Projects/octopress/plugins/post_filters.rb:111:in `each'
	from /Users/nielinjie/Projects/octopress/plugins/post_filters.rb:111:in `pre_render'
	from /Users/nielinjie/Projects/octopress/plugins/post_filters.rb:166:in `do_layout'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/post.rb:195:in `render'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:200:in `block in render'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in `each'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in `render'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:41:in `process'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/bin/jekyll:264:in `<top (required)>'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/bin/jekyll:23:in `load'
	from /Users/nielinjie/.rbenv/versions/1.9.3-p0/bin/jekyll:23:in `<main>'
```
