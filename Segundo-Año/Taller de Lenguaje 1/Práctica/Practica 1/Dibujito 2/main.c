#include <stdio.h>
int main()
{  int i;int j;int k;int z;int u;
    j=1;
   for(i=4;i>=0;i--,j=j+2){
    for(z=i;z>=1;z--){
        printf(" ");
    }
    for (k=j;k>=1;k--){
        printf("");
    }
    printf("\n");
   }
   j=7;
   for(i=1;i<=4;i++,j=j-2){
    for(z=i;z>=1;z--){
        printf(" ");
    }
    for (k=j;k>=1;k--){
        printf("");
    }
    printf("\n");
   }

   return 0;
}
