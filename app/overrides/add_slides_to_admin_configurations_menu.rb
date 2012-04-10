Deface::Override.new(:virtual_path => 'spree/admin/configurations/index',
                     :name => 'add_taxon_splashes_to_admin_configurations_menu',
                     :insert_bottom => "[data-hook='admin_configurations_menu']",
                     :text => %q{
                        <tr>
                          <td><%= link_to 'Taxon Splashes', admin_taxon_splashes_path %></td>
                          <td>Manage Spree Taxon Splash Page contents</td>
                        </tr> })

