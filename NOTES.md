Still need to do:

-edit function
-delete function
  both must have protections

-index visible to everyone

patch '/days/:id' do
 if logged_in?
   if params[:days] == ""
     redirect to "/days/#@day.id}/edit"
   else
     @ day = Day.find_by_id(params[:id])
     if @ day && @ day.user == current_user
       if @ day.update(days: params[:month],days: params[:date],days: params[:year])
         redirect to "/days/#{@day.id}"
       else
         redirect to "/days/#{@day.id}/edit"
       end
     else
       redirect to '/days'
     end
   end
  else
   redirect to '/login'
 end
end

patch "/days/:id" do
  if logged_in?
    @ day = Day.find_by_id(params[:id])
    @ user = current_user

    if params(month: params[:month]) != ""
      @ day.update(month: params[:month])
    end

    if params(date: params[:date]) != ""
      @ day.update(date: params[:date])
    end

    if params(year: params[:year]) != ""
      @ day.update(year: params[:year])
    end
    redirect to "days/#{day.id}"
  else
    redirect to '/login'
  end
end
