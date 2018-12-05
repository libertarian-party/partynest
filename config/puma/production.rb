# frozen_string_literal: true

workers_count = ENV.fetch('WEB_CONCURRENCY') { 1 }
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
workers workers_count

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads threads_count, threads_count

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Bind the server to "url". "tcp://", "unix://" and "ssl://" are the only
# accepted protocols.
#
bind "unix://#{Rails.root.join('tmp', 'sockets', 'puma.sock')}"

# Allow puma to be restarted by `rails restart` command.
# plugin :tmp_restart
