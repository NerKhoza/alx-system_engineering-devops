# Define Nginx class
class nginx {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    replace => true,
    content => template('nginx/default.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => File['/etc/nginx/sites-available/default'],
  }
}

# Define Nginx server configuration template
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
}

# Define default server block template
file { '/etc/nginx/sites-available/default.erb':
  ensure => file,
  source => 'puppet:///modules/nginx/default.erb',
}

# Define redirect server block template
file { '/etc/nginx/sites-available/redirect.erb':
  ensure => file,
  source => 'puppet:///modules/nginx/redirect.erb',
}

# Define Nginx server redirect resource
nginx::resource { 'redirect':
  ensure  => present,
  content => template('nginx/redirect.erb'),
  notify  => Service['nginx'],
}

# Include Nginx class
include nginx

