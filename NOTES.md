
<% @ user.days.each do |day| %>
<p> Day Off: <%=day.date%>/<%=day.month%>/<%=day.year%></p>
<%end %>

<p><a href="/users/<%=@day.id%>/edit">Edit</a></p>

<p><a href="/logout">Log Out</a></p>
