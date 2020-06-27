---
title: Jekyll on Linux
permalink: /docs/installation/other-linux/
---
他のLinuxディストリビューションへのインストールは、[Ubuntu](../ubuntu/)の場合とよく似ています。

<!-- Installation on other Linux distributions works similarly as on [Ubuntu](../ubuntu/). -->

Fedoraでは、dependenciesを以下でインストールできます。

<!-- On Fedora, the dependencies can be installed as follows: -->

```sh
sudo dnf install ruby ruby-devel @development-tools
```

Debianの場合：

<!-- On Debian: -->

```sh
sudo apt-get install ruby-full build-essential
```

Gentoo Linuxの場合:

<!-- On Gentoo Linux: -->

```sh
sudo emerge -av jekyll
```

or

```sh
sudo emerge --ask --verbose jekyll
```

ArchLinuxの場合：

<!-- On ArchLinux: -->

```sh
sudo pacman -S ruby base-devel
```

openSUSEの場合：

<!-- On openSUSE: -->

```sh
sudo zypper install -t pattern devel_ruby devel_C_C++
```

Clear Linuxの場合:

<!-- On Clear Linux: -->

```sh
sudo swupd bundle-add ruby-basic
```

後は[Ubuntu](../ubuntu/)と同じです。

<!-- The rest works the same as on [Ubuntu](../ubuntu/). -->
