include ntp
include java

class { 'go-server':
  version => '14.4.0-1356'
}

class { 'go-agent':
  version => '14.4.0-1356'
}
