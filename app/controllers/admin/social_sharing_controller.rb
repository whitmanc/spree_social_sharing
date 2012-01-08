class Admin::SocialSharingController < Spree::Admin::BaseController
  
  def index
    @preferences_fb = SocialSharing.prefs_for("facebook")
    @preferences_google = SocialSharing.prefs_for("google")
    @preferences_twitter = SocialSharing.prefs_for("twitter")
  end
  
  def edit
    @preferences = SocialSharing.prefs_for("facebook") + SocialSharing.prefs_for("google") + SocialSharing.prefs_for("twitter")
  end
  
  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    respond_to do |format|
      format.html {
        flash[:notice] = t(:social_sharing_updated)
        redirect_to '/admin/social-sharing' # fixme
      }
    end
  end
end