require 'foreman/export'

module Foreman
  module Export
    class Nginx < Foreman::Export::Base
      def export
        super

        engine.each_process do |name, process|
          next unless name == 'web'
          env = engine.env.merge("PORT" => port) # Merge our port into our services ENV

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
