---
title: Set up
description: Learn how to set up DadsDNS DNS resolver for enhanced security and privacy. Protect against malware, adult content, fakenews and gambling website with easy configuration. The service uses Technitium server and includes several blocklist. It also uses Cloudflare's Family DNS servers to resolve names. This instruction is primarily adopted from Cloudflare's documentation.
image: https://developers.cloudflare.com/cf-twitter-card.png
---

[Skip to content](#%5Ftop) 

# Background
Every time you try to open a website in your browser, your devices use a [DNS server ↗](https://www.cloudflare.com/learning/dns/what-is-dns/) that is usually provided by your Internet service provider (ISP) to translate the website's domain name like [anfscanberra.org.au ↗](https://anfscanberra.org.au) to its IP address like *198.38.93.191* where the website is hosted. By using DadsDNS Server for this translation job, your device will receives *address not found* response for malware, fakenews, adult content and gambling websites.

DadsDNS is primarily created for Hamro Pathshala and Australia Nepal Friendship Society (ANFS) member families to reduce exposure to certain types of websites. It uses *Technitium* open source DNS server software to the provide DNS service. It uses the following blocklists developed and maintained by dedicated individuals who like to keep the internet cleaner:
- [Steven Black's fakenews, gambling and porn website list] (https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts)
- https://big.oisd.nl/domainswild2
- https://nsfw.oisd.nl/domainswild2
- [Hagezi](https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/wildcard/pro.plus-onlydomains.txt)
- [Shreshta's newly register domain list](https://shreshtait.com/newly-registered-domains/nrd-1w)
- [Zetasquare's allow list placeholder] (https://raw.githubusercontent.com/zetasquareau/dadsdnslists/refs/heads/main/allowlist)
- [Zetasquare's block list placeholder] (https://raw.githubusercontent.com/zetasquareau/dadsdnslists/refs/heads/main/blocklist)

This list may be extended to include additional list in future. 

DadsDNS currently forwards all DNS queries to [Cloudflare's Family DNS server ↗](https://one.one.one.one/family) that further blocks malware and adult content websites. DadsDNS is hosted in [AWS ↗](https://aws.amazon.com/) by ZetaSquare Australia. The cost of this hosting service is funded by Australia Nepal Friendship Society (ANFS) through an Australian Government's Cybersecurity Grant.

Disclaimer: This service has been provisioned for ANFS members only. ZetaSquare, ANFS and funding bodies are not liable for any harm caused by unauthorised use of this service.

# Set up
By default, your devices use a [DNS server ↗](https://www.cloudflare.com/learning/dns/what-is-dns/) provided by your Internet service provider (ISP) who may also sell additional family protection services. If you like, you can change this to use family.dadsdns.site instead. It uses [Cloudflare's Free Family DNS Service](https://one.one.one.one/family) and blocks additional websites to help you protect your family.

Follow the instructions for your device or router below to use DadsDNS service for free.

Device or router specific guides

* [ Android ](./android/)
* [ iOS ](./ios/)
* [ Gaming consoles ](./gaming-consoles/)
* [ Windows ](./windows/)
* [ macOS ](./macos/)
* [ Router ](./router/)

DadsDNS uses the same privacy commitments as the [Cloudflare's privacy commitments](https://developers.cloudflare.com/family.dadsdns.site/privacy/public-dns-resolver/).

---

## DadsDNS for ANFS Families

DadsDNS for ANFS Families automatically blocks DNS queries to domains associated with malware, phishing, fakenew, gambling and adult content.

Use the following DNS resolvers to block malware and adult content:

* `family.dadsdns.site`

When a queried domain is classified as blacklisted, DadsDNS returns the address `0.0.0.0` instead of the real address. This prevents your device from connecting to the blocked site.

### Test DadsDNS for ANFS Families

After configuring DadsDNS for ANFS Families, verify that filtering is working with the following test URLs:

* [https://malware.testcategory.com/ ↗](https://malware.testcategory.com/) — Tests whether known malware domains are blocked.
* [https://nudity.testcategory.com/ ↗](https://nudity.testcategory.com/) — Tests whether adult content and malware domains are blocked.

### DNS over HTTPS (DoH)

DNS over HTTPS (DoH) encrypts your DNS queries by sending them as HTTPS requests. This prevents anyone between your device and the resolver — such as your ISP or a network attacker — from seeing which domains you look up. For more information, refer to the [Learning Center article on DNS encryption ↗](https://www.cloudflare.com/learning/dns/dns-over-tls/).

To configure an encrypted DoH connection to DadsDNS for ANFS Families, enter one of the following URLs in your DoH-compatible client or router:

```
https://family.dadsdns.site/dns-query
```

### DNS over TLS (DoT)

DNS over TLS (DoT) encrypts DNS queries using TLS on a dedicated port (`853`). Like DoH, it prevents eavesdropping on your DNS traffic. For more information, refer to the [Learning Center article on DNS encryption ↗](https://www.cloudflare.com/learning/dns/dns-over-tls/).

To configure an encrypted DoT connection to DadsDNS for ANFS Families, enter one of the following hostnames in your DoT-compatible client or router:

```
family.dadsdns.site
```

