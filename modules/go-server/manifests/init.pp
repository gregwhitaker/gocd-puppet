class go-server(
  $version = undef
) {

  tag 'go-server'

  file { '/opt/go-server':
    ensure => directory,
  } ->

  exec { 'go-package':
    command => "/usr/bin/wget http://dl.bintray.com/gocd/gocd-deb/go-server-$version.deb -O /opt/go-server/go-server.deb",
    cwd => '/opt/go-server',
    creates => '/opt/go-server/go-server.deb',
  } ->

  package { 'unzip':
    ensure => installed,
  } ->

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  } ->

  package { 'go-server':
    provider => dpkg,
    ensure => installed,
    source => '/opt/go-server/go-server.deb',
    require => Class['java'],
  }

  service { 'go-server':
    ensure => running,
    enable => true,
    require => Package['go-server'],
  }
}
