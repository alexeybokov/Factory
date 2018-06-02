require 'pry'

class Factory
  def self.new(*args)
    fail "ArgumentError: wrong number of arguments (0 for 1+)" if args.empty?
    Class.new do
      attr_accessor *args

      define_method :initialize do |*args_values|
        if args_values.size != args.size
          fail "ArgumentError: wrong number of arguments (#{args_values.size} for #{args.size})"
        end
        args_values.each_with_index do |arg_val, index|
          send("#{args[index]}=", arg_val)
        end
      end

      define_method :[] do |key|
        begin
          if key.is_a?(Integer)
            return send(args[key])
          end
          send(key)
        rescue => e
          if key.is_a?(Integer) && args[key].nil?
            fail "Invalid method index provided - #{key}. Max allowed - #{args.size - 1}"
          else
            fail "Undefined method #{key}"
          end
        end
      end

      define_method :[]= do |key, value|
        send("#{key}=", value)
      end

      define_method :to_h do
        args.inject({}) do |hash, attr|
          hash[attr] = send(attr)
          hash
        end
      end

      define_method :== do |other_factory|
        return false unless self.class == other_factory.class
        args.all? do |attr|
          send(attr) == other_factory.send(attr)
        end
      end

      define_method :each do |&block|
        args.each do |attr|
          value = send(attr)
          block.call(value)
        end
      end

      define_method :each_pair do |&block|
        args.each do |attr|
          value = send(attr)
          block.call(attr, value)
        end
      end

      define_method :members do
        args
      end

      define_method :eql? do |other_factory|
        return false unless self.class == other_factory.class
        args.all? do |attr|
          send(attr).eql? other_factory.send(attr)
        end
      end

      define_method :hash do
        values.hash
      end

      define_method :to_s do
        string = "#<factory #{self.class.name}"
        string << args.map do |attr|
          "#{attr}=\"#{send(attr)}\""
        end.join(', ')
        string << '>'
        string
      end
      alias_method :inspect, :to_s

      define_method :select do |&block|
        args.map do |attr|
          value = send(attr)
          value if block.call(value)
        end.compact
      end

      define_method :size do
        args.size
      end
      alias_method :length, :size

      define_method :values do
        args.map do |attr|
          send(attr)
        end
      end
      alias_method :to_a, :values

      define_method :values_at do |*indexes|
        true_indexes = []
        indexes.each do |index|
          if index.is_a?(Range)
            true_indexes += index.to_a
          elsif index.is_a?(Integer)
            true_indexes << index
          else
            fail "ArgumentError: #{index.class.name}. Support only Integer and Range"
          end
        end
        true_indexes.map do |index|
          fail "IndexError: offset #{index} too large for factory" if index.abs >= args.size
          send(args[index])
        end
      end
    end
  end
end
