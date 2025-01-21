using namespace std;
#include <math.h>
#include <iostream>

double factorial(double n)
{
    double resultado = 1;

    for (int i = 2; i <= n; i++)
    {
        resultado = resultado * i;
    }

    return resultado;
}

void taylor (int _n)
{
    double x, elem, sum;
    int n, i, j;
    x = _n;
    n = _n;
  
    for(i=0, sum=0; i<=n; i++) {
        for(j=1, elem=1; j<=2*i; j++) {
            elem = elem * x/j;
        }
        if (i%2==0) {
            sum = sum + elem;
        } else {
            sum = sum - elem;
        }
    }
    cout<<sum<<endl;
}

int main(){
    for (int i = 20; i < 30; i++)
    {
        cout<<i<< ": ";
        taylor(i);
    }
    
}