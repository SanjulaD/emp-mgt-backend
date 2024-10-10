# frozen_string_literal: true

SecureHeaders::Configuration.default do |config|
    # Cookie settings
    config.cookies = {
      secure: true,
      httponly: true,
      samesite: {
        lax: true
      }
    }
  
    # Referrer Policy
    config.referrer_policy = %w(origin-when-cross-origin strict-origin-when-cross-origin)
  
    # Content Security Policy (CSP)
    config.csp = {
      default_src: %w('none'),
      base_uri: %w('self'),
      connect_src: %w('self'),
      font_src: %w('self' data: https:),
      manifest_src: %w('self' https:),
      object_src: %w('none'),
      script_src: %w('self'),
      img_src: %w('self'),
      style_src: %w('self' https:),
      worker_src: %w('self'),
      upgrade_insecure_requests: true,
    }
  
    # Security Headers
    config.hsts = "max-age=31536000; includeSubDomains; preload" # Set HSTS as a string
    config.x_frame_options = 'DENY'
    config.x_content_type_options = 'nosniff'
    config.x_xss_protection = '1; mode=block'
    config.x_permitted_cross_domain_policies = 'none'
  end
  