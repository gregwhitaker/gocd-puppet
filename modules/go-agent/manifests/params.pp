class go-agent::params {
  $version = $go-agent::version
  case $::osfamily {
    'Debian': {
      $package_details = {
        'provider' => dpkg,
        'package_url' => "http://dl.bintray.com/gocd/gocd-deb/go-agent-$version.deb",
        'java_class' => Class['java::debian'],
        'java_home' => "/usr/lib/jvm/java-7-openjdk-i386/jre"
      }
    }
    'Suse': {
      $package_details = {
        'provider' => rpm,
        'package_url' => "http://dl.bintray.com/gocd/gocd-rpm/go-agent-$version.noarch.rpm",
        'java_class' => Class['java::suse'],
        'java_home' => '/usr/java/jre1.7.0_67'
      }
    }
  }
}
