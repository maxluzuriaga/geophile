Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '189490827819-ml346sqv323kaapucae6m7g0cmmvqt8d.apps.googleusercontent.com', 'girIZlTD3xndHs2nAMDQIXIr'
end