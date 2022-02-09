if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_auth_todo", domain: "https://tasks-react-ts.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_auth_todo"
end
