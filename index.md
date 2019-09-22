# Posts
{% for post in site.posts %}
  <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
###  [{{ post.title }}]({{ post.url }})
  <table><tr><td style="vertical-align:top"><span style="font-size:32pt">&ldquo;</span></td><td>{{ post.excerpt | remove: '<p>' | remove: '</p>' }}</td></tr></table>
{% endfor %}
