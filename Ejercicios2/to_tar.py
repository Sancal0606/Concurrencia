import tarfile 
with tarfile.open('Ejercicios2.tgz', 'w') as tar:
    tar.add('Ejercicios2/')