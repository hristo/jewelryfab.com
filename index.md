# Posts
{% for post in site.posts %}
  <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
###  [{{ post.title }}]({{ post.url }})
  {{ <span style="font-size:64px">&ldquo;</span> post.excerpt }}
{% endfor %}
