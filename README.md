# Portable Onion Router

**Something Awesome Project**  
COMP6841 Extended Cyber Security Engineering  
University of New South Wales, 20T1

## Overview

The goal of this project was to build an inexpensive, ultra-portable router that transparently forces all traffic over the Tor network. This router is ideal when anonymity over the internet is a priority and you want to avoid making critical mistakes.

The hardware used is a TP-Link TL-WR902AC Wireless Travel Router paired with a Hauwei E3372 LTE USB modem, both of which are widely available and inexpensive of as April 2020. The OpenWRT build for this project is configured to perform well on the router's limited memory profile (8MB flash/64MB RAM). The router has two wireless radios, so it's possible to configure the second as the WAN interface if using the USB modem isn't an option.

This project was inspired by [grugq/portal](https://github.com/grugq/portal).

## Supported Hardware

* TP-LINK TL-WR902AC v1
* Hauwei E3372 LTE USB Modem

## Installation

* If the router doesn't already have OpenWRT installed:
  * flash a stock firmware image from the [TL-WR902ACv1 OpenWRT Wiki](https://openwrt.org/toh/tp-link/tl-wr902ac_v1)
* Flash the `openwrt-18.06.8-ar71xx-generic-tl-wr902ac-v1-squashfs-sysupgrade.bin` image from this repo
* `ssh` to the router
  * Set the root password (_default: None_)
  * Set the wifi password (_default:_ `supersecret`)
  * Restart the router

## Building

If you want to build the firmware image yourself:

* Read the OpenWRT [Using the Image Builder](https://openwrt.org/docs/guide-user/additional-software/imagebuilder) guide
* Download/extract the [Image Builder](https://downloads.openwrt.org/releases/18.06.8/targets/ar71xx/generic/) archive from the `v18.06.8`  release
* Copy `files/` from this repo into the extracted image builder directory
* Run the build

```shell
make image PROFILE=tl-wr902ac-v1
           PACKAGES="kmod-usb-net-cdc-ether usb-modeswitch tor zram-swap -ppp -ppp-mod-pppoe -opkg"
           FILES=files/
```

* Continue with _Installation_ instructions above using the generated image
