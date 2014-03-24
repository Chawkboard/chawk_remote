require "chawk_remote/version"
require "httparty"

module ChawkRemote
  class Addr
    include HTTParty
    attr_accessor :host, :series_key, :client_id, :api_key

    def initialize(host, series_key, client_id, api_key)
      @host       = host
      @client_id  = client_id
      @api_key    = api_key
      @series_key = series_key

      #puts "#{@host} - #{@client_id} - #{@api_key} #{series_key}"

    end

    def clear
      r = HTTParty.put "#{@host}/api/v1/nodes/#{@series_key}/clear", :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""}
    end

    def add_points(points)
      r = HTTParty.post "#{@host}/api/v1/nodes/#{@series_key}/add_points", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""},
        :body => {"payload" => "{\"data\":[#{points.join(',')}]}", :meta => "{\"source\":\"chawk_remote\"}"}
    end

    def increment(count)
      r = HTTParty.put "#{@host}/api/v1/nodes/#{@series_key}/increment", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""},
        :body => {"payload" => "{\"data\":#{count}}", :meta => "{\"source\":\"chawk_remote\"}"}
    end

    def decrement(count)
      r = HTTParty.put "#{@host}/api/v1/nodes/#{@series_key}/decrement", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""},
        :body => {"payload" => "{\"data\":#{count}}", :meta => "{\"source\":\"chawk_remote\"}"}
    end

    def last(length)
      r = HTTParty.get "#{@host}/api/v1/nodes/#{@series_key}/last", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""}
    end

    def range(from, to)
      r = HTTParty.get "#{@host}/api/v1/nodes/#{@series_key}/range?from=#{from}&to=#{to}", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""}
    end

    def since (from)
      r = HTTParty.get "#{@host}/api/v1/nodes/#{@series_key}/since?from=#{from}", 
        :headers=>{"Authorization"=>"Token token=\"#{@client_id}/#{@api_key}\""}
    end

  end
end
