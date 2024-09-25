import tarfile 
with tarfile.open('Ejercicios1.tar', 'w') as tar:
    tar.add('Ejercicios1/')