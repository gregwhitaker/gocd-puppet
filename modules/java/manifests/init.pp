class java {

  tag 'go-server', 'go-agent'

  case $::osfamily {
    'Debian': {
      class { 'java::debian': }
    }
    'Suse': {
      class { 'java::suse': }
    }
  }
}
