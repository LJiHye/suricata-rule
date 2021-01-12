# Suricata-rule

## Overview
> Create a snort(suricata) rule file to detect specific site traffic.

### Description

1. Create a rule to detect 20 sites in the `test.rules` file.
2. Afterwards, check `fast.log` to see if 20 sites are properly detected.
3. If possible, try to implement detection of not only sites where plain text communication (HTTP) is performed, but also sites that perform TLS communication (HTTPS).

## Run

```
sudo ./test.sh
```

## ToDo
> HTTPS detection
