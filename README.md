# aws-hashcat

This is a quickstart process to install all the necessary GPU drivers and options for `hashcat` on Ubuntu 26.04 AWS instances.

Any Nvidia GPU instance should work, but getting quota can be a nightmare on AWS. g5 instances come with A10G Tensor Core GPUs, which are plenty fast and currently offer the best hashrate per dollar.

- g5.xlarge   - 1 GPU  - $1.006 per hour (us-east-1)
- g5.12xlarge - 4 GPUs - $5.672 per hour (us-east-1)

These types of instances are meant to be spun up when you need some decent GPU power for cracking hashes. You should terminate them as soon as you are done in order to avoid large fees.

The OS and full set of installed packages takes around 20GB. After install around 3GB will be freed with `apt clean all`. It's recommended to use a root disk of at least 25GB on your instances.


## Installation

```
git clone https://github.com/phx/aws-hashcat
cd aws-hashcat
./install.sh
```

## Installation flow

Your instance will reboot 3 times:

- 1: After installing all package updates.
- 2: After installing hashcat, nvidia drivers and applying kernel module configuration.
- 3: After installing cuda.

After the 3rd reboot, `install.sh` will also download wordlists and rules to `/opt/wordlists/`.

## Included wordlists & rules

After installation, the following assets are available in `/opt/wordlists/`:

| File | Description | Size |
|---|---|---|
| `ultimate-wpa2-clean.txt` | The ultimate wordlist from https://github.com/kennyn510/wpa2-wordlists.git (~7.2M unique passwords). | ~78 MB |
| `OneRuleToRuleThemAll.rule` | A high-performing hashcat ruleset that generates common password mutations on the fly. | ~2 KB |

### Using the wordlists

Basic hashcat wordlist attack (`-a 0`):

```bash
hashcat -m 1000 -a 0 hashes.txt /opt/wordlists/ultimate-wpa2-clean.txt
```

With the ruleset applied to generate mutations:

```bash
hashcat -m 1000 -a 0 hashes.txt /opt/wordlists/ultimate-wpa2-clean.txt -r /opt/wordlists/OneRuleToRuleThemAll.rule
```

### Why rulesets?

Rulesets like **OneRuleToRuleThemAll** apply hundreds of common transformations such as case changes, leet-speak substitutions, appending numbers/symbols, and so on to each word in the list. This generates millions of additional candidates at almost no disk cost.

### Please note:

You can always add your own wordlists by copying them to `/opt/wordlists/`. The included RockYou + OneRuleToRuleThemAll combination covers the vast majority of common passwords, but targeted lists (e.g., company-specific terms) can improve results for specific engagements.

