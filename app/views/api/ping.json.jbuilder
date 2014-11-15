json.array! @events do |event|
  json.(event, :id, :name, :start_date, :end_date)
  json.user event.user, :id, :name

  json.posts event.posts do |post|
    json.(post, :id, :text, :created_at)
  end
end