import tarfile 
with tarfile.open('Ejercicios3.tgz', 'w') as tar:
    tar.add('Ejercicios3/')