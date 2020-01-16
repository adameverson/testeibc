json.extract! board, :id, :name, :user_email, :created_at, :updated_at
json.url board_url(board, format: :json)
