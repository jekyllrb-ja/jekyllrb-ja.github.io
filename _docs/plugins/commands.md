---
title: コマンド
permalink: /docs/plugins/commands/
---
<!-- ---
title: Commands
permalink: /docs/plugins/commands/
--- -->

バージョン{% include docs_version_badge.html version="2.5.0"%}以降、Jekyllはプラグインで`jekyll`で実行可能なサブコマンドを提供することができます。`:jekyll_plugins`という`Gemfile`グループに関連するプラグインを含めることで可能になります。

<!-- As of version {% include docs_version_badge.html version="2.5.0"%}, Jekyll can be extended with plugins which provide
subcommands for the `jekyll` executable. This is possible by including the
relevant plugins in a `Gemfile` group called `:jekyll_plugins`: -->

```ruby
group :jekyll_plugins do
  gem "my_fancy_jekyll_plugin"
end
```

各`Command`は`Jekyll::Command`クラスのサブクラスである必要があり、`init_with_program`メソッドを含まなければなりません。例えば、

<!-- Each `Command` must be a subclass of the `Jekyll::Command` class and must
contain one class method: `init_with_program`. An example: -->

```ruby
class MyNewCommand < Jekyll::Command
  class << self
    def init_with_program(prog)
      prog.command(:new) do |c|
        c.syntax "new [options]"
        c.description 'Create a new Jekyll site.'

        c.option 'dest', '-d DEST', 'Where the site should go.'

        c.action do |args, options|
          Jekyll::Site.new_site_at(options['dest'])
        end
      end
    end
  end
end
```

コマンドには一つのメソッドが必要です。

<!-- Commands should implement this single class method: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>説明</th>
    </tr>
    <!-- <tr>
      <th>Method</th>
      <th>Description</th>
    </tr> -->
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>init_with_program</code></p>
      </td>
      <td><p>
        このメソッドは、1つのパラメーター、Jekyllプログラム自体である<code><a href="https://github.com/jekyll/mercenary#readme" target="_blank">Mercenary::Program</a></code>インスタンスを受け入れます。プログラム上で、上記の構文を使用してコマンドを作成できます。 詳細については、GitHub.comのMercenaryリポジトリをご覧ください。
      </p>
      <!-- <p>
        This method accepts one parameter, the
        <code><a href="https://github.com/jekyll/mercenary#readme">Mercenary::Program</a></code>
        instance, which is the Jekyll program itself. Upon the program,
        commands may be created using the above syntax. For more details,
        visit the Mercenary repository on GitHub.com.
      </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>
