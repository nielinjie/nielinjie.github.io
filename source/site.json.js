---
layout: nil
---
window.site={
  posts:[
{% for post in site.posts %}
  {
    url:"{{post.url}}",
    date:"{{ post.date | date_to_xmlschema }}",
    title:"{% if site.titlecase %}{{ post.title | titlecase | cdata_escape }}{% else %}{{ post.title | cdata_escape }}{% endif %}",
    categories:[
      {% for cate in post.categories%}
        "{{cate}}",
      {% endfor %}
    ],
    series:[
      {% for ser in post.series%}
        "{{ser}}",
      {% endfor %}
    ]
  },
{% endfor %}
]
}
