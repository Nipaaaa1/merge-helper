# merge-helper

Script bash sederhana buat mempermudah merge branch dan hapus branch setelah merge.
Bisa juga otomatis push ke remote setelah merge!

Fitur

- Merge branch ke current branch

- Hapus branch lokal dan remote setelah merge

- Pilihan buat push ke remote setelah merge

- Flag `--push` buat auto-push tanpa nanya


## Cara Instalasi

1. Download script-nya:

```
curl -o ~/merge.sh https://raw.githubusercontent.com/Nipaaaa1/merge-helper/main/merge.sh
```

2. Edit file ~/.bashrc atau ~/.zshrc dan tambahkan baris ini:

```
source ~/merge.sh
```

3. Reload terminal kamu:

```
source ~/.bashrc
# atau
source ~/.zshrc
```

Sekarang kamu udah bisa pake command merge di terminal!

## Cara Pakai

Merge branch fix-bug ke branch yang lagi aktif:

```
merge fix-bug
```

Setelah merge selesai, script bakal nanya:

```
Mau push 'main' ke remote? (y/n)
```

Kalau mau langsung auto-push tanpa nanya:

```
merge fix-bug --push
```

## Lisensi

MIT License
