class AuctionsCleanupJob < ApplicationJob
  queue_as :critical

  def perform(*args)
    Outputter::ExampleOutputterService.call(*args)
  end
end
