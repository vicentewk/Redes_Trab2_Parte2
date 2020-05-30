class arquivos {



#criação do diretório imagens
file {'/usr/share/nginx/www/imagens':
	     ensure => directory,
       require => Class["nginx"],
	     owner  => 'root',
	     group  => 'root',
	     mode   => '0644';
	   } 
#criação do diretório css
     file {'/usr/share/nginx/www/css':
	     ensure => directory,
       require => Class["nginx"],
	     owner  => 'root',
	     group  => 'root',
	     mode   => '0644';
	   } 



#criação do arquivo index html
file {'/usr/share/nginx/www/index.html':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/html/fontehtml.txt',
   } 



#criação do arquivo de estilos css
   file {'/usr/share/nginx/www/css/estilo.css':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/css/fontecss.txt',
   } 

#criação dos arquivos de imagem
file {'/usr/share/nginx/www/imagens/user.png':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/user.png',
   } 

   file {'/usr/share/nginx/www/imagens/banner.jpg':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/banner.jpg',
   } 

   file {'/usr/share/nginx/www/imagens/nginx.png':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/nginx.png',
   } 

   file {'/usr/share/nginx/www/imagens/arvore.png':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/arvore.png',
   } 

    file {'/usr/share/nginx/www/imagens/proxy.png':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/proxy.png',
   } 

    file {'/usr/share/nginx/www/imagens/squid.png':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/squid.png',
   } 

    file {'/usr/share/nginx/www/imagens/squid_banner.jpg':
     ensure => file,
     require => Class["nginx"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/imagens/squid_banner.jpg',
   } 
#fim da criação dos arquivos de imagem
		

    
# Insere o arquivo default no diretório destino--ssl
  file {'/etc/nginx/sites-enabled/default':
	ensure  => file,
	require => Class["nginx"],
	owner => "root",
	group => "root",
	mode => "755",
	source => "puppet:///modules/arquivos/ssl/default",
	}



#criação dos arquivos do squid
#comando para criar bakcup do arquivo squid.conf original
    exec { "bkp_squid.conf_orig":
	          command => "sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig",
	          require => Class["squid3"], 
          }

#arquivo squid.conf, responsável pela configuração do squid.
#cria somente se o arquivo squid.conf.orig já tiver sido criado
file {'/etc/squid3/squid.conf':
     ensure => file,
     require => Class["squid3"],
     subscribe => Exec["bkp_squid.conf_orig"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/squid3/conf.txt',
     
   } 
#arquivo contendo a lista de sites banidos
   file {'/etc/squid3/ban.acl':
     ensure => file,
     require => Class["squid3"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/squid3/ban.txt',
   } 

#arquivo contendo a lista de sites banidos somente em um determinado período
   file {'/etc/squid3/ban_tempo.acl':
     ensure => file,
     require => Class["squid3"],
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/squid3/ban_tempo.txt',
   } 
#arquito run.sh-script do iptables
   file {'/home/vagrant/run.sh':
     ensure => file,
     owner  => 'vagrant',
     group  => 'vagrant',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/iptables/run.sh',

  } 
}


