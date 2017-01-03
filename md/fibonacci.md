
## 前言/废话
斐波那契数列，又称黄金分割数列，指的是这样一个数列：0、1、1、2、3、5、8、13、21、……

在数学上，斐波纳契数列以如下被以递归的方法定义：F0=0，F1=1，Fn=F(n-1)+F(n-2)（n>=2，n∈N*）

在现代物理、准晶体结构、化学等领域，斐波纳契数列都有直接的应用，

为此，美国数学会从1963起出版了以《斐波纳契数列季刊》为名的一份数学杂志，用于专门刊载这方面的研究成果。

斐波那契数列指的是这样一个数列 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...

特别指出：0是第0项，不是第1项。

这个数列从第二项开始，每一项都等于前两项之和。

斐波那契数列的发明者，是意大利数学家列昂纳多·斐波那契（Leonardo Fibonacci）。



## 递归
	
	private static int fibonacci1(int n) {
		if (0 == n)
			return 0;
		if (1 == n)
			return 1;
		return fibonacci1(n - 1) + fibonacci1(n - 2);
	}

## 非递归
	
	private static int fibonacci2(int n) {
		if (0 == n)	return 0;
		if (1 == n) return 1;

		if (2 < n) {
			int[] arr = new int[n + 1];
			arr[0] = 0;
			arr[1] = 1;
			for (int i = 2; i < arr.length; i++) {
				arr[i] = arr[i - 1] + arr[i - 2];
			}
			return arr[n];
		}
		return n;
	}
	
## 非递归2	

	private static long fibonacci(long n){
		if(0 >= n) return n;
		if(1 == n || 2 == n) return 1;
		
		long prev = 1;
		long next = 1;
		long result = 0;
		while(n > 2){
			result = prev + next;
			prev   = next;
			next   = result;
			n--;
		}
		return result;
	}