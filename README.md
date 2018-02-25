EasyOS - A quick way to get a BareBones kernel up and running
---

These are a few scripts I've written to make my own work a bit easier when it comes to operating system development.

They are obviously very much Linux specific and a lot of people will scream in horror when seeing shell scripts
being used as a part of the build system. I agree whole heartedly, however, this does serve its own purpose.

These scripts make it easier to setup an ext2 hard disk image with GRUB installed on it. Your kernel (`easyoskrnl`)
is then copied over to the disk.

How to use?
---

First, I assume you have a cross compiler set up in `$HOME/opt/cross`.If not, then please see: [GCC Cross Compiler](http://wiki.osdev.org/GCC_Cross_Compiler)
You can choose not to have it there as well, simply change the PATH assigment in `compile_kernel.sh`.

Now, I assume you (the reader) is on a traditional distribution of Linux that provides tools such as:
* grub-install
* mke2fs
* qemu-system-i386
* mount

The build scripts use `sudo` as a way to execute programs with superuser access (since this is required
to write to disk images as they are mounted). It also uses `/mnt` as a temporary mountpoint for copying
data to the disk image and `/dev/loop0` and `/dev/loop1` as loopback devices while modifying the filesystem. <br>

The steps are outlined as follows:

* Execute `create_disk.sh`. This will create a ext2 raw image called `easyos.img`.
* Once done, you may modify `compile_kernel.sh`, and execute it. This will create an `easyoskrnl` in the `./boot/` directory.
* Now, run `execute.sh` and _et voila_! You have a working kernel running under qemu.

Critcism
---

This project should only be used as a placeholder for someone starting kernel development. For a long time
I struggled with setting up a proper kernel because I just couldn't get things to work. Besides, the standard
tutorial takes a shortcut through `grub-mkrescue`, which creates an ISO-9660 filesystem on CD-ROM. I'd expect
most people writing a kernel would want hard drive access, and this is also one of the reason I ended up doing
this.

Licensing
---
All code is under Public Domain.

-- Gautam, S.

