---
title: macOS
description: Configure DadsDNS for families on macOS.
---

[Skip to content](#%5Ftop) 

# macOS

These steps configure DadsDNS for ANFS Families as the DNS resolver for a specific network service (such as Wi-Fi or Ethernet) on your Mac.

Take note of any DNS addresses you might have set up, and save them in a safe place in case you need to use them later.

1. Go to **System Settings**. You can find it by pressing `CMD + Space` on your keyboard and typing `System Settings`.
2. Go to **Network**.
3. Select a network service.
4. Select **Details**.
5. Go to **DNS**.
6. Under **DNS Servers**, select **Add**.
7. Depending on what you want to configure, choose one of the following DNS addresses for IPv4:  
  
```
family.dadsdns.site
1.1.1.3
1.0.0.3 
```  

8. Depending on what you want to configure, choose one of the following DNS addresses for IPv6:

Note: DadsDNS is not IPv6-enabled yet. The following information is for the Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```
9. Select **OK**.

Note

Setting a static IP address to configure a DNS server may prevent you from connecting to some public Wi-Fi networks that use captive portals — the web pages some wireless networks use to require users to log in before using their services.

If you are experiencing connectivity issues related to captive portals:

1. Remove the static IP addresses from the device.
2. Connect to the Wi-Fi network.
3. Once the connection has been established, re-add the static IP addresses.
