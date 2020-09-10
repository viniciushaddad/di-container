module DI
  class UnregisteredDependencyError < StandardError
    def initialize(missing_container)
      super "Missing container: #{missing_container}"
    end
  end
end
