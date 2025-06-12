# Rubocop Infinum

This gem provides the .RuboCop configuration file alongside some custom cops used at Infinum.

To use it, you can add this to your `Gemfile` (`group :development`):

  ~~~ruby
  gem 'rubocop-infinum', require: false
  ~~~

And add to the top of your project's RuboCop configuration file:

  ~~~yml
  plugins: rubocop-infinum
  ~~~


> [!NOTE]
> The plugin system is supported in RuboCop 1.72+. In earlier versions, use `require` instead of `plugins`.

If you dislike some rules, please check [RuboCop's documentation](https://rubocop.readthedocs.io/en/latest/configuration/#inheriting-configuration-from-a-dependency-gem) on inheriting configuration from a gem.
