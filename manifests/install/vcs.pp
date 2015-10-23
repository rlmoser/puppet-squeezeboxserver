class squeezeboxserver::install::vcs {
  # TODO: make these parameters
  $install_destination = '/opt/slimserver'
  $install_source      = 'https://github.com/Logitech/slimserver.git'
  $install_revision    = 'public/7.9'
  $install_vcsprovider = 'git'
  $install_ensure      = 'present'
  $service_bin         = "${install_destination}/server.pl"
  $service_charset     = 'utf8'
  $service_options     = ''
  $service_file        = '/etc/systemd/system/squeezeboxserver.service'
  $service_filemode    = '0644'
  $service_template    = 'puppet:///squeezeboxserver/squeezeboxserver.service.erb'
  $user_name           = 'squeezeboxserver'
  $user_ensure         = 'present'
  $user_comment        = 'Logitech Media Server user'
  $conf_dir            = '/etc/squeezeboxserver'
  $conf_dir_ensure     = 'directory'
  $conf_files_ensure   = 'file'
  $lib_dir             = '/var/lib/squeezeboxserver'
  $lib_dir_ensure      = 'directory'
  $data_dir            = "${lib_dir}/cache"
  $data_dir_ensure     = 'directory'
  $log_dir             = '/var/log/squeezeboxserver'
  $log_dir_ensure      = 'directory'
  $plugin_dir          = "${lib_dir}/Plugins"
  $plugin_dir_ensure   = 'directory'
  $pref_dir            = "${lib_dir}/prefs"
  $pref_dir_ensure     = 'directory'
  $use_systemd         = true
  
  # TODO: logic for ensure: absent

  vcsrepo {$install_destination:
    ensure   => $install_ensure,
    provider => $install_vcsprovider,
    source   => $install_source,
    revision => $install_revision,
    # TODO: test to see if having depth attribute breaks svn
    depth    => 1,
  }
  
  group {$user_name:
    ensure => $user_ensure,
    system => true,
  }

  user {$user_name:
    ensure  => $user_ensure,
    comment => $user_comment,
    gid     => $user_name,
    system  => true,
  }
  
  # TODO: SELinux setup for directories/files

  file {$conf_dir:
    ensure  => $conf_dir_ensure,
    # possibly use root:root
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
  }

  file {$lib_dir:
    ensure  => $lib_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
  }

  file {$data_dir:
    ensure  => $data_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
  }

  file {$log_dir:
    ensure  => $log_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
  }

  file {$plugin_dir:
    ensure  => $plugin_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
  }

  file {$pref_dir:
    ensure  => $pref_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
    }

  file {"${conf_dir}/convert.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    replace => false,
    source  => "${install_destination}/convert.conf",
  }
  
  file {"${conf_dir}/modules.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    replace => false,
    source  => "${install_destination}/modules.conf",
  }

  file {"${conf_dir}/types.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    replace => false,
    source  => "${install_destination}/types.conf",
  }

  file {$service_file:
    ensure  => $conf_files_ensure,
    owner   => root,
    group   => root,
    mode    => $service_filemode,
    replace => false,
    content => template($service_template),
  }

}