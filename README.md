A DNSBL (Domain Name System Black List) is a list of IP address basically related to spam domain name sources. They are commonly used as a spam filter and can be very useful too for IP reputation and investigation. Each list has her own criteria, standards and policies. Some of them more trustworthy and respectable than others. To know if an IP is present in a DNSBL, in this script we are using the 'A' DNS record type.

If an IP is not black listed in a DNSBL, the query will return NXDOMAIN. If the IP is black listed, the query will return an address as code. The value of the last octet will indicate the category or the reason why this IP is black listed.

The thing is that, each DNSBL has her own value for each category in addition to have their own policies.:monocle_face:

 __An example return codes for Spamhaus__ :


Address |  Detail
-------- | ----------
127.0.0.2,3,9 |	Static UBE sources, verified spam services (hosting or support) and ROKSO spammers
127.0.0.4-7 	| Illegal 3rd party exploits, including proxies, worms and trojan exploits
127.0.0.10,11 |	IP ranges which should not be delivering unauthenticated SMTP email.


__Working Example__ :

For a DNS A query with Spamhaus and the IP 217.197.83.197, we need to reverse the order of octets :

```
$ host 197.83.197.217.zen.spamhaus.org
197.83.197.217.zen.spamhaus.org has address 127.0.0.2

or

$ dig +short A 197.83.197.217.zen.spamhaus.org
```

