class SocialSharing
  FACEBOOK_PREFS = ['use_facebook_on_site_footer', 'use_facebook_on_products','facebook_page_or_other_url','facebook_style', 'facebook_width','facebook_font', 'facebook_color_scheme', 'facebook_verb_to_display']
  GOOGLE_PREFS = ['use_google_on_products', 'use_google_on_site_footer', 'google_style', 'google_annotation']
  TWITTER_PREFS = ['use_twitter_tweets_on_products', 'use_twitter_tweets_on_site_footer', 'use_twitter_name','twitter_tweets_show_count', 'twitter_tweets_size_is_large', 'twitter_tweets_hash_tag']
  FACEBOOK_FONTS = ["arial", "tahoma", "verdana", "lucida grande", "segoe ui", "trebuchet ms"]
  FACEBOOK_STYLES = ["standard", "button_count", "box_count"]
  FACEBOOK_COLOR_SCHEMES = ["light", "dark"]
  FACEBOOK_VERBS = ["like", "recommend"]
  GOOGLE_STYLES = ["inline", "bubble", "none"]
  GOOGLE_ANNOTATIONS = ["small", "standard", "medium", "tall"]
  
  def self.facebook_attributes(parent, url, attribs='')
    attribs << "data-href='#{share_url("facebook", parent, url)} '" 
    attribs << "data-send='false'"
    attribs << "data-layout='#{Spree::Config[:facebook_style]}' "
    attribs << "data-width='#{Spree::Config[:facebook_width]}' "
    attribs << "data-show-faces='false' "
    attribs << "data-action='recommend' " if Spree::Config["facebook_verb_to_display"] != "like"
    attribs << "data-colorscheme='#{Spree::Config[:facebook_color_scheme]}' "
    attribs << "data-font='#{Spree::Config[:facebook_font]}'"
  end
  
  def self.share_url(provider, parent, url)
    # different URLs to share for different buttons. 
    # I.e., The footer's like button should "Like" the homepage, unlike the product's
    provider == "facebook" ?
    parent == 'product' ? url : Spree::Config['facebook_page_or_other_url']
    : parent == "product" ? url :  Spree::Config[:site_url]
  end
  
  def self.twitter_attributes(parent, url, attribs='')    
    attribs << ("data-via='#{Spree::Config[:use_twitter_name]}' " if Spree::Config[:use_twitter_name].present?)
    attribs << (Spree::Config[:twitter_tweets_show_count] == true ? "" : "data-count='none' ")
    attribs << (Spree::Config[:twitter_tweets_size_is_large] == true ? "data-size='large' " : "")
    attribs << (Spree::Config[:twitter_tweets_hash_tag].present? ? "data-hash_tags='#{Spree::Config[:twitter_tweets_hash_tag]}' " : "")
    attribs << share_url("twitter", parent, url)
  end
  
  def self.google_attributes(parent, url, attribs = '')
    attribs << "ansize='#{Spree::Config[:google_style]}' "
    attribs <<  "href='#{share_url("google", parent, url)}' "
    attribs <<  "annotation='#{Spree::Config[:google_annotation]}'"
  end

  # Returns all preferences for a given provider
  def self.preferences_for(provider)
    case provider
    when "facebook" then FACEBOOK_PREFS
    when "twitter" then TWITTER_PREFS
    when "google" then GOOGLE_PREFS
    end
  end
  
  def self.all_prefs
    preferences_for("facebook") + preferences_for("google") + preferences_for("twitter")
  end

  # Manage our attributes from different providers
  def self.style_options_for(provider, attribute)
    if provider == "facebook"
      case attribute
        when "fonts" then FACEBOOK_FONTS
        when "styles" then FACEBOOK_STYLES
        when "color_schemes" then FACEBOOK_COLOR_SCHEMES
        when "verbs" then FACEBOOK_VERBS
      end
    elsif provider == "google"
      case attribute
        when "styles" then GOOGLE_STYLES
        when "annotations" then GOOGLE_ANNOTATIONS
      end
    end
  end
end