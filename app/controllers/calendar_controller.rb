class CalendarController < ApplicationController
  def events
  end
  def data
    from = DateTime.strptime(params[:start],'%s')
    to = DateTime.strptime(params[:end],'%s')
    events = current_user.timelets.where(:from => from.beginning_of_day .. to.end_of_day).where("timelets.duration > 10")
    events_json = []
    events.each do |event|
      temp = {start: event.from.in_time_zone('Asia/Kolkata'), end:event.to.in_time_zone('Asia/Kolkata'), allDay: false, ignoreTimezone: false, editable:false}
      temp['title'] = Task.find(event.task_id).name
      events_json << temp
    end
    # tomatoes per day SELECT date(tomatoes.from),count(*) FROM `tomatoes` where completed = 1 GROUP BY date(tomatoes.from) 
    tomatoes = current_user.tomatoes.select("date(tomatoes.from) as day, count(*) as done").where(completed: true).where(:from => from .. to).group("date(tomatoes.from)")
    tomatoes.each do |t|
      temp = {}
      temp['start'] = t.day
      temp['title'] = "#{t.done} tomatoes"
      events_json << temp
    end
    render :json => events_json

  end
end
