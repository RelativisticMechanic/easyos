# Courtesy of https://wiki.osdev.org/GRUB2#Disk_image_instructions
dd if=/dev/zero of=./easyos.img bs=512 count=131072
fdisk ./easyos.img
sudo losetup /dev/loop0 ./easyos.img
sudo losetup /dev/loop1 ./easyos.img -o 1048576
sudo mke2fs /dev/loop1
sudo mount /dev/loop1 /mnt
sudo grub-install --root-directory=/mnt --no-floppy --modules="normal part_msdos ext2 multiboot biosdisk" /dev/loop0
sync
sudo umount /mnt
sudo losetup -d /dev/loop0
sudo losetup -d /dev/loop1
