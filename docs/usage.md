---
layout: docs
title: 基本的な使い方
prev_section: installation
next_section: structure
permalink: /docs/usage/
---

<!--original
---
layout: docs
title: Basic Usage
prev_section: installation
next_section: structure
permalink: /docs/usage/
---
-->

Jekyll gem はターミナルウィンドウに `jekyll` で実行することができます。
あなたはいくつかの方法でこのコマンドを使用することができます:

<!--original
The Jekyll gem makes a `jekyll` executable available to you in your Terminal
window. You can use this command in a number of ways:
-->

{% highlight bash %}
$ jekyll build
# => カレントフォルダが ./_site の下に生成されます

$ jekyll build --destination <destination>
# => カレントフォルダが <destination> の下に生成されます

$ jekyll build --source <source> --destination <destination>
# => <source> フォルダが <destination> の下に生成されます

$ jekyll build --watch
# => カレントフォルダが ./_site の下に生成されます
#    変更を監視し、自動的に再生成を行います
{% endhighlight %}

<!--original
{% highlight bash %}
$ jekyll build
# => The current folder will be generated into ./_site

$ jekyll build --destination <destination>
# => The current folder will be generated into <destination>

$ jekyll build --source <source> --destination <destination>
# => The <source> folder will be generated into <destination>

$ jekyll build --watch
# => The current folder will be generated into ./_site,
#    watched for changes, and regenerated automatically.
{% endhighlight %}
-->

<div class="note warning">
  <h5>Destination folders are cleaned on site builds</h5>
  <p>
    The contents of <code>&lt;destination&gt;</code> are automatically
    cleaned when the site is built.  Files or folders that are not
    created by your site will be removed.  Do not use an important
    location for <code>&lt;destination&gt;</code>; instead, use it as
    a staging area and copy files from there to your web server. 
  </p>
</div>

<!--original
<div class="note warning">
  <h5>Destination folders are cleaned on site builds</h5>
  <p>
    The contents of <code>&lt;destination&gt;</code> are automatically
    cleaned when the site is built.  Files or folders that are not
    created by your site will be removed.  Do not use an important
    location for <code>&lt;destination&gt;</code>; instead, use it as
    a staging area and copy files from there to your web server. 
  </p>
</div>
-->

Jekyll もまた組み込み開発サーバがついており、
ローカルで生成したサイトをブラウザでプレビューすることができます。

<!--original
Jekyll also comes with a built-in development server that will allow you to
preview what the generated site will look like in your browser locally.
-->

{% highlight bash %}
$ jekyll serve
# => 開発サーバを http://localhost:4000/ で起動します

$ jekyll serve --detach
# => `jekyll serve` と同様、しかし、現在のターミナルからは切り離されます

#    サーバを停止する場合、 PID が `1234` ならば `kill -9 1234` で停止することができます
#    PID が見つからない場合、 `ps aux | grep jekyll` を実行し、インスタンスを停止してください [Read more](http://unixhelp.ed.ac.uk/shell/jobz5.html).

$ jekyll serve --watch
# => `jekyll serve` と同様、しかし、変更を監視し、自動的に再生成を行います
{% endhighlight %}

<!--original
{% highlight bash %}
$ jekyll serve
# => A development server will run at http://localhost:4000/

$ jekyll serve --detach
# => Same as `jekyll serve` but will detach from the current terminal.
#    If you need to kill the server, you can `kill -9 1234` where "1234" is the PID.
#    If you cannot find the PID, then do, `ps aux | grep jekyll` and kill the instance. [Read more](http://unixhelp.ed.ac.uk/shell/jobz5.html).

$ jekyll serve --watch
# => Same as `jekyll serve`, but watch for changes and regenerate automatically.
{% endhighlight %}
-->

これらは [設定項目](../configuration/) の一部です。
多くのコンフィグオプションはコマンドラインでフラグとして指定するか、
もしくは(より一般的な)、ソースディレクトリのルートにある `_config.yml` ファイルに指定することができます。
Jekyll は、起動時にこのファイルのオプションを自動的に使用します。
例えば、あなたが `_config.yml` ファイルに以下のような行を置いた場合:

<!--original
These are just a few of the available [configuration options](../configuration/).
Many configuration options can either be specified as flags on the command line,
or alternatively (and more commonly) they can be specified in a `_config.yml`
file at the root of the source directory. Jekyll will automatically use the
options from this file when run. For example, if you place the following lines
in your `_config.yml` file:
-->

{% highlight yaml %}
source:      _source
destination: _deploy
{% endhighlight %}

<!--original
{% highlight yaml %}
source:      _source
destination: _deploy
{% endhighlight %}
-->

この時、以下の二つのコマンドの意味は同じとなります:

<!--original
Then the following two commands will be equivalent:
-->

{% highlight bash %}
$ jekyll build
$ jekyll build --source _source --destination _deploy
{% endhighlight %}

<!--original
{% highlight bash %}
$ jekyll build
$ jekyll build --source _source --destination _deploy
{% endhighlight %}
-->

コンフィグオプションの詳細については、 [設定項目](../configuration/) ページを参照してください。

<!--original
For more about the possible configuration options, see the
[configuration](../configuration/) page.
-->
