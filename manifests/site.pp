$GO_SERVER = '127.0.0.1'
$GO_SERVER_PORT = '8153'

include ntp
include java

class { 'go-server':
  version => '14.4.0-1356'
}

class { 'go-agent':
  version => '14.4.0-1356'
}
