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

After the 3rd reboot, you will be ready to run `hashcat`, which will already be installed with all necessary GPU drivers.


### Please note:

This repo does not come with any pre-installed wordlists or rules.

I may add a script to download some rules and wordlists, as well as a helper script at some point in the future,
but for now this remains BYOA (Bring Your Own Assets).

Right now, this repo is simply used to help make the best use of your time while setting up a hashcat-ready AWS instance so you can get to cracking ASAP. 

