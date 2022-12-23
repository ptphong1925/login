class HardWorker
    include Sidekiq::Worker
    def perform(*args)
        YourAppName::Application.load_task
        Rake::Task['YOUR_RAKE_TASK'].invoke
    end
end