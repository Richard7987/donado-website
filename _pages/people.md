---
layout: page
permalink: /people/
title: people
description: >
  Students trained in the group. To date: 5 PhD, 3 MSc, and 7 BSc theses
  completed.
nav: true
nav_order: 1
---

{%- assign degrees = "phd,msc,bsc" | split: "," -%}
{%- assign labels = "PhD,MSc,BSc" | split: "," -%}
{%- assign states = "current,alumni" | split: "," -%}

<div class="people">
{%- for state in states -%}
{%- assign count = 0 -%}
{%- for d in degrees -%}{%- assign grp = site.data.people[d] | where: "status", state -%}{%- assign count = count | plus: grp.size -%}{%- endfor -%}
{%- if count > 0 %}
<h2>{% if state == "current" %}Current students{% else %}Alumni{% endif %}</h2>
{%- for d in degrees -%}
{%- assign idx = forloop.index0 -%}
{%- assign grp = site.data.people[d] | where: "status", state -%}
{%- if grp.size > 0 %}
<h3>{{ labels[idx] }}</h3>
<table class="table table-sm">
<tbody>
{%- for p in grp %}
<tr>
<td style="white-space:nowrap;vertical-align:top"><strong>{% if p.url %}<a href="{{ p.url }}">{{ p.name }}</a>{% else %}{{ p.name }}{% endif %}</strong></td>
<td style="white-space:nowrap;vertical-align:top;color:var(--global-text-color-light)">{{ p.years }}</td>
<td style="vertical-align:top">{% if p.thesis %}<em>{{ p.thesis }}</em>{% endif %}{% if p.now %}<br><span style="color:var(--global-text-color-light)">Now: {{ p.now }}</span>{% endif %}</td>
</tr>
{%- endfor %}
</tbody>
</table>
{%- endif -%}
{%- endfor -%}
{%- endif -%}
{%- endfor %}
</div>

<p class="mt-4" style="color:var(--global-text-color-light)">
Prospective students: email <a href="mailto:fernando@uaeh.edu.mx">fernando@uaeh.edu.mx</a>.
</p>
