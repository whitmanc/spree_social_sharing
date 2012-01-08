class Admin::SocialSharingController < Spree::Admin::BaseController
  
  def index
    @preferences_fb = SocialSharing.preferences_for("facebook")
    @preferences_google = SocialSharing.preferences_for("google")
    @preferences_twitter = SocialSharing.preferences_for("twitter")
  end
  
  def edit
    @preferences = SocialSharing.all_prefs
  end
  
  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    respond_to do |format|
      format.html {
        flash[:notice] = t(:social_sharing_updated)
        redirect_to social_sharing_path
      }
    end
  end
end