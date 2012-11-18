module Foreman
  module Export
    class Nginx
      def export
        super

        engine.each_process do |name, process|
          next unless name == 'web'
          env = engine.env.merge("PORT" => port) # Merge our port into our services ENV


          ports = []
          1.upto(engine.formation[name]) do |num|
            ports << engine.port_for(process, num)
          end

          write_template("nginx/nginx.erb", "#{app}.conf", binding)
        end
      end
    end
  end
end
