Spree Social Sharing Extension
==============================

Maintain and configure sharing with Facebook, Google+ and Twitter on your Spree store.  
  
### Features
* Configurable in Spree's Admin UI  
* Enable/disable services individually  
* Display buttons on footer and/or products page  
* Preview share buttons in Admin  
* Specify your own Facebook URL to share
* i18n  
* Google +1 options:  
    * Button styles  
    * Annotations 
* Facebook options:  
    * Style  
    * Width  
    * Verb (like/recommend)  
    * Color scheme (light/dark)
    * Size  
    * Font
* Twitter options:  
    * Hide/show count  
    * Button size  
    * Hash tag to include in Tweets
    * Include specified 'via user' for Tweets  
  
### Installation
    
Add the following to you Gemfile:

    gem 'spree_social_sharing', :git => 'git://github.com/whitmanc/spree_social_sharing.git'

And run bundler:

    bundle install
  
  
Then visit http://127.0.0.1:3000/admin/social-sharing/edit change your settings.
  
  
NOTE: No migrations are required for this extension.