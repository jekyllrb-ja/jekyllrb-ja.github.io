---
title: GitHub Actions
---

JekyllサイトをGitHub Pagesで構築する時、標準的なフローは、セキュリティ上の理由と、サイトのセットアップをより簡単にするために制限されています。ビルドをより詳細に制御し、GitHub Pagesでサイトをホストするために、GitHub Actionsを使用できます。

<!-- When building a Jekyll site with GitHub Pages, the standard flow is restricted for security reasons
and to make it simpler to get a site setup. For more control over the build and still host the site
with GitHub Pages you can use GitHub Actions. -->

## Actionsを使用する利点
<!-- ## Advantages of using Actions -->

### gemsetの制御
<!-- ### Control over gemset -->

- **Jekyll version** --- 現在有効な`3.8.5`にかわり、好きなバージョンのJekyllを使用できます。たとえば、`4.0.0`やリポジトリを直接ポイントします。
- **Plugins** --- [サポートされているバージョン][ghp-whitelist]リストにあるかどうかに関係なく、Jekyllプラグインを使用できます。サイトの`_plugins`ディレクトリに配置された`*.rb`ファイルも使用できます。
- **Themes** --- Actionsなしでカスタムテーマを使用することは可能ですが、より簡単になります。

<!--  **Jekyll version** --- Instead of using the currently enabled version at `3.8.5`, you can use any
  version of Jekyll you want. For example `4.0.0`, or point directly to the repository.
- **Plugins** --- You can use any Jekyll plugins irrespective of them being on the
  [supported versions][ghp-whitelist] list, even `*.rb` files placed in the `_plugins` directory
  of your site.
- **Themes** --- While using a custom theme is possible without Actions, it is now simpler. -->

### ワークフローの管理
<!-- ### Workflow Management -->

- **Customization** --- Actionsを実行するワークフローファイルを作成することにより、カスタムビルドステップを指定したり、環境変数を使用したりできます。
- **Logging** --- ビルドログは表示され、詳細に調整できるため、Actionsを使用してエラーをデバッグするのがよりに簡単になります。

<!--  **Customization** --- By creating a workflow file to run Actions, you can specify custom build
    steps, use environment variables.
  - **Logging** --- The build log is visible and can be tweaked to be verbose, so it is much easier to
    debug errors using Actions. -->

## ワークスペースのセットアップ
<!-- ## Workspace setup -->

何よりもまず必要なのは、GitHubでホストされているJekyllプロジェクトです。既存のJekyllプロジェクトを選択するか、リポジトリがまだホストされていない場合は[クイックスタート]({{ '/docs' | relative_url }})に従ってGitHubにプッシュします。

<!-- The first and foremost requirement is a Jekyll project hosted at GitHub. Choose an existing Jekyll
project or follow the [Quickstart]({{ '/docs' | relative_url }}) and push the repository to GitHub
if it is not hosted there already. -->

このページでは、`master`ブランチからのビルドのみを取り上げます。ですので、`master`ブランチで作業していることを確認してください。必要に応じて、デフォルトのブランチに基づいて作成できます。
Actionがサイトを構築すると、*書き出し*ディレクトリのコンテンツが自動的に`gh-pages`ブランチにプッシュされ、配信に使用できるようになります。

<!-- We're only going to cover builds from the `master` branch in this page. Therefore, ensure that you
are working on the `master` branch. If necessary, you may create it based on your default branch.
When the Action builds your site, the contents of the *destination* directory will be automatically
pushed to the `gh-pages` branch with a commit, ready to be used for serving. -->

{: .note .warning}
ここで使用するActionは、デプロイが成功するたびに`gh-pages`ブランチを作成(または既存のものをリセット)します。  
したがって、本番環境ビルドのデプロイに使用される既存の`gh-pages`ブランチがある場合は、コンテンツのバックアップを別のブランチに作成して、必要に応じて簡単にロールバックできるようにしてください。

