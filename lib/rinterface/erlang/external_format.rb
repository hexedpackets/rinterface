#
# adopted from Erlectricity
# this version is slightly tweaked,  a bit sloppy, and needs a cleanin'
#
module Erlang
  module Terms

    class Pid
      attr_reader :node, :node_id, :serial, :creation
      def initialize(node,nid,serial,created)
        @node = node
        @node_id = nid
        @serial = serial
        @creation = created
      end
    end

    class List
      attr_reader :data
      def initialize(array)
        @data = array
      end
    end

    class Binary < String
    end

  end
end
