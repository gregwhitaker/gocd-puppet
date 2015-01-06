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
    require => Class['java'],
  }

  package { 'go-agent':
    provider => dpkg,
    ensure => installed,
    source => '/opt/go-agent/go-agent.deb',
    require => Exec['go-agent-package'],
  }

  service { 'go-agent':
    ensure => running,
    enable => true,
    require => Package['go-agent'],
  }
}
