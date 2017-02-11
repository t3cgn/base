class imagemagick {
  package { 'ImageMagick':
    ensure => installed,
  }
  package { 'ImageMagick-devel':
    ensure => installed,
  }
}
