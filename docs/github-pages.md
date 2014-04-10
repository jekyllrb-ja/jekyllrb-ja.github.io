---
layout: docs
title: GitHub Pagesについて
prev_section: extras
next_section: deployment-methods
permalink: /docs/github-pages/
---

<!--original
---
layout: docs
title: GitHub Pages
prev_section: extras
next_section: deployment-methods
permalink: /docs/github-pages/
---
-->

[GitHub Pages](http://pages.github.com) はユーザや、組織、そしてレポジトリ
（これらはGitHubの[github.io]()ドメインあるいは、ユーザが選んだドメイン名で自由にホストされます）
のための公開できるウェブページです。GitHub Pages は
裏側でJekyllが動作しており、通常のHTMLコンテンツをサポートすることに加え、
Jekyllで動作するウェブサイトを無料でホストするとても優れた方法です。

<!--original
[GitHub Pages](http://pages.github.com) are public web pages for users,
organizations, and repositories, that are freely hosted on GitHub's
[github.io]() domain or on a custom domain name of your choice. GitHub Pages are
powered by Jekyll behind the scenes, so in addition to supporting regular HTML
content, they窶决e also a great way to host your Jekyll-powered website for free.
-->

## GitHub Pages へ Jekyll をデプロイ

<!--original
## Deploying Jekyll to GitHub Pages
-->

GitHub上のレポジトリのあるブランチを指定することでGitHub Pagesは動作します。
利用できる2つの基本的なタイプがあります:ユーザー/組織のページとプロジェクトのページです。
2,3の細かな部分を除いて、これら2つのタイプのサイトをデプロイする方法は、ほとんど同じです。

<!--original
GitHub Pages work by looking at certain branches of repositories on GitHub.
There are two basic types available: user/organization pages and project pages.
The way to deploy these two types of sites are nearly identical, except for a
few minor details.
-->

### ユーザーと組織ページ

<!--original
### User and Organization Pages
-->

GitHub Pagesファイル専用の特別なGithubレポジトリでユーザーと組織ページは動作します。
このレポジトリは、アカウント名をとって名付けられなければなりません。たとえば、
[@mojomboというユーザのレポジトリ](https://github.com/mojombo/mojombo.github.io)
は、mojombo.github.ioという名前になります。

<!--original
User and organization pages live in a special GitHub repository dedicated to
only the GitHub Pages files. This repository must be named after the account
name. For example, [@mojombo’s user page
repository](https://github.com/mojombo/mojombo.github.io) has the name
`mojombo.github.io`.
-->

あなたのレポジトリのmasterブランチの内容はGitHub Pagesサイトの構築・公開するのに
使用されるので、あなたのJekyllサイトがそこに保存されてることを確認してください。

<!--original
Content from the `master` branch of your repository will be used to build and
publish the GitHub Pages site, so make sure your Jekyll site is stored there.
-->

<div class="note info">
  <h5>カスタムドメインの場合はレポジトリ名の制限はありません</h5>
  <p>
    GitHub Pagesはまず最初に<code>username.github.io</code>サブドメインで
    動作するように構成されます。
    そして、これが<strong>カスタムドメインが利用されるとしても、</strong>
    リポジトリにこのような名前を付けられなければならない理由です。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Custom domains do not affect repository names</h5>
  <p>
    GitHub Pages are initially configured to live under the
    <code>username.github.io</code> subdomain, which is why repositories must
    be named this way <strong>even if a custom domain is being used</strong>.
  </p>
</div>
-->

### プロジェクトページ

<!--original
### Project Pages
-->

ユーザーと組織ページと違って、プロジェクトページは彼らのプロジェクトと同じリポジトリに
保存されますが、ウェブサイトコンテンツは特別な名前をつけられた`gh-pages`ブランチに保存されます。
このブランチのコンテンツはJekyllを利用して生成されます。そして出力されたものは
あなたのユーザーページのサブドメイン、例えば`username.github.io/project`
（明示的なカスタムドメインでない限り。下記参照）のような形で利用できます。

<!--original
Unlike user and organization Pages, Project Pages are kept in the same
repository as the project they are for, except that the website content is
stored in a specially named `gh-pages` branch. The content of this branch will
be rendered using Jekyll, and the output will become available under a subpath
of your user pages subdomain, such as `username.github.io/project` (unless a
custom domain is specified—see below).
-->

Jekyll プロジェクトのリポジトリ自体が — この[master ブランチ]({{ site.repository }}) 
を含むブランチ構成が — Jekyllというソフトウエアの完璧な例になっています。
しかし、Jekyllウェブサイト(あなたがたった今見ているこのサイト）は同じリポジトリの
[gh-pages ブランチ]({{ site.repository }}/tree/gh-pages) に含まれているものになります。

<!--original
The Jekyll project repository itself is a perfect example of this branch
structure—the [master branch]({{ site.repository }}) contains the
actual software project for Jekyll, however the Jekyll website (that you’re
looking at right now) is contained in the [gh-pages
branch]({{ site.repository }}/tree/gh-pages) of the same repository.
-->

### Project Page URL Structureについて

<!--original
### Project Page URL Structure
-->

時々、あなたのJekyllサイトの`gh-pages`ブランチをGitHubへpush する前にプレビューするとよい
です。しかし、GitHubがプロジェクトページのために使用するサブディレクトリのようなURL構造は
URLの適切な解決を困難にします。
そこで、ローカルでにJekyllサイトをプレビューする機能を維持する 
GitHubGitHub Project Page URL structure (`username.github.io/project-name/`) を
利用するアプローチがあります。

<!--original
Sometimes it's nice to preview your Jekyll site before you push your `gh-pages`
branch to GitHub. However, the subdirectory-like URL structure GitHub uses for
Project Pages complicates the proper resolution of URLs. Here is an approach to
utilizing the GitHub Project Page URL structure (`username.github.io/project-name/`)
whilst maintaining the ability to preview your Jekyll site locally.
-->

1. `_config.yml` ファイルにて、`baseurl` オプションを`/project-name`に設定します。 -- 先頭にスラッシュをつけて、最後にスラッシュを**つけない**ことに注意してください。
2. JSやCSSファイルを参照する際は、次のようにしてください:
   `{% raw %}{{ site.baseurl }}/path/to/css.css{% endraw %}` -- 変数に続いてスラッシュを記述することに注意してください。（"path"のすぐ前に記述）
3. パーマリンクや内部リンクを行う時には、次のようにしてください:
   `{% raw %}{{ site.baseurl }}{{ post.url }}{% endraw %}` -- 2つの変数の間にスラッシュは**ない**ことに注意してください。
4. 最後に、もしあなたがコミット・デプロイする前にプレビューしたい場合は`jekyll serve`を実行してください。
   `--baseurl` オプションに空文字列を渡せば`localhost:4000`で見ることができます。(最初に`/project-name`をつけることなしに)

<!--original
1. In `_config.yml`, set the `baseurl` option to `/project-name` -- note the
   leading slash and the **absence** of a trailing slash.
2. When referencing JS or CSS files, do it like this:
   `{% raw %}{{ site.baseurl }}/path/to/css.css{% endraw %}` -- note the slash
   immediately following the variable (just before "path").
3. When doing permalinks or internal links, do it like this:
   `{% raw %}{{ site.baseurl }}{{ post.url }}{% endraw %}` -- note that there
   is **no** slash between the two variables.
4. Finally, if you'd like to preview your site before committing/deploying using
   `jekyll serve`, be sure to pass an **empty string** to the `--baseurl` option,
   so that you can view everything at `localhost:4000` normally (without
   `/project-name` at the beginning): `jekyll serve --baseurl ''`
-->

この方法ならlocalhost上でサイトのトrootからあなたのサイトを手元でプレビューすることができます。
しかし、gh-pages ブランチからあなたのページをGitHubが生成する時にはすべてのURLは
 `/project-name` で始まり、適切に解決されます。

<!--original
This way you can preview your site locally from the site root on localhost,
but when GitHub generates your pages from the gh-pages branch all the URLs
will start with `/project-name` and resolve properly.
-->

<div class="note">
  <h5>GitHubのページマニュアル、ヘルプ、サポート</h5>
  <p>
    GitHub Pagesを使って何ができるかのさらに詳細な情報が必要な場合やだけでなく、
　　トラブルシューティングガイドについては <a 
    href="https://help.github.com/categories/20/articles">GitHub’s Pages Help
    section</a>をチェックアウトする必要があります。 それらのすべてでも解決しない場合には<a
    href="https://github.com/contact">GitHub サポート</a>にご連絡ください。
  </p>
</div>

<!--original
<div class="note">
  <h5>GitHub Pages Documentation, Help, and Support</h5>
  <p>
    For more information about what you can do with GitHub Pages, as well as for
    troubleshooting guides, you should check out <a
    href="https://help.github.com/categories/20/articles">GitHub’s Pages Help
    section</a>. If all else fails, you should contact <a
    href="https://github.com/contact">GitHub Support</a>.
  </p>
</div>
-->
