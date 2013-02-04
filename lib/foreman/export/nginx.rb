require 'foreman/export'

module Foreman
  module Export
    class Nginx < Foreman::Export::Base

      def env_var(key)
        val = ENV[key]
        val == "" ? nil : val
      end

      def export
        super

        engine.each_process do |name, process|
          next unless name == 'web'

          base_domain = env_var('BASE_DOMAIN') or raise "Need a BASE_DOMAIN"
          additional_domains = (env_var('ADDITIONAL_DOMAINS') || '').split(',').join(' ')
          use_ssl = !!env_var('USE_SSL')
          ssl_cert_path = env_var('SSL_CERT_PATH')
          ssl_key_path  = env_var('SSL_KEY_PATH')
          force_ssl = !!env_var('FORCE_SSL')
          force_domain = env_var('FORCE_DOMAIN')

          ports = []
          1.upto(engine.formation[name]) do |num|
            ports << engine.port_for(process, num)
          end

          content = File.read(File.expand_path("../../../../data/export/nginx/nginx.erb", __FILE__))
          result = ERB.new(content, nil, '-').result(binding)
          write_file "#{app}.conf", result
        end
      end
    end
  end
end
