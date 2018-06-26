Still need to do:

-edit function
-delete function
  both must have protections

-index visible to everyone


  patch '/days/:id' do
     if logged_in?
         @ day = Day.find_by(:id params[:id])
         @ user = current_user

        if params(days: params[:month]) != ""
          @ day.update(days: params[:month])
        end

        if params(days: params[:date]) != ""
          @ day.update(days: params[:date])
        end

        if params(days: params[:year]) != ""
          @ day.update(days: params[:year])
        end

        redirect to "/days/#{day.id}"
    else
      redirect to '/login'
    end
 end

patch '/days/:id' do
 if logged_in?
   if params[:days] == ""
     redirect to "/days/#@day.id}/edit"
   else
     @ day = Day.find_by_id(params[:id])
     if @ day && @ day.user == current_user
       if @ day.update(days: params[:days])
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
