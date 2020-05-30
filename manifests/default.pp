

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

# Criação dos certificados
# ver dica em https://security.stackexchange.com/questions/106525/generate-csr-and-private-key-with-password-with-openssl/106530#106530
exec {"certificado_1":
	command => "openssl req -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.csr -subj \"/C=BR/ST=RS/L=Ijui/O=Unijui/OU=DCEEng/CN=localhost.com\" " ,
	require => Class["arquivos"]
}


exec {"certificado_2":
	command => "sudo openssl x509 -req -days 365 -in localhost.csr -signkey localhost.key -out localhost.crt ",
	require => Exec['certificado_1']
}

exec {"nginx_restart":
	command => "sudo service nginx restart ",
	require => Exec['certificado_2']
}

#Fim da criação dos certificados

include system-update
include nginx
include squid3
include arquivos
include rules
include postfix
include user_postfix
include mutt_postfix
include mailutils_postfix


