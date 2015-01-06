class go-agent(
  $version = undef
) {

  file { '/opt/go-agent':
    ensure => directory,
  }

  exec { 'go-agent-package':
    command => "/usr/bin/wget http://dl.bintray.com/gocd/gocd-deb/go-agent-$version.deb -O /opt/go-agent/go-agent.deb",
    cwd => '/opt/go-agent',
    creates => '/opt/go-agent/go-agent.deb',
  } ->

  exec { 'apt update':
    command => '/usr/bin/apt-get update',
  } ->

  package { 'go-agent':
    provider => dpkg,
    ensure => installed,
    source => '/opt/go-agent/go-agent.deb',
    require => Class['java']
  }

  service { 'go-agent':
    ensure => running,
    enable => true,
    require => Package['go-agent'],
  }
}
