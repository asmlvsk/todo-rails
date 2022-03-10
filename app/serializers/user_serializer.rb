class UserSerializer
  include JSONAPI::Serializer
  attributes :avatar

  def avatar
    if object.avatar.attached?
      {
        url: rails_blob_url(object.avatar)
      }
    end
  end
end
