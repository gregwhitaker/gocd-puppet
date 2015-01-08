class go-agent::params {
  case $::osfamily {
    'Debian': {
      $package_details = {
        'provider' => dpkg,
        'package_url' => "http://dl.bintray.com/gocd/gocd-deb/go-agent-$version.deb"
      }
    }
    'Suse': {
      $package_details = {
        'provider' => rpm,
        'package_url' => "http://dl.bintray.com/gocd/gocd-rpm/go-agent-$version.noarch.rpm"
      }
    }
  }
}
