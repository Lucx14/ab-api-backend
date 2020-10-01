module Outputter
  class ExampleOutputterService < ApplicationService
    attr_reader :message

    def initialize(message:)
      @message = message
    end

    def call
      puts message
    end
  end
end
