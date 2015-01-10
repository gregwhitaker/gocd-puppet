class go-server(
  $version = undef
) {

  tag 'go-server'

  include go-server::params

  $package_url = $params::package_details['package_url']
  $provider = $params::package_details['provider']
  $java = $params::package_details['java_class']
  $package_path = "/opt/go-server/go-server.$provider"

  file { '/opt/go-server':
    ensure => directory,
  } ->

  exec { 'go-package':
    command => "/usr/bin/wget $package_url -O $package_path",
    cwd => '/opt/go-server',
    creates => $package_path
  } ->

  package { 'unzip':
    ensure => installed,
  } ->

  package { 'go-server':
    provider => $provider,
    ensure => installed,
    source => $package_path,
    require => $java
  }

  service { 'go-server':
    ensure => running,
    enable => true,
    require => Package['go-server'],
  }
}
