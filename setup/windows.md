---
title: Windows
description: Configure DadsDNS for ANFS Families on Windows.
---

[Skip to content](#%5Ftop) 

# Windows

## Windows 10

Take note of any DNS addresses you might have set up, and save them in a safe place in case you need to use them later.

1. Select the **Start menu** \> **Settings**.
2. On **Network and Internet**, select **Change Adapter Options**.
3. Right-click on the Ethernet or Wi-Fi network you are connected to and select **Properties**.
4. Select **Internet Protocol Version 4**.
5. Select **Properties** \> **Use the following DNS server addresses**.
6. Choose one of the following DNS addresses for IPv4:  
```
family.dadsdns.site
1.1.1.3
1.0.0.3  
```
7. Select **OK**.
8. Select **Internet Protocol Version 6**.
9. Select **Properties** \> **Use the following DNS server addresses**.
10. Choose one of the following DNS addresses for IPv6:  

Note: DadsDNS is not IPv6-enabled yet. The following information is for Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```
11. Select **OK**.

## Windows 11

Take note of any DNS addresses you might have set up, and save them in a safe place in case you need to use them later.

1. Select the **Start menu** \> **Settings**.
2. On **Network and Internet**, select the adapter you want to configure — such as your Ethernet adapter or Wi-Fi card.
3. Scroll to **DNS server assignment** and select **Edit**.
4. Select the **Automatic (DHCP)** drop-down menu > **Manual**.
5. Select the **IPv4** toggle to turn it on.
6. Choose one of the following DNS addresses for IPv4:  
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

7. Select the **IPv6** toggle.
8. Depending on what you want to configure, choose one of the following DNS addresses for IPv6:  

Note - DadsDNS is not IPv6 enabled yet. The following information is for Cloudflare Family DNS resolver.

Block malware with 1.1.1.1 for Families  
```  
2606:4700:4700::11122606:4700:4700::1002  
```  
Block malware and adult content with 1.1.1.1 for Families  
```  
2606:4700:4700::11132606:4700:4700::1003  
```
9. Select **Save**.

Note

Setting a static IP address to configure a DNS server may prevent you from connecting to some public Wi-Fi networks that use captive portals — the web pages some wireless networks use to require users to log in before using their services.

If you are experiencing connectivity issues related to captive portals:

1. Remove the static IP addresses from the device.
2. Connect to the Wi-Fi network.
3. Once the connection has been established, re-add the static IP addresses.
