# Assembly

## Linux (Ubuntu 22.04)

#### Installing NASM

v. 2.15.05 (19-07-2022)

```sh
sudo apt -y install nasm
```

#### Building a Executable File (64-bits)

```
nasm -felf64 hello.asm -o hello.o
ld -o hello hello.o
chmod u+x hello
```