<!-- {: .note .warning}
The Action we're using here will create (or reset an existing) `gh-pages` branch on every successful
deploy.<br/> So, if you have an existing `gh-pages` branch that is used to deploy your production
build, ensure to make a backup of the contents into a different branch so that you can rollback
easily if necessary. -->

このページの残りの部分で使用するJekyllサイトは、最初は`_config.yml`、`index.md`ページ、および`Gemfile`のみで構成されています。 内容はそれぞれ次のとおりです。

<!-- The Jekyll site we'll be using for the rest of this page initially consists of just a `_config.yml`,
an `index.md` page and a `Gemfile`. The contents are respectively: -->

```yaml
# _config.yml

title: "Jekyll Actions Demo"
```

{% raw %}
```liquid
---
---

Welcome to My Home Page

{% assign date = '2020-04-13T10:20:00Z' %}

- Original date - {{ date }}
- With timeago filter - {{ date | timeago }}
```
{% endraw %}


```ruby
# Gemfile

source 'https://rubygems.org'

gem 'jekyll', '~> 4.0'

group :jekyll_plugins do
  gem 'jekyll-timeago', '~> 0.13.1'
end
```

{: .note .info}
デモサイトでは、Jekyll 4と[サードパーティプラグイン][timeago-plugin]を使用しています。どちらも現在はGitHub Pagesでの使用はホワイトリストに登録されていません。プラグインを使用すると、日付が今日からどれだけ遡っているかを示します。例えば 日付を`2016-03-23T10:20:00Z`と指定し、現在の日付が`2020-04-13T10:20:00Z`である場合、出力は`4 years and 3 weeks ago`になります。

<!-- {: .note .info}
The demo site uses Jekyll 4 and a [third-party plugin][timeago-plugin], both of which are currently
not whitelisted for use on GitHub pages. The plugin will allow us to describe how far back a date
was from today. e.g. If we give a date as `2016-03-23T10:20:00Z` and the current date is
`2020-04-13T10:20:00Z`, then the output would be `4 years and 3 weeks ago`. -->

{: .note .info}
私たちが使用しているアクションは、Ruby gemと依存関係のインストールを処理します。これによりユーザーの設定がシンプルになりますが、古いバージョンのBundlerで生成された `Gemfile.lock`もチェックインすると問題が発生する可能性があります。

<!-- {: .note .info}
The action we're using takes care of installing the Ruby gems and dependencies. While that keeps
the setup simple for the user, one may encounter issues if they also check-in `Gemfile.lock` if it
was generated with an old version of Bundler. -->

### Actionのセットアップ
<!-- ### Setting up the Action -->

GitHub Actionsは、ディレクトリパス`.github/workflows`（先頭のドットに注意してください）内のYAMLファイルを使用してリポジトリに登録されます。 ここでは、簡単にするためにマーケットプレイスの[Jekyll Actions][jekyll-actions]を使用します。

<!-- GitHub Actions are registered for a repository by using a YAML file inside the directory path
`.github/workflows` (note the dot at the start). Here we shall employ
[Jekyll Actions][jekyll-actions] from the Marketplace for its simplicity. -->

GitHubインターフェースを使用するか、YAMLファイルをワークフローディレクトリパスに手動でプッシュすることで、**ワークフローファイル**、たとえば`github-pages.yml`を作成します。 基本の内容は次のとおりです。

<!-- Create a **workflow file**, say `github-pages.yml`, using either the GitHub interface or by pushing
a YAML file to the workflow directory path manually. The base contents are: -->

{% raw %}
```yaml
name: Build and deploy Jekyll site to GitHub Pages

on:
  push:
    branches:
      - master

jobs:
  github-pages:
    runs-on: ubuntu-16.04
    steps:
      - uses: actions/checkout@v2
      - uses: helaili/jekyll-action@2.0.1
        env:
          JEKYLL_PAT: ${{ secrets.JEKYLL_PAT }}
```
{% endraw %}

上記のワークフローは次のように説明できます：

