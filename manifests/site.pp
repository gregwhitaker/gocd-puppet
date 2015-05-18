import 'vars.pp'

include java

class { 'go_server':
  version => '15.1.0-1863'
}

class { 'go_agent':
  version => '15.1.0-1863'
}

$scm_deps = ['git', 'subversion']
package { $scm_deps:
  ensure => installed
}
