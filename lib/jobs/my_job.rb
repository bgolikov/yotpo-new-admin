require 'resque'

class MyJob
  @queue = :my_job_queue

  def self.perform(msg)
    puts msg
  end
end