# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "juices_backend"
set :repo_url, "git@github.com:trajkovvlatko/juices-backend.git"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/#{fetch :application}"

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'public/images'

# Default value for keep_releases is 5
set :keep_releases, 5
