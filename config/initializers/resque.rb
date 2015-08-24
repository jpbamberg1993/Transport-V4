uri = URI.parse("redis://localhost:6379")

Resque.redis = Redis.new(url: uri)

Resque.after_fork = Proc.new { 

 ActiveRecord::Base.establish_connection 

}