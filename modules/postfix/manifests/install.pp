class postfix::install{
package{'postfix':
ensure => present,
require => Class["system-update"],
}
}
