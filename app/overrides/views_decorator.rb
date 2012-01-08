Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "social_sharing_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_menu']",
                     :text => "<%= configurations_menu_item(I18n.t('social_sharing'), social_sharing_path, I18n.t('manage_social_sharing')) %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_social_sharing_after_cart_form",
                     :insert_bottom => "[data-hook='cart_form']",
                     :partial => "spree/products/social_sharing",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                    :name => "add_social_sharing_javascript",
                    :insert_after => "[data-hook='body']",
                    :partial => "spree/products/social_sharing_js",
                    :disabled => false)

Deface::Override.new(:virtual_path => "spree/layouts/admin",
                    :name => "add_social_sharing_javascript_to_admin",
                    :insert_bottom => "[data-hook='admin_footer_scripts']",
                    :partial => "spree/products/social_sharing_js",
                    :disabled => false)

Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                    :name => "add_social_sharing_buttons_for_footer",
                    :insert_bottom => "div#footer-right",
                    :partial => "spree/shared/social_sharing_footer",
                    :disabled => false)