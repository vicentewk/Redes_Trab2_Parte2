
class user_postfix {
  file {'/home/vagrant/createUser.sh':
      ensure => file,
      require => Class["system-update"],
      owner => 'root',
      group => 'root',
      mode   => '0644', 
      source => 'puppet:///modules/user_postfix/createUser.sh',
       notify => Exec['extract_editor_script'],
      }

      exec { 'extract_editor_script':
  command => "sudo bash '/home/vagrant/createUser.sh'",
}
}

