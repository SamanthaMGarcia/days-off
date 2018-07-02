<% if @ user && !@user.errors.empty? %>
  <% @ user.errors.full_messages.each do |message| %>
  <p><%= message%> </p>
  <% end %>
<% end %>
