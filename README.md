# Suricata-rule

## Overview
> Create a snort(suricata) rule file to detect specific site traffic.

### Description

1. Create a rule to detect 20 sites in the `test.rules` file.
2. Afterwards, check `fast.log` to see if 20 sites are properly detected.
3. If possible, try to implement detection of not only sites where plain text communication (HTTP) is performed, but also sites that perform TLS communication (HTTPS).

## Run

### Command

```
sudo ./test.sh
```

### Screenshot

## Only http
![image](https://user-images.githubusercontent.com/45416961/104321728-5995b100-5527-11eb-836a-cd982d51d12d.png)

## http & https
![image](https://user-images.githubusercontent.com/45416961/104443386-b356b380-55d9-11eb-8b5a-1ccc63c5c331.png)

## ToDo
> ~~HTTPS detection~~

I kept thinking about why it couldn't be detected, but it was because of the Host. I removed it from the rules and it worked fine! I should have looked at the packet a little more closely.
