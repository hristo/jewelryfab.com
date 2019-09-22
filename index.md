# Posts
{% for post in site.posts %}
  <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_long_string }}</time>
###  [{{ post.title }}]({{ post.url }})
  <p><span style="font-size:32pt">&ldquo;</span> {{ post.excerpt | remove: '<p>' | remove: '</p>' }}</p>
{% endfor %}
