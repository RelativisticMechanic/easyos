export PATH="$HOME/opt/cross/bin:$PATH"
export CC=i686-elf-gcc
export AS=i686-elf-as
export DEL=rm
export CFLAGS="-std=gnu99 -ffreestanding -O2 -Wall -Wextra"
export LDFILES="x86_init.o x86_init_c.o"
cd kernel
$AS x86_init.s -o x86_init.o
$CC -c x86_init.c -o x86_init_c.o $CFLAGS
$CC -T ./x86_link.ld -o easyoskrnl -ffreestanding -nostdlib $LDFILES -lgcc
$DEL *.o
mv ./easyoskrnl ../boot/
