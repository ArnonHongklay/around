# role :app, %w{deploy@139.59.239.37}
# role :web, %w{deploy@139.59.239.37}
# role :db,  %w{deploy@139.59.239.37}

set :stage, :production

server '139.59.239.37', user: 'deploy', roles: %w{web app}
