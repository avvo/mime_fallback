# MimeFallback [![Build Status](https://travis-ci.org/avvo/mime_fallback.png)](https://travis-ci.org/avvo/mime_fallback)

Fix mime-type fallbacks when searching view paths.

## Motivation

Let's say you want to render different views for mobile vs desktop.  You decided to do it by defining a new Mime::Type alias for `text/html`.  You want to fall back to rendering a html version from a mobile template.

`users/show.html.erb`:

```
<h1><%= @user.name %></h1>
<%= image_tag(@user.headshot) %>
<%= render partial: "header", locals: {user: @user} %>
```

`users/show.mobile.erb`:

```
<h1><%= @user.name %></h1>
<%= render partial: "header", locals: {user: @user} %>
```

You want the both of these partials to render the shared template `users/_header.html.erb`.

## Usage

In your `Gemfile`:

```
gem 'mime_fallback'
```

In your `config/initializers/mime_types.rb`:

```
MimeFallback::Type.register_alias "text/html", :mobile, [], :html
```

That's it.

## Release Process

1. The version.rb file should only ever be updated in master, don't update it in your branch.
2. Update CHANGELOG.md and version.rb file with new version.
3. Run bundle install to update the Gemfile.lock.
4. Commit as "Bump version".
5. Tag your commit with the version number (e.g. git tag v2.9.3).
6. Push your code to Github with git push --tags origin master. This will trigger a job in CircleCI to build the gem and push it to the the Avvo packagecloud.io repo.
7. Email dev@avvo.com to announce the new gem version and the changes.
