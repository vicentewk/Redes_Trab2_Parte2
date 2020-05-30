class postfix::config{
file {'/etc/postfix/main.cf':
    ensure => file,
	require => Package['postfix'],
 	owner  => 'root',
	group  => 'root',
	mode   => '0644',
	source => 'puppet:///modules/postfix/main.cf',
}

file {'/etc/postfix/virtual':
    ensure => file,
	require => Package['postfix'],
 	owner  => 'root',
	group  => 'root',
	mode   => '0644',
	source => 'puppet:///modules/postfix/virtual',
}
}

