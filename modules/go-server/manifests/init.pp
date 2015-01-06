class go-server(
  $version = undef
) {

  include java

  file { '/opt/go-server':
    ensure => directory,
  }

  exec { 'go-package':
    command => "/usr/bin/wget http://dl.bintray.com/gocd/gocd-deb/go-server-$version.deb -O /opt/go-server/go-server.deb",
    cwd => '/opt/go-server',
    creates => '/opt/go-server/go-server.deb',
  }

  package { 'unzip':
    ensure => installed,
  }

  package { 'go-server':
    provider => dpkg,
    ensure => installed,
    source => '/opt/go-server/go-server.deb',
    require => Exec['go-package'],
  }

  service { 'go-server':
    ensure => running,
    enable => true,
    require => Package['go-server'],
  }
}
