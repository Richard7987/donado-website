---
layout: default
permalink: /videos/
title: videos
nav: true
nav_order: 3
description: Talks, interviews, and outreach appearances.
---

<div class="post">
  <header class="post-header">
    <h1 class="post-title">Fernando Donado on the Internet</h1>
    <p class="post-description">{{ page.description }}</p>
  </header>

  <article>
    {%- assign videos = site.data.videos.videos | sort: "date" | reverse -%}
    <div class="row row-cols-1 row-cols-md-2">
      {%- for v in videos %}
      <div class="col mb-4">
        <div class="video-card">
          {% include video_thumb.liquid url=v.url %}
          <h3>{{ v.title }}</h3>
          {% if v.date %}<p class="post-meta">{{ v.date | date: "%B %Y" }}</p>{% endif %}
          {% if v.description %}<p>{{ v.description }}</p>{% endif %}
        </div>
      </div>
      {%- endfor %}
    </div>
  </article>
</div>
