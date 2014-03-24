# ChawkRemote

This is a remote client library for the Chawk time series storage engine.  It also includes a command-line client, chawk_remote

## Installation

Add this line to your application's Gemfile:

    gem 'chawk_remote'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chawk_remote

## Usage

Shortened response commands

	chawk_remote -h http://localhost:3000 -n 1 -x client_api_id -a api_key clear

	{"addr"=>"1", "prepared_at"=>"2014-03-24T08:39:48-04:00", "key_expires"=>"2014-04-06T00:43:09.102Z"}

Standard response commands

	chawk_remote -h http://localhost:3000 -n 1 -x client_api_id -a api_key add 1,2,3

	chawk_remote -h http://localhost:3000 -n 1 -x client_api_id -a api_key increment 10

	chawk_remote -h http://localhost:3000 -n 1 -x client_api_id -a api_key decrement 10

	{"addr"=>"1", 
		"prepared_at"=>"2014-03-24T08:34:26-04:00", 
		"key_expires"=>"2014-04-06T00:43:09.102Z", 
		"last"=>{
			"v"=>2, 
			"t"=>1395664466.422626, 
			"m"=>{"source"=>"chawk_remote/chawkolate_api_v_0.2.0"}
			}, 
		"max"=>3, 
		"min"=>1, 
		"length"=>4
	}

Full response commands

	chawk_remote -h http://localhost:3000 -n 1 -x client_api_id -a api_key last

	{"addr"=>"1", 
		"prepared_at"=>"2014-03-24T08:34:26-04:00", 
		"key_expires"=>"2014-04-06T00:43:09.102Z", 
		"data"=>[
			{"v"=>1, "t"=>1395664893.472671, "m"=>{"source"=>"chawk_remote/chawkolate_api_v_0.2.0"}, "i"=>1}, 
			{"v"=>2, "t"=>1395664893.472671, "m"=>{"source"=>"chawk_remote/chawkolate_api_v_0.2.0"}, "i"=>2}, 
			{"v"=>3, "t"=>1395664893.472671, "m"=>{"source"=>"chawk_remote/chawkolate_api_v_0.2.0"}, "i"=>3}], 
		"last"=>{
			"v"=>2, 
			"t"=>1395664466.422626, 
			"m"=>{"source"=>"chawk_remote/chawkolate_api_v_0.2.0"}
			}, 
		"max"=>3, 
		"min"=>1, 
		"length"=>4
	}

## Contributing

1. Fork it ( http://github.com/<my-github-username>/chawk_remote/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
