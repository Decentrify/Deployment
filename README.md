##CaracalDB
main deployment folder: caracal
remember to change *config* and *hosts.conf* files accordingly 

run 
```sh
./caracal.sh deploy
./caracal.sh boot
./caracal.sh shutdown
```

##GVoD
main deployment folder: gvod
remember to change the *config* and *gvod/loggers* files accordingly
remember to copy the jar into *gvod/lib* folder

run
```sh
./deploy/deploy_skeleton.sh .
./deploy/deploy_jar.sh .
./remote/start_all.sh .
./remote/kill_all.sh .
./remote/clean_all.sh .
```



##Sweep
main deployment folder: sweep
remember to change the *config* and *sweep/loggers* files accordingly
remember to copy the jar into *sweep/lib* folder

run
```sh
./deploy/deploy_skeleton.sh .
./deploy/deploy_jar.sh .
./remote/start_all.sh .
./remote/kill_all.sh .
./remote/clean_all.sh .
```
