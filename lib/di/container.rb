require_relative 'unregistered_dependency_error'

module DI
  class Container
    def initialize
      @registers = {}
      @singletons = {}
    end

    def register(name, &block)
      @registers[name.to_s] = block
    end

    def resolve(name)
      @registers[name.to_s].tap do |resolved|
        fail ::DI::UnregisteredDependencyError, name unless resolved
      end.call
    end

    def singleton(name)
      @singletons[name.to_s] ||= resolve(name)
    end
  end
end
