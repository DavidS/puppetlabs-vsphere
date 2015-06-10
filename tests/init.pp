vsphere_vm { '/opdx1/vm/eng/garethr/garethr-test':
  ensure => present,
  source => '/opdx1/vm/eng/templates/debian-wheezy-3.2.0.4-amd64-vagrant-vmtools_9349',
  memory => 1024,
  cpus   => 2,
}

vsphere_vm { '/opdx1/vm/eng/garethr/garethr-template':
  ensure   => present,
  source   => '/opdx1/vm/eng/templates/debian-wheezy-3.2.0.4-amd64-vagrant-vmtools_9349',
  template => true,
}

vsphere_vm { '/opdx1/vm/eng/garethr/garethr-linked-clone':
  ensure       => present,
  source       => '/opdx1/vm/eng/garethr/garethr-test',
  linked_clone => true,
}
