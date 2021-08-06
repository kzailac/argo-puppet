class argo::mon::egi (
  $local_ini='puppet:///modules/argo/mon/egi/90-local.ini',
) {
  include yum::repo::nordugrid

  File {
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
  }

  file { '/etc/arc/nagios/90-local.ini':
    source  => $local_ini,
    require => Package['nordugrid-arc-nagios-plugins-egi'],
  }

  package { ['condor', 'nordugrid-arc-nagios-plugins-egi', 'nagios-plugins-igtf']:
  }

  file { '/var/lib/gridprobes/biomed':
    ensure => directory,
    owner  => 'nagios',
    group  => 'nagios',
  }
}
