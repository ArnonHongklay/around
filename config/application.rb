require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Around
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.site_name        = "@jipiboily / Jean-Philippe Boily"
    config.site_subtitle    = "my own place online"
    config.site_url         = "http://jipiboily.com"

    config.meta_description = "This is my personal blog about Rails, Blog, programming, etconfig..."
    config.meta_keyword     = "rails, programming, blog, ruby"

    config.admin_force_ssl  = false
    config.posts_per_page   = 10

    config.disqus_shortname = "jipiboily"

    # LOCALE
    config.twitter_locale         = "en" # "fr"
    config.facebook_like_locale   = "en_US" # "fr_CA"
    config.google_plusone_locale  = "en"

    config.layout                 = "layouts/blog/application"

    # ANALYTICS
    config.gauge_analytics_site_id = "YOUR COGE FROM GAUG.ES"
    config.google_analytics_id = "YOUR GA CODE"

    config.sidebar = ["latest_posts", "latest_tweets", "categories", "tag_cloud", "archive"]


    #SOCIAL
    config.twitter_username         = "nonmaddenrc"
    config.facebook_url             = "https://www.facebook.com/nonmaddenrc"
    config.facebook_logo            = 'logo.png'
    config.facebook_app_id          = "123465"
    config.use_pinterest            = true
    config.google_plus_account_url  = "https://plus.google.com/u/1/115273180419164295760/posts"
    config.linkedin_url             = "http://www.linkedin.com/in/jipiboily"
    config.github_username          = "jipiboily"
    config.show_rss_icon            = true
  end
end
