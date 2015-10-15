class squeezeboxserver::install::vcs {
  # TODO: make these parameters
  $install_destination = '/opt/slimserver'
  $install_source      = 'https://github.com/Logitech/slimserver-platforms.git'
  $install_revision    = 'public/7.9'
  $install_vcsprovider = 'git'
  $install_ensure      = 'present'
  $user_name           = 'squeezeboxserver'
  $user_ensure         = 'present'
  $user_comment        = 'Logitech Media Server user'
  $conf_dir            = '/etc/squeezeboxserver'
  $conf_dir_ensure     = 'directory'
  $conf_files_ensure   = 'file'
  $data_dir            = '/var/lib/squeezeboxserver/cache'
  $data_dir_ensure     = 'directory'
  $log_dir             = '/var/log/squeezeboxserver'
  $log_dir_ensure      = 'directory'
  $plugin_dir          = '/var/lib/squeezeboxserver/Plugins'
  $plugin_dir_ensure   = 'directory'
  $pref_dir            = '/var/lib/squeezeboxserver/prefs'
  $pref_dir_ensure     = 'directory'
  
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
    require => User[$user_name],
  }

  file {$data_dir:
    ensure  => $data_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
    require => User[$user_name],
  }

  file {$log_dir:
    ensure  => $log_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
    require => User[$user_name],
  }

  file {$plugin_dir:
    ensure  => $plugin_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
    require => User[$user_name],
  }

  file {$pref_dir:
    ensure  => $pref_dir_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0755',
    require => User[$user_name],
    }

  file {"${conf_dir}/convert.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    require => User[$user_name],
    replace => false,
    source  => "${install_destination}/convert.conf",
  }
  
  file {"${conf_dir}/modules.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    require => User[$user_name],
    replace => false,
    source  => "${install_destination}/modules.conf",
  }

  file {"${conf_dir}/types.conf":
    ensure  => $conf_files_ensure,
    owner   => $user_name,
    group   => $user_name,
    mode    => '0644',
    require => User[$user_name],
    replace => false,
    source  => "${install_destination}/types.conf",
  }

}