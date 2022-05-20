json.extract! lesson, :id, :title, :description, :delivery_date, :bimester, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
