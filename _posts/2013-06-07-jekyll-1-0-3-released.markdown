---
layout: news_item
title: "Jekyll 1.0.3 Released"
date: "2013-06-07 21:02:13 +0200"
author: parkr
version: 1.0.3
categories: [release]
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[]
---

<!--original
---
layout: news_item
title: "Jekyll 1.0.3 Released"
date: "2013-06-07 21:02:13 +0200"
author: parkr
version: 1.0.3
categories: [release]
---
-->

v1.0.3 contains some key enhancements and bug fixes:

<!--original
v1.0.3 contains some key enhancements and bug fixes:
-->

- Fail with non-zero exit code when MaRuKu errors ([#1190][]) or Liquid errors ([#1121][])
- Add support for private gists to `gist` tag ([#1189][])
- Add `--force` option to `jekyll new` ([#1115][])
- Fix compatibility with `exclude` and `include` with pre-1.0 Jekyll ([#1114][])
- Fix pagination issue regarding `File.basename` and `page:num` ([#1063][])

<!--original
- Fail with non-zero exit code when MaRuKu errors ([#1190][]) or Liquid errors ([#1121][])
- Add support for private gists to `gist` tag ([#1189][])
- Add `--force` option to `jekyll new` ([#1115][])
- Fix compatibility with `exclude` and `include` with pre-1.0 Jekyll ([#1114][])
- Fix pagination issue regarding `File.basename` and `page:num` ([#1063][])
-->

See the [History][] page for more information on this release.

<!--original
See the [History][] page for more information on this release.
-->

{% assign issue_numbers = "1190|1121|1189|1115|1114|1063" | split: "|" %}
{% for issue in issue_numbers %}
[#{{ issue }}]: {{ site.repository }}/issues/{{ issue }}
{% endfor %}

[History]: /docs/history/#v1-0-3

<!--original
{% assign issue_numbers = "1190|1121|1189|1115|1114|1063" | split: "|" %}
{% for issue in issue_numbers %}
[#{{ issue }}]: {{ site.repository }}/issues/{{ issue }}
{% endfor %}

[History]: /docs/history/#v1-0-3
-->
