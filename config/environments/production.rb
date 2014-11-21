Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # `config.assets.precompile` has moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  # config.assets.precompile += %w( search.js )

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Disable automatic flushing of the log to improve performance.
  # config.autoflush_log = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  
  #smtp mail settings
  config.action_mailer.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :user_name => 'support@PhoneUnlockService.com',
    :password => 'R@cky118',
    :domain => 'phoneunlockserviceco.netfirms.com',
    :address => 'phoneunlockserviceco.netfirms.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true,
    :openssl_verify_mode => 'none'
  }
  
  #paypal settings
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :production
    
    paypal_options = {
      login: "unlockphn_api1.gmail.com",
      password: "NNBJC9MB3SPAGEXX",
      signature: "AFcWxV21C7fd0v3bYYYRCpSSRl31AD5Dl-c93CvsXCAWoG1pwono4XwU"
    }

    
    #test working account
    # paypal_options = {
      # login: "unlockphn-facilitator_api1.gmail.com",
      # password: "RJWALPP35SPBRM6B",
      # signature: "AFcWxV21C7fd0v3bYYYRCpSSRl31AZsJy45PfFnCMB0AwpgQWUaM21bF"
    # }

    # paypal_options = {
      # login: "skannan-facilitator_api1.fourus.ca",
      # password: "7XX8FP36JG5A3VCT",
      # signature: "AFcWxV21C7fd0v3bYYYRCpSSRl31AO3h.lFitRi7fZslTsAMvYk9QGB0"
    # }
    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
  end
end
