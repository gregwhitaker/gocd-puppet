class go_server::params {
  $version = $go_server::version
  case $::osfamily {
    'Debian': {
      $package_details = {
        'provider' => dpkg,
        'package_url' => "http://dl.bintray.com/gocd/gocd-deb/go-server-$version.deb",
        'java_class' => Class['java::debian']
      }
    }
    'Suse': {
      $package_details = {
        'provider' => rpm,
        'package_url' => "http://dl.bintray.com/gocd/gocd-rpm/go-server-$version.noarch.rpm",
        'java_class' => Class['java::suse']
      }
    }
  }
}
