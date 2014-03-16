# Foreman::Export::Nginx

Export Nginx configuration files using Foreman.

## Installation

Add this line to your application's Gemfile:

    gem 'foreman-export-nginx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install foreman-export-nginx

## Usage

`nginx-foreman export nginx [additonal options]`

There is one requied and several optional environment variables:

* `BASE_DOMAIN` **required** The nginx `server_name` will be set to `app_name.base_domain`. For example: `appname.example.com` if `BASE_DOMAIN=example.com`.
* `ADDITIONAL_DOMAINS` any additional domains to listen for.
* `USE_SSL` true to listen on ssl
* `SSL_CERT_PATH` path to the certificate to use for ssl. Optional if you've set up a wildcard cert.
* `SSL_KEY_PATH` path to the certificate key. Required if you specified `SSL_CERT_PATH`.
* `FORCE_SSL` true to force redirect to SSL
* `FORCE_DOMAIN` redirect all requests to this domain

## Contributing

Email patches to [foreman-export-nginx@petekeen.net](mailto:foreman-export-nginx@petekeen.net).

## License

MIT
