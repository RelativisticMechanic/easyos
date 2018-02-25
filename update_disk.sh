sudo losetup /dev/loop1 ./easyos.img -o 1048576
sudo mount /dev/loop1 /mnt
sudo cp ./boot/grub/grub.cfg /mnt/boot/grub/grub.cfg
sudo cp ./boot/easyoskrnl /mnt/boot/easyoskrnl
sync
sudo losetup -d /dev/loop1
sudo umount /mnt
