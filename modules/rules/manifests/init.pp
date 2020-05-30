class rules {	
    exec { 'bash /home/vagrant/run.sh':
    command => 'bash /home/vagrant/run.sh',
    require => file['/home/vagrant/run.sh'],
  }
}
