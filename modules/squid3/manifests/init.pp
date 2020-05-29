class squid3{

  package {"squid3":
    ensure=>present,
    require=> Class["system-update"],
  }

  service {"squid3":
    ensure=>running,
    require=> Package["squid3"],
  }

}
