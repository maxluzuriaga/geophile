json.array! @events do |event|
  json.(event, :id, :name, :start_date, :end_date)
  json.user event.user, :id, :name

  json.updates event.posts do |post|
    json.(post, :id, :text, :created_at)
  end

  json.resources event.resources do |resource|
    json.(resource, :id, :name, :url, :size, :mime_type, :created_at)
  end
end