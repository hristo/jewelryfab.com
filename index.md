# Posts
{% for post in site.posts %}
  <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
###  [{{ post.title }}]({{ post.url }})
  <p><span style="font-size:64pt">&ldquo;</span>{{ post.excerpt}}</p>
{% endfor %}
