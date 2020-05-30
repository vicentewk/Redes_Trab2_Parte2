
#!/bin/bash
sudo useradd -m -g users -p asdf vicente  # cria o usuario paulo com senha (criptografada) asdf
sudo usermod -p $(openssl passwd -1 vicente) vicente # altera a senha usuario paulo para senha paulo em texto plano 

sudo useradd -m -g users -p asdf kassuelo  # cria o usuario paulo com senha (criptografada) asdf
sudo usermod -p $(openssl passwd -1 kassuelo) kassuelo # altera a senha usuario paulo para senha paulo em texto plano 

sudo useradd -m -g users -p asdf ranieri  # cria o usuario paulo com senha (criptografada) asdf
sudo usermod -p $(openssl passwd -1 ranieri) ranieri # altera a senha usuario paulo para senha paulo em texto plano 