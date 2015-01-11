class go-agent(
  $version = undef
) {

  tag 'go-agent'

  include go-agent::params

  $package_url = $params::package_details['package_url']
  $provider = $params::package_details['provider']
  $java_class = $params::package_details['java_class']
  $java_home = $params::package_details['java_home']
  $package_path = "/opt/go-agent/go-agent.$provider"

  file { '/opt/go-agent':
    ensure => directory,
  }
  
  exec { 'go-agent-package':
    command => "/usr/bin/wget $package_url -O $package_path",
    cwd => '/opt/go-agent',
    creates => $package_path,
  } ->

  package { 'go-agent':
    provider => $provider,
    ensure => installed,
    source => $package_path,
    require => $java_class
  } ->

  file { 'go-agent-config':
    path => '/etc/default/go-agent',
    owner => 'go',
    group => 'go',
    mode => 0644,
    content => template('go-agent/go-agent-template.erb'),
  } ~>

  service { 'go-agent':
    ensure => running,
    enable => true,
    require => Package['go-agent'],
  }
}
