class java::debian {

  exec { 'apt update':
    command => '/usr/bin/apt-get update',
  } ->

  package { 'openjdk-7-jre':
      ensure => installed
  }
}
