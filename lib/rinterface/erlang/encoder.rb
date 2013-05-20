module Erlang
  class Encoder
    include External::Types
    include Terms

    attr_accessor :out
    def initialize
      @out = StringIO.new('', 'w')
    end

    def rewind
      @out.rewind
    end

    def term_to_binary obj
      write_1 External::VERSION
      write_any_raw obj
    end

    def write_any_raw obj
      case obj
      when Symbol then write_symbol(obj)
      when Fixnum, Bignum then write_integer(obj)
      when Float then write_double(obj)
      when Array then write_tuple(obj)
      when String then write_list(ErlString.new(obj))
      when Pid then write_pid(obj)
      when List then write_list(obj)
      else
        raise "Failed encoding!"
      end
    end

    def write_1(byte)
      @out.write([byte].pack("C"))
    end

    def write_2(short)
      @out.write([short].pack("n"))
    end

    def write_4(long)
      @out.write([long].pack("N"))
    end

    def write_string(string)
      @out.write(string)
    end

    def write_symbol(sym)
      data = sym.to_s
      write_1 ATOM
      write_2 data.length
      write_string data
    end

    # TODO: Bignum support
    def write_integer(num)
      if 0 <= num && num < 256
        write_1 SMALL_INT
        write_1 num
      else
        write_1 INT
        write_4 num
      end
    end

    def write_double(num)
      write_1 NEW_FLOAT
      @out.write([num].pack('G'))
    end

    def write_tuple(data)
      if data.length < 256
        write_1 SMALL_TUPLE
        write_1 data.length
      else
        write_1 LARGE_TUPLE
        write_4 data.length
      end
      data.each{|e| write_any_raw e }
    end

    def write_pid(pid)
      write_1(103)
      write_symbol(pid.node)
      write_4((pid.node_id & 0x7fff))
      write_4((pid.serial & 0x1fff))
      write_1((pid.creation & 0x3))
    end

    def write_list(list)
      len = list.data.size
      write_1(108)
      write_4(len)
      list.data.each{ |i| write_any_raw i }
      write_1(106)
    end

    def write_binary(data)
      write_1 BIN
      write_4 data.length
      write_string data
    end

  end
end
