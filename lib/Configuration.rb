=begin
Copyright (c) 2011 Litle & Co.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end

require 'yaml'

#
# Loads the configuration from a file
#
module LitleOnline
  module Configuration
    extend self

    @config = {
      'user'                  => '',
      'password'              => '',
      'default_report_group'  => 'Default Report Group',
      'version'               => '8.13',
      'url'                   => 'https://www.testlitle.com/sandbox/communicator/online',
      'printxml'              => true,
      'timeout'               => 65,
      'currency_merchant_map' => {
        'DEFAULT' => ''
      }
    }

    @valid_config_keys = @config.keys

    def configure(options={})
      options.each do |k, v|
        k_string = k.to_s
        @config[k_string] = v if @valid_config_keys.include?( k_string )
      end
    end

    def self.configure_with(path_to_yaml_file)
      begin
        config = YAML::load(IO.read(path_to_yaml_file))
      rescue Errno::ENOENT
        log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
      rescue Psych::SyntaxError
        log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
      end

      configure(config)
    end

    def self.config
      @config
    end
  end
end
