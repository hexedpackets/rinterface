$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "rubygems"
require "stringio"
require "eventmachine"
require "digest/md5"
require "rinterface/erlang/external_format"
require "rinterface/erlang/types"
require "rinterface/erlang/encoder"
require "rinterface/erlang/decoder"
require "rinterface/epmd"
require "rinterface/node"
require "rinterface/erl"
require "rinterface/sync"
