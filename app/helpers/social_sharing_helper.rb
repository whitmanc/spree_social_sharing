module SocialSharingHelper
  # Key parameter represents a preference's name which is equivalent to a social share button option like color or size.
  # Type parameter is the data type of the preference i.e., :boolean
  def social_sharing_selects(key, type)
    case key
      # FIXME
      when "facebook_font" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("facebook", "fonts")))
      when "facebook_style" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("facebook", "styles")))
      when "facebook_color_scheme" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("facebook", "color_schemes")))
      when "facebook_verb_to_display" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("facebook", "verbs")))
      when "google_style" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("google", "styles")))
      when "google_annotation" then select_tag(key, social_opts_for(key, SocialSharing.style_options_for("google", "annotations")))
      else preference_field_tag(key, Spree::Config[key], :type => type)
    end
  end
  
  # Returns host & URI, good for sharing
  def url
    url_for(:only_path => false)
  end
  
  def render_sharing_for(target, provider)
    if target == "footer"
      # The "parent" parameter helps us know which URL we need to share for this rendition
      # I.e., the Facebook button on the footer should link to Company facebook, not the URL it's on
      case provider
        when "facebook" then render :partial => 'spree/shared/facebook_likes', :locals => { :sender => "footer" } if Spree::Config[:use_facebook_on_products]
        when "twitter" then render :partial => 'spree/shared/twitter_tweets', :locals => { :sender => "footer" } if Spree::Config[:use_twitter_tweets_on_products] 
        when "google" then render :partial => 'spree/shared/google_plusones', :locals => { :sender => "footer"} if Spree::Config[:use_google_on_site_footer]
      end
    elsif target == "product"
      case provider
        when "facebook" then render :partial => 'spree/shared/facebook_likes', :locals => { :sender => "product" } if Spree::Config[:use_facebook_on_products]
        when "twitter" then render :partial => 'spree/shared/twitter_tweets', :locals => { :sender => "product"} if Spree::Config[:use_twitter_tweets_on_site_footer]
        when "google" then render :partial => 'spree/shared/google_plusones', :locals => { :sender => "product" } if Spree::Config[:use_google_on_products]
      end
    end
  end
  
  def sent_from_product?(object)
    object == "product" ? true : false
  end
  
  def social_opts_for(key, select_list)
    options_for_select(select_list, :selected => Spree::Config[key])
  end
end