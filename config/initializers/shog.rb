Shog.configure do
  if ::Rails.env.production?
    reset_config!
    timestamp
  end
end
