class go-agent(
  $version = undef
) {

  tag 'go-agent'

  include go-agent::params

  $package_url = $params::package_details['package_url']
  $provider = $params::package_details['provider']

  file { '/opt/go-agent':
    ensure => directory,
  }
  
  exec { 'go-agent-package':
    command => "/usr/bin/wget $package_url -O /opt/go-agent/go-agent.deb",
    cwd => '/opt/go-agent',
    creates => '/opt/go-agent/go-agent.deb',
  } ->

  exec { 'apt update':
    command => '/usr/bin/apt-get update',
  } ->

  package { 'go-agent':
    provider => $provider,
    ensure => installed,
    source => '/opt/go-agent/go-agent.deb',
    require => Class['java']
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
