class ApplicationService
  class ServiceArgumentError < StandardError; end
  class ServiceUnexpectedError < StandardError; end
  class ServiceValidationError < StandardError; end

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
