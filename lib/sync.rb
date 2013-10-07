require 'socket'

module Erlang
  module EPMD
    def self.host_info(nodename)
        node = nodename
        host = "127.0.0.1"
        res = nodename.scan(/(.*)@(.*)/).flatten
        if res.length == 2
            node= res[0]
            host = res[1]
        end
        [host, node]
    end

    def self.lookup_port(nodename)
      host, node = Erlang::EPMD.host_info(nodename)
      sock = TCPSocket.new host, 4369

      out = StringIO.new('', 'w')
      out.write([node.size + 1].pack('n'))
      out.write([122].pack("C"))
      out.write(node)
      sock.write out.string

      sock.read(1).unpack('C').first # code
      result = sock.read(1).unpack('C').first
      raise 'Bad response from EPMD' unless result == 0
      port = sock.read(2).unpack('n').first

      sock.close

      port
    end

  end
end
