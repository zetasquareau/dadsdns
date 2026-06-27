---
title: Android
description: Learn how to set up DadsDNS for ANFS Families DNS resolver on Android devices. 
---

[Skip to content](#%5Ftop) 

# Configure DadsDNS 

## Android 9 and later

Android 9 and later support encrypted DNS through a feature called Private DNS, which uses DNS-over-TLS (DoT), or DNS-over-HTTP/3\. When you configure Private DNS, your device uses that DNS resolver on all networks — including cellular.

1. Go to **Settings** \> **Network & internet**.
2. Select **Advanced** \> **Private DNS**.
3. Select the **Private DNS provider hostname** option.
4. Enter one of the following hostnames and select **Save**.

Use DadsDNS resolver for full protection

* `family.dadsdns.site`

If you prefer to use Cloudflare directly to block malware and adult content with 1.1.1.1 for Families, use

* `family.cloudflare-dns.com`

Or the corresponding IP address if your device requires it:

* **IPv4**: `1.1.1.3` or `1.0.0.3`
* **IPv6**: `2606:4700:4700::1113` or `2606:4700:4700::1003`

## Previous Android versions

Before making changes, take note of any DNS addresses you might have and save them in a safe place in case you need to use them later.

1. Open **Settings** \> **Wi-Fi**.
2. Press down and hold the name of the network you are currently connected to.
3. Select **Modify Network**.
4. Select the checkbox **Show Advanced Options**.
5. Change the IP Settings to **Static**.
6. Depending on what you want to configure, choose one of the following DNS addresses for IPv4:  

For full protection 
```
family.dadsdns.site
1.1.1.3
1.0.0.3  
```

For malware only
```
family.dadsdns.site
1.1.1.2
1.0.0.2  
```


7. Depending on what you want to configure, choose one of the following DNS addresses for IPv6:

Note - DadsDNS is not IPv6 enabled yet. The following information is for Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```

8. Select **Save**. You may need to disconnect from the Wi-Fi and reconnect for the changes to take effect.

Note

Setting up a static IP address to configure a DNS server may prevent you from connecting to some public Wi-Fi networks that use captive portals — these are the web pages some wireless networks employ to let users log in and use their services.

If you are experiencing connectivity issues related to captive portals:

1. Remove the static IP addresses from the device.
2. Connect to the Wi-Fi network.
3. Once the connection has been established, re-add the static IP addresses.
