

Exec { path => [ "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin" ] }


package { [
    'vim',
    'links',
    'lynx-cur'
  ]:
  require => Class["system-update"], 
  ensure  => 'installed',
}
	
#faz a reconfiguração do squid após a alteração no squid.conf
exec { "reconfigure_squid":
	command => "sudo squid3 -k reconfigure",
	require => Class["squid3"],
  before => Exec ["restart_squid"],
}

#reinicializa o serviço após a reconfiguração do squid
exec { "restart_squid":
	command => "sudo service squid3 restart",
  require => Class["arquivos"],
  subscribe => Exec["reconfigure_squid"], #só executa após o reconfigure
}

include system-update
include nginx
include squid3
include arquivos



