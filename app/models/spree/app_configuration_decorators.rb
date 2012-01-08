Spree::AppConfiguration.class_eval do
  # Share button previews for Facebook, Twitter, Google+ (in Admin)
  preference :preview_enabled, :boolean, :default => true
  
  # Facebook Like options
  preference :use_facebook_on_site_footer, :boolean, :default => true
  preference :facebook_page_or_other_url, :string
  preference :use_facebook_on_products, :boolean, :default => true
  preference :facebook_style , :string, :default => "standard"
  preference :facebook_width, :integer, :default => 200
  preference :facebook_verb_to_display, :string, :default => "like"
  preference :facebook_color_scheme, :string, :default => "light"
  preference :facebook_font, :string, :default => "arial"
  
  # Google +1 options
  preference :use_google_on_site_footer, :boolean, :default => true
  preference :use_google_on_products, :boolean, :default => true
  preference :google_style, :string, :default => "medium"
  preference :google_annotation, :string, :default => "bubble"
  
  # Twitter tweeting options
  preference :use_twitter_tweets_on_products, :boolean, :default => true
  preference :use_twitter_tweets_on_site_footer, :boolean, :default => true
  preference :use_twitter_name, :string
  preference :twitter_tweets_show_count, :boolean, :default => true
  preference :twitter_tweets_size_is_large, :boolean, :default => true
  preference :twitter_tweets_hash_tag, :string
end