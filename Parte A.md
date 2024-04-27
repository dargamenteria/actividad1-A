---
title: Parte A
updated: 2024-04-27 01:15:52Z
created: 2024-04-25 15:25:47Z
latitude: 41.38506390
longitude: 2.17340350
altitude: 0.0000
---

# Clonado del proyecto con Github

Se puede realizar de 2 formas una directamente es desde la propia interfaz de github. Este nos permite clonar un repositorio. Como se muestra en las siguientes imágenes.

![c05e5142b82599250a9de7f208d183c0.png](_resources/c05e5142b82599250a9de7f208d183c0.png)  
![97396fad71ba47fe81b6ba4e128c364c.png](_resources/97396fad71ba47fe81b6ba4e128c364c.png)

También se puede realizar via shell

1.  Se clona el repositorio objetivo

```bash
$ git clone https://github.com/anieto-unir/helloworld.git
Cloning into 'helloworld'...
remote: Enumerating objects: 365, done.
remote: Counting objects: 100% (155/155), done.
remote: Compressing objects: 100% (57/57), done.
remote: Total 365 (delta 134), reused 98 (delta 98), pack-reused 210
Receiving objects: 100% (365/365), 82.10 KiB | 1.19 MiB/s, done.
Resolving deltas: 100% (163/163), done
```

2.  Se listan los remote

```bash
$ git remote -v
origin	https://github.com/anieto-unir/helloworld.git (fetch)
origin	https://github.com/anieto-unir/helloworld.git (push)
```

3.  Los eliminamos y añadimos los del repositorio objetivo

```
$ git remote  remove origin
$ git remote -v

```

4.  Para que no ande preguntando por las credenciales usamos pass para almacenarlas

```bash
File: /home/dani/.gitconfig
[user]
    name = dargamenteria
    email = dargamenteria@paranoidworld.es
[credential "https://github.com/dargamenteria/"]
  username=dargamenteria@paranoidworld.es
  useHttpPath = true
  helper = pass -p "github/{path}" --template "~/.config/git-credential-pass/github.dargamenteria.template"
```

5.  Añadimos el nuevo origen el token lo sacamos directamente de pass

```bash
$ git remote add origin  https://github.com/dargamenteria/actividad1-A.git
$ git remote -v
origin	https://github.com/dargamenteria/actividad1-A.git (fetch)
origin	https://github.com/dargamenteria/actividad1-A.git (push)

$ pass
Password Store
├── admin
│   └── keepass.gpg
├── github
│   ├── dargamenteria
│   │   └── actividad1-A.git.gpg
│   └── token.gpg

```

7.  Subimos los cambios

```bash
$ git push origin master
Everything up-to-date
```

En este punto tenemos el repositorio conectado y las credenciales securizadas en un repositorio, local, de claves.