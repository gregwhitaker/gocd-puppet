import 'vars.pp'

include java

class { 'go_server':
  version => '14.4.0-1356'
}

class { 'go_agent':
  version => '14.4.0-1356'
}

$scm_deps = ['git', 'subversion']
package { $scm_deps:
  ensure => installed
}
