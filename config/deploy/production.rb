set :stage, :production

server '139.59.239.37', user: 'deploy', roles: %w{web app}
