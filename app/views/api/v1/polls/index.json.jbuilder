json.array! @polls do |poll|
    json.(poll, :id, :title, :description, :user_id, :expires_at)
end