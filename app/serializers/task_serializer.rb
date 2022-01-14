class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :priority, :is_done
  has_many :categories
end
