# Modul_346

## Vorbereitung zur Ausführung
1. Gehe auf die Amazon Konsole und starte die Amazon CLI (cloudshell)
2. Gebe dann folgenden Befehl ein, damit das Git Repo auf AWS heruntergeladen wird:
```
git clone https://github.com/cora01stella/Modul_346.git
```
3. Wechsle in das Git Verzeichnis:
```
cd Modul_346
```
4. Gib der Datei "replace-ips.sh" die benötigte Berechtigung, damit diese ausgeführt werden kann:
```
chmod +x replace-ips.sh
```
5. Installiere ansible auf Amazon AWS:
```
sudo yum install ansible
```
6. Überprüfe ob die collections "amazon.aws" und "community.aws" installiert sind:
```
ansible-galaxy collection list
```
Standardmässig sollten diese beiden Collections installiert sein. Sollten sie nicht in der Collection erscheinen, führe folgenden Befehl aus:
```
ansible-galaxy collection install community.aws
```
```
ansible-galaxy collection install amazon.aws
```

## Access Key generieren (zwingend erforderlich)
Für die Erstellung von einem S3Bucket muss, aus Sicherheitsgründen, ein Access Key generiert werden.
Im Git Repo befindet sich eine Vorlage für die creds_root.yml Datei, welche verwendet werden kann.
Hier ist eine Anleitung, wie der Access Key generiert wird:

1. Anmelden auf Amazon AWS Konsole
2. Gehe auf Sicherheitsanmeldeinformationen
![image](https://github.com/cora01stella/Modul_346/assets/170628330/6256bece-8677-4019-bd92-3493d6f17c5a)

3. Scrolle zu Zugriffsschlüssel
\
5. Gehe auf Zugriffschlüssel erstellen
![image](https://github.com/cora01stella/Modul_346/assets/170628330/7bc14597-c1f9-457d-b587-4ba819ede528)

6. Haken setzen und auf Zugriffschlüssel erstellen drücken
![image](https://github.com/cora01stella/Modul_346/assets/170628330/9fa4b736-078e-4d32-962a-08270e1dee5f)

7. Zugriffschlüssel und geheimer Zugriffschlüssel in die "creds_root.yml" Datei kopieren
\
![image](https://github.com/cora01stella/Modul_346/assets/170628330/1ed347cb-740f-4e8c-9a4d-5bdaa1fb0fb7)
![image](https://github.com/cora01stella/Modul_346/assets/170628330/07681ef0-5e37-495c-92ca-4d01c57b6804)

## Ausführen Ansible Playbook
Wenn die Vorbereitung abgechlossen ist und der Access Key generiert wurde, kann das ansible Playbook ausgeführt werden:
```
ansible-playbook playbook.yml
```


