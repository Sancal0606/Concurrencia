import tarfile 
with tarfile.open('Ejercicios4.tgz', 'w') as tar:
    tar.add('Ejercicios4/')