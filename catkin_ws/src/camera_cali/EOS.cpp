#include <stdio.h>
#include <stdlib.h>

// q1

// int main(){
//     int sum = -1, cnt = 1,temp = 0;
//     for (int i = 0; i <=500 ; i++ )
//     {
//         cnt = i;
//         temp = 1;
//         for (int j = 0; j<=i-1 ; j++)
//             temp = temp * i;   
//         printf("%d\n",temp);    
//         sum = sum + temp;

//     }

//     printf("total ans = ");
//     printf("%d",sum);
//     printf("\n");
   
//     return 0;
// }




//q2

// int main()
// {
//     int dicesum = 15;
//     for (int i = 1; i<=6 ; i++)
//     {
//         for (int j = i;j <=6 ;j++)
//         {
//             for (int k = j;k<=6; k++)
//             {
//                 for(int m = k;m<=6;m++)
//                 {
//                     for(int n = m;n<=6;n++)
//                     {
//                         int temp = 0;
//                         temp = i+j+k+m+n;

//                         if(temp == dicesum)
//                             printf("{ %d %d %d %d %d } \n",i,j,k,m,n);
//                     }
//                 }
//             }
//         }
//     }

//     return 0;
// }




//q3

// #include <stdio.h>
// #include <stdlib.h>

// unsigned long long diceCount(int n, int sum, int face){ //n: number of dice, sum: sum of n dices
// 	unsigned long long count;
// 	count = 0;
// 	if (n > 2){
// 		int i, part1, part2, upperBound, lowerBound;
// 		part1 = (int)(n/2);
// 		part2 = n - part1;
// 		if((lowerBound = sum - part2*face) < part1*1)
// 		    lowerBound = part1*1;

// 		if((upperBound = sum-part2*1) > part1*face)
// 			upperBound = part1*face;
		
// 		for (i=lowerBound; i<upperBound+1; i++){
// 			count += diceCount(part1,i,face) * diceCount(part2,sum-i,face);
// 		}
// 	}
// 	else if (n == 2){
// 		int mid = face + 1;
// 		if (sum > mid){
// 			count = face + mid - sum;
// 		}
// 		else{
// 			count = sum - 1;
// 		}
// 	}
// 	else{
// 		count = 1;
// 	}
// 	return count;
// }

// int main(){
// 	printf("ans: %llu\n", diceCount(20,72,6));
// 	return 0;
// }


//q5

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	
    int cnt2 = 0,cnt3 = 0, cnt5 = 0,max = 20;
    long double sum = 0.00;
    for(int i = 0; i <= max; i++)
    {
        for(int j = 0;j <= max; j++)
        {
            for(int k = 0;k <= max;k++)
            {
                long double temp = 0.00;
                temp = (long double)(1 / (pow(2,i)+1) ) * (long double)(1 / (pow(3,j)+1) ) * (long double)(1 / (pow(5,k)+1) );
                printf("%lf %lf %lf \n",1 / (pow(2,i))  ,1 / (pow(3,j))  ,1 / (pow(5,k)));
                printf("%llf \n", temp);
                // printf("%lf \n",pow(2.0,4.0);
                sum = sum + temp;
            }

        }

    }
    printf(" A/B sum is %llf ",sum);



	return 0;
}



//q5 liao

// #include <stdio.h>
// #include <stdlib.h>
// #include <math.h>

// int main(){
	
// 	int max2 = 0;
// 	int max3 = 0 , max5 = 4 , max = 1;
// 	//int i = 0;
	
// 	max = pow(5,max5);
	
// 	int tmp = max;
// 	while(tmp>2){
// 		tmp = tmp/3;
// 		max3++;
// 	}
	
// 	tmp = max;
// 	while(tmp>1){
// 		tmp = tmp/2;
// 		max2++;
// 	}
	
// 	int n = max*pow(3,max3)*pow(2,max2);
// 	int m = pow(3,max3)*pow(2,max2);
	
// 	int i,tmp2,tmp3,test;
// 	for(i = 1;i<=max5;i++){
// 		tmp = pow(5,i);
// 		tmp3 = 0;
// 		while(1){
// 			tmp2 = 0;
// 			while(1){
// 				if(tmp2 == 0 && tmp3 == 0){
// 					test = 1;
// 				}
// 				else if(tmp2 == 0){
// 					test = pow(3,tmp3);
// 				}
// 				else if(tmp3 == 0){
// 					test = pow(2,tmp2);
// 				}
// 				else{
// 					test = pow(2,tmp2)*pow(3,tmp3);
// 				}
				
// 				if(test>tmp){
// 					break;
// 				}
// 				else{
// 					m+=n/max/test*tmp;
// 					printf("tmp2: %d    tmp3: %d    tmp5: %d\n", tmp2, tmp3, max5-i);
// 					tmp2++;
// 				}
// 			}
// 			test = pow(3,tmp3);
// 			if(test>tmp){
// 				break;
// 			}
// 			tmp3++;
// 		}
// 	}
// 	m-=n;
	
// 	while(n%2 == 0 && m%2 == 0){
// 		n = n/2;
// 		m = m/2;
// 	}
// 	while(n%3 == 0 && m%3 == 0){
// 		n = n/3;
// 		m = m/3;
// 	}
// 	while(n%5 == 0 && m%5 == 0){
// 		n = n/5;
// 		m = m/5;
// 	}
	
	
// 	printf("max: %d\n", max);
// 	printf("max2: %d\n", max2);
// 	printf("max3: %d\n", max3);
// 	printf("max5: %d\n", max5);
// 	printf("n: %d\n", n);
// 	printf("m: %d\n", m);
// 	printf("m+n: %d\n", m+n);
// 	printf("m/n: %f\n", m/(1.*n));
	
	
// 	return 0;
// }