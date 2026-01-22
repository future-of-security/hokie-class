---
layout: page
title: Schedule
nav_order: 2
---

# Schedule

[Jump to Current Week](#){: #current-week-btn .btn }

{% for module in site.modules %}
{{ module }}
{% endfor %}

<script>
  window.SEMESTER_START = "{{ site.semester_start }}";
</script>
<script src="{{ '/assets/js/current-week.js' | relative_url }}"></script>