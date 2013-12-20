# MimeFallback

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
