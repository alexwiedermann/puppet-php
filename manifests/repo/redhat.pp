# Configure a yum repo for RedHat-based systems
#
# === Parameters
#
# [*yum_repo*]
#   Class name of the repo under ::yum::repo
#

class php::repo::redhat (
  $yum_repo = undef,
) {
  
  $releasever = $facts['os']['name'] ? {
    /(?i:Amazon)/ => '6',
    default       => '$releasever',  # Yum var
  }

  yumrepo { 'remi':
    descr      => 'Remi\'s RPM repository for Enterprise Linux $releasever - $basearch',
    mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/remi/mirror",
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
    priority   => 1,
  }

  if ($yum_repo == 'remi_php70') {
    yumrepo { 'remi-php70':
      descr      => 'Remi\'s PHP 7.0 RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/php70/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }
  } elsif ($yum_repo == 'remi_php55') {
    yumrepo { 'remi-php55':
      descr      => 'Remi\'s PHP 5.5 RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/php55/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }
  } elsif ($yum_repo == undef) {
    yumrepo { 'remi-php56':
      descr      => 'Remi\'s PHP 5.6 RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/php56/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }
  }
}
