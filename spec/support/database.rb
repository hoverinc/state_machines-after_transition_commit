require "pg"
require "active_record"

DATABASE = 'state_machines-after_transition_commit-test'

ActiveRecord::Base.establish_connection(adapter: 'postgresql')
ActiveRecord::Base.connection.drop_database(DATABASE)
ActiveRecord::Base.connection.create_database(DATABASE)
