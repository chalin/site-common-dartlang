---
title: Dart SDK Archive
short-title: Archive
description: Download specific stable and dev channel versions of the Dart SDK and the Dart API documentation.
js:
- url: /tools/sdk/archive/out/web/download_archive.dart.js
  defer: true
- url: /tools/sdk/archive/assets/install.js
  defer: true
---

Use this archive to download
[specific versions](/tools/sdk#about-release-channels-and-version-strings) of the
[Dart SDK](/tools/sdk)
and the [Dart API documentation.]({{site.dart_api}}/{{site.data.pkg-vers.SDK.channel}})

Want to install Dart with your OS's package manager?
Go to the [Dart SDK page](/tools/sdk).

<aside class="alert alert-warning" markdown="1">
  {% include_relative _sdk-terms.md %}
</aside>


## Stable channel

{% if site.data.pkg-vers.SDK.channel == 'dev' %}
The stable channel currently contains 1.x and earlier versions of Dart.
We recommend using Dart 2 instead,
which is available in the dev channel.
{% else %}
Stable channel builds are tested and approved for production use.
{% endif %}

<aside class="alert alert-info" markdown="1">
  **Note:** Many Dart 1.x releases include the Dartium browser
  as a downloadable item. Dartium is no longer supported.
  For more information, see the
  [Dart 2 migration guide for web developers.]({{site.webdev}}/dart-2#tools)
{% comment %}
update-for-dart-2
{% endcomment %}
</aside>

{% include_relative _archives_table.html channel="stable" %}

## Dev channel

{% if site.data.pkg-vers.SDK.channel == 'dev' %}
We strongly encourage you to use the most recent dev channel release,
so that your code will work when Dart 2 is released to the stable channel.
For more information, see the [Dart 2 page](/dart-2).
{% comment %}
update-for-dart-2
{% endcomment %}
{% else %}
Dev channel builds may contain bugs and can provide early access
to new features. We do not recommended dev channel builds for
production use.
{% endif %}

{% include_relative _archives_table.html channel="dev" %}

## Download URLs

You can find the zip files at predictable URLs using the
following pattern:

{% prettify none %}
https://storage.googleapis.com/dart-archive/channels/<[!stable|dev!]>/release/<[!release!]>/sdk/dartsdk-<[!platform!]>-<[!architecture!]>-release.zip
{% endprettify %}

Examples:

{% prettify none %}
https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.0/sdk/dartsdk-windows-ia32-release.zip
https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.3/sdk/dartsdk-macos-x64-release.zip
https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.69.5/sdk/dartsdk-linux-x64-release.zip
{% endprettify %}
