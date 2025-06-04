<p align="center">
  <a href="#build-framework">
  <img src="https://raw.githubusercontent.com/armbian/configng/main/share/icons/hicolor/scalable/configng-tux.svg" width="128" alt="Armbian Config NG Logo" />
  </a><br>
  <strong>Armbian Config: The Next Generation</strong><br>
<br>


## What is armbian-config?

`armbian-config` is an interactive configuration utility for Armbian-based systems, designed to help users configure their device **after it has been installed and booted**. It provides a menu-driven interface for managing system settings, software, hardware, and services **within the running system ("image-space")**.


## about

This tool is optimized for use with [**Armbian Linux**](https://www.armbian.com), but in theory, it should also work on any systemd-based, APT-compatible Linux distribution — including Linux Mint, Elementary OS, Kali Linux, MX Linux, Parrot OS, Proxmox, Raspberry Pi OS, and others.


## Contributing

<a href="https://github.com/armbian/configng/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=configng/config-v3" />
</a>
<br>
<br>
 
Thank you to everyone who has contributed to **Armbian-config** — your efforts are deeply appreciated!

#### General

- `armbian-config` operates **only in image-space**. It is **not** used during the image build process and does **not** affect image creation or customization at build time.
- If you wish to change the default contents, packages, or configurations included in an Armbian image before it is built, those changes must be made in the [Armbian build scripts](https://github.com/armbian/build), **not** in `armbian-config`.
- Feature requests or bug reports for `armbian-config` should be limited to things that can be changed or applied **within image-space** (i.e., on a running system), not during image creation or build time.

#### Adding or configuring functionality

> 📌 Tip: Keep your changes modular and easy to maintain — this helps us review and merge your contribution faster.

#### 💖 Donating

Not a developer? You can still make a big impact! Your donations help us maintain infrastructure, test hardware, and improve development workflows.

[Support the project here](https://github.com/sponsors/armbian)

## License

(c) [Contributors](https://github.com/armbian/configng/graphs/contributors)

All code is licensed under the GPL, v2 or later. See [LICENSE](LICENSE) file for details.
