class java::suse {

  file { '/opt/jre':
    ensure => directory,
  } ->

  file { '/opt/jre/jre-7u67.rpm':
    path => '/opt/jre/jre-7u67.rpm',
    source => "puppet:///modules/java/jre-7u67-linux-x64.rpm",
    owner => 'root',
    group => 'root',
    mode => 0644,
  } ->

  package { 'jre':
    provider => rpm,
    source => "/opt/jre/jre-7u67.rpm",
    ensure => installed
  }
}
