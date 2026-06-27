---
title: iOS
description: Configure DadsDNS on iOS devices.
---

[Skip to content](#%5Ftop) 

# Configure iOS device

## Configure DadsDNS for ANFS Families

Note: 
This configuration only applies to the Wi-Fi network you are currently connected to. You will need to repeat these steps for each new Wi-Fi network. This method does not work for cellular connections.

Take note of any DNS addresses you might have set up, and save them in a safe place in case you need to use them later.

1. Go to **Settings** \> **Wi-Fi**.
2. Select the **'i'** icon next to the Wi-Fi network you are connected to.
3. Scroll down and select **Configure DNS**.
4. Change the configuration from **Automatic** to **Manual**.
5. Select **Add Server**.
6. Depending on what you want to configure, choose one of the following DNS addresses for IPv4:  

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

7. Depending on what you want to configure, choose one of the following Cloudflare DNS addresses for IPv6:  

Note - DadsDNS is not IPv6 enabled yet. The following information is for Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```
8. Select **Save**.

Note

Setting up a static IP address to configure a DNS server may prevent you from connecting to some public Wi-Fi networks that use captive portals — these are the web pages some wireless networks employ to let users log in and use their services.

If you are experiencing connectivity issues related to captive portals:

1. Remove the static IP addresses from the device.
2. Connect to the Wi-Fi network.
3. Once the connection has been established, re-add the static IP addresses.
