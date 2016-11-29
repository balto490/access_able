Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :twitter, '9mpKU9N7NjVDK5fiT8nEgxsZo', 'HO6swLWRQN0H8LEQcKQpm3LVT2wDypQpZgLxZ0Th7tCAhlMjSA'
  provider :facebook, '1146789048774597', 'ef575d924f1a68cc846d330f5fe2d66f'
end 