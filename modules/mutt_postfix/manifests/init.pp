class mutt_postfix {

  package {'mutt':
    ensure => present,
    require => Class["postfix"],
  }

  
  #service {'mutt':
    #ensure  => 'running',
    #enable  => 'true',
   # require => Package['mutt']
  #}
}