<!-- The above workflow can be explained as the following: -->

- `master`ブランチのみに対して**on.push**条件を使用してビルドをトリガーします---これにより、アクションが他のブランチのプッシュで`gh-pages`ブランチを上書きするのを防ぎます。
- ジョブの**name**がYAMLファイル名と一致します： `github-pages`
- **checkout** actionは、リポジトリのクローンを作成します。
- `helaili/jekyll-action@2.0.0`を使用して、選択した**action**と**version number**を指定します。これはビルドとデプロイを処理します。
- 使用するアクションの秘密の**environment variable**への参照を設定します。`JEKYLL_PAT`は*個人アクセストークン*であり、次のセクションで詳しく説明します。
{% comment %} We trigger the build using **on.push** condition for `master` branch only --- this prevents
  the Action from overwriting the `gh-pages` branch on any feature branch pushes.
- The **name** of the job matches our YAML filename: `github-pages`.
- The **checkout** action takes care of cloning your repository.
- We specify our selected **action** and **version number** using `helaili/jekyll-action@2.0.0`.
  This handles the build and deploy.
- We set a reference to a secret **environment variable** for the action to use. The `JEKYLL_PAT`
    is a *Personal Access Token* and is detailed in the next section. {% endcomment %}

**on.push**条件を使用する代わりに、[on.schedule]パラメーターを使用して**schedule**でビルドをトリガーできます。たとえば、ここでは[crontab guru]サイトでテストできる**cron**構文を指定して、毎日午前0時にビルドします。

