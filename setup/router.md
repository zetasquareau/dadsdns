---
title: Router
description: Configure DadsDNS for ANFS Families on your router.
---

[Skip to content](#%5Ftop) 

# Router

Configuring DadsDNS for ANFS Families on your router applies the DNS setting to every device on your network. You do not need to change DNS settings on individual phones, computers, or other devices.

1. Go to the **IP address** used to access your router's admin console in your browser.

  * Linksys and Asus routers typically use `http://192.168.1.1` or `http://router.asus.com` (for ASUS).
  * Netgear routers typically use `http://192.168.1.1` or `http://routerlogin.net`.
  * D-Link routers typically use `http://192.168.0.1`.
  * Ubiquiti routers typically use `http://unifi.ubnt.com`.
  * MikroTik routers typically use `http://192.168.88.1`.
2. Enter the router credentials. For consumer routers, the default credentials for the admin console are often found under or behind the device.
3. In the admin console, locate the section where **DNS settings** are configured. This may be contained within categories such as **WAN** and **IPv6** (Asus routers), **IP** (MikroTik routers), or **Internet** (Netgear routers). Consult your router's documentation for details.
4. Take note of any DNS addresses that are currently set and save them in a safe place in case you need to use them later.
5. Choose one of the following DNS addresses for IPv4:  
For full protection 
```
family.dadsdns.site
1.1.1.3
1.0.0.3  
```

For malware only
```
1.1.1.2
1.0.0.2  
```

6. Choose one of the following DNS addresses for IPv6:  

Note - DadsDNS is not IPv6 enabled yet. The following information is for Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```
7. Save the updated settings.

## Use DNS over TLS on OpenWrt

If your router runs OpenWrt, you can encrypt DNS traffic using DNS over TLS. For setup instructions, refer to [Adding DNS-Over-TLS support to OpenWrt (LEDE) with Unbound ↗](https://blog.cloudflare.com/dns-over-tls-for-openwrt/).

## FRITZ!Box

Starting with [FRITZ!OS 7.20 ↗](https://en.avm.de/press/press-releases/2020/07/fritzos-720-more-performance-convenience-security/), DNS over TLS is supported. Refer to [Configuring different DNS servers in the FRITZ!Box ↗](https://en.avm.de/service/knowledge-base/dok/FRITZ-Box-7590/165%5FConfiguring-different-DNS-servers-in-the-FRITZ-Box/).
