import 'vars.pp'

include java

class { 'go_server':
  version => '14.4.0-1356'
}

class { 'go_agent':
  version => '14.4.0-1356'
}