<!-- Instead of using the **on.push** condition, you could trigger your build on a **schedule** by 
using the [on.schedule] parameter. For example, here we build daily at midnight by specifying
**cron** syntax, which can be tested at the [crontab guru] site. -->

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```

アスタリスクが誤って評価されるのを防ぐために、この文字列は引用符で囲む必要があることに注意してください。

<!-- Note that this string must be quoted to prevent the asterisks from being evaluated incorrectly. -->

[on.schedule]: https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule
[crontab guru]: https://crontab.guru/

### 権限を与える
<!-- ### Providing permissions -->

actionには、`gh-pages`ブランチにプッシュする権限が必要です。そのため、GitHubプロファイルでGitHub **authentication token**を作成し、_Secrets_を使用してビルドで環境変数として設定する必要があります。

<!-- The action needs permissions to push to your `gh-pages` branch. So you need to create a GitHub
**authentication token** on your GitHub profile, then set it as an environment variable in your
build using _Secrets_: -->

1. GitHubプロファイルの**Developer Settings**で、[Personal Access Tokens][tokens]セクションに移動します。
2. トークンを**Create**します。"GitHub Actions"のような名前を付け、`public_repos`（またはプライベートリポジトリの`repo` scope全体）への権限があることを確認します---アクションが`gh-pages`ブランチにコミットするために必要です。
3. トークンの値を**コピー**します。
4. リポジトリの **Settings** へ行き、**Secrets** タブへ進みます。
5. `JEKYLL_PAT` (*重要*)というトークンを**Create**します。それに先ほどコピーした値を与えます。

<!-- 1. On your GitHub profile, under **Developer Settings**, go to the [Personal Access Tokens][tokens]
   section.
2. **Create** a token. Give it a name like "GitHub Actions" and ensure it has permissions to
   `public_repos` (or the entire `repo` scope for private repository) --- necessary for the action
   to commit to the `gh-pages` branch.
3. **Copy** the token value.
4. Go to your repository's **Settings** and then the **Secrets** tab.
5. **Create** a token named `JEKYLL_PAT` (*important*). Give it a value using the value copied
   above. -->

### ビルドとデプロイ
<!-- ### Build and deploy -->

`master`上のローカル変更をプッシュすると、actionがトリガーされビルドを**開始**します。

<!-- On pushing any local changes onto `master`, the action will be triggered and the build will
**start**. -->

進行状況を確認してビルドエラーを確認するには、次のいずれかの方法でビルドの**status**を確認します。

<!-- To watch the progress and see any build errors, check on the build **status** using one of the
following approaches: -->

- **commitを見る**
    - GitHubのリポジトリレベルビューに移動します。最新のコミット（上部近く）の下で、コミットメッセージの横にチェックまたは_X_として**ステータスシンボル**が表示されます。カーソルを合わせて、**details**リンクをクリックします。
- **Actionsタブ**
    - リポジトリのActions他部へ移動します。`jekyll`ワークフロータブをクリックします。
{% comment %}- **View by commit**
    - Go to the repository level view in GitHub. Under the most recent commit (near the top) you’ll
      see a **status symbol** next to the commit message as a tick or _X_. Hover over it and click
      the **details** link.
- **Actions tab**
    - Go to the repository's Actions tab. Click on the `jekyll` workflow tab. {% endcomment %}

すべてがうまくいけば、全ステップが緑色になり、ビルドされたアセットが`gh-pages`ブランチに存在するようになります。

<!-- If all goes well, all steps will be green and the built assets will now exist on the `gh-pages`
branch. -->

ビルドが成功すると、GitHub Pagesはリポジトリの`gh-pages`ブランチに保存されているサイトを**公開**します。actionがこれを処理するので、`gh-pages`ブランチをセットアップしたり、GitHub Pagesを有効にする必要はありません。
（プライベートリポジトリの場合、有料プランにアップグレードする必要があります）

<!-- On a successful build, GitHub Pages will **publish** the site stored on the repository `gh-pages`
branches. Note that you do not need to setup a `gh-pages` branch or enable GitHub Pages, as the
action will take care of this for you.
(For private repositories, you'll have to upgrade to a paid plan). -->

**live site**を表示するには：

<!-- To see the **live site**: -->

1. リポジトリの**environment**タブへ移動します。
2. デプロイされたサイトのURLを見るために**View Deployment**をクリックします。
3. その**URL**でサイトを見ます。`timeago`フィルターが期待どおりに機能していることを確認します。
4. 必要に応じて、このURLをリポジトリのメインページと`README.md`に**追加**して、人々が簡単に見つけられるようにします。

<!-- 1. Go to the **environment** tab on your repository.
2. Click **View Deployment** to see the deployed site URL.
3. View your site at the **URL**. Make sure the `timeago` filter works as expected.
4. Optionally **add** this URL to your repository's main page and to your `README.md`, to make it
   easy for people to find. -->

サイトをさらに**変更**する必要がある場合は、`master`にコミットしてプッシュします。 ワークフローにより、サイトが再度ビルドとデプロイされます。

<!-- When you need to make further **changes** to the site, commit to `master` and push. The workflow
will build and deploy your site again. -->

`gh-pages`ブランチを直接**編集しないでください**。変更はActionからの次の正常なデプロイで失われます。

<!-- Be sure **not to edit** the `gh-pages` branch directly, as any changes will be lost on the next
successful deploy from the Action. -->

## 外部リンク
<!-- ## External links -->

- [jekyll-actions]はGitHub Marketplaceで利用可能なactionであり、このガイドで使用していました。
- [jekyll-actions-quickstart]は、`jekyll-actions` actionのライブデモを含む非公式リポジトリです。そのプロジェクトは、新しいサイトを作成するためのテンプレートとして使用できます。

<!--  [jekyll-actions] is an action available on the GitHub Marketplace and was used in this guide.
- [jekyll-actions-quickstart] is an unofficial repository that includes a live demo of the
  `jekyll-actions` action. That project can be used as a template for making a new site. -->


[ghp-whitelist]: https://pages.github.com/versions/
[timeago-plugin]: https://rubygems.org/gems/jekyll-timeago
[tokens]: https://github.com/settings/tokens
[jekyll-actions]: https://github.com/marketplace/actions/jekyll-actions
[jekyll-actions-quickstart]: https://github.com/MichaelCurrin/jekyll-actions-quickstart
