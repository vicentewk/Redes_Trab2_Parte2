class postfix::service{
service { 'postfix':
ensure => running,
require => Class['postfix::config'],
hasstatus => true,
hasrestart => true,
enable => true,

}
}
