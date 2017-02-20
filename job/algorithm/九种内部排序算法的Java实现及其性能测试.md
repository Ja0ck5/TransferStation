## 九种内部排序算法的Java实现及其性能测试

### 9种内部排序算法性能比较

第九种为java.util.Arrays.sort（改进的快速排序方法）

结论：归并排序和堆排序维持O(nlgn)的复杂度，速率差不多，表现优异。固定基准的快排表现很是优秀。而通过使用一个循环完成按增量分组后的直接插入的希尔排序，测试效果显著。
冒泡，选择，直接插入都很慢，而冒泡效率是最低。


### 1.选择排序[不稳定]

原理：不断地选择剩余元素中的最小者

复杂度：O(n^2) - O(n^2) - O(n^2) - O(1)[平均 - 最好 - 最坏 - 空间复杂度]

缺点：
    
> 一个已经有序的数组或者是元素全部相等的数组，和一个元素随机排列的数组所用的时间一样长

```java
public class SelectSortSolution {
	public static void selectSort(int[] a) {
			if (null == a || a.length < 2)
				return;
			//将 a[i] 与 a[i+1...N] 中最小的元素交换
			for (int i = 0; i < a.length; i++) {
				int min = i;//最小元素索引
				for (int j = i + 1; j < a.length; j++) {
					if (a[j] < a[min])
						min = j;
				}
				//交换
				if (min!=i) {
					a[i]   ^= a[min];
					a[min] ^= a[i];
					a[i]   ^= a[min];
				}
			}
		}
	
	public static void main(String[] args) {
		int[] array = {2,5,4,3,1,7,9,8,6};
		selectSort(array);
		printArray(array);
	}

	private static void printArray(int[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.print(" "+array[i]);
		}
	}
}
```

### 2.插入排序[稳定]

适用于小数组,数组已排好序或接近于排好序速度将会非常快

所需的时间取决于输入中元素的初始顺序

复杂度：O(n^2) - O(n) - O(n^2) - O(1)[平均 - 最好 - 最坏 - 空间复杂度]

```java
package com.lyj.algorithms.eightSorts;

public class InsertSortSolution {
	
	public static void insertionSort(int[] a) {
		if (null == a || a.length < 2)
			return;
		int j;
		//循环从第二个数组元素开始，因为arr[0]作为最初已排序部分
		for (int i = 1; i < a.length; i++) {
			int temp = a[i];// 暂存当前值
			for (j = i - 1;j >= 0 && temp < a[j];j--)//将temp与已排序元素从大到小比较，寻找temp应插入的位置
				a[j + 1] = a[j];//比temp大则后移
			a[j + 1] = temp;// 当前值归位
		}
	}

	
	public static void main(String[] args) {
		int[] array = {2,5,4,3,1,7,9,8,6};
		insertionSort(array);
		printArray(array);
	}

	private static void printArray(int[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.print(" "+array[i]);
		}
	}
}
```

### 3.希尔排序(缩小增量排序)[不稳定]

> 基于插入排序的快速排序算法。

> 思想：使数组中任意间隔为 h 的元素都是有序的。这样的数组被称为 h 有序数组。
> 
> 一个 h 有序数组就是 h 个互相独立的有序数组编织在一起组成的数组。
> 
> 在进行排序的时候，如果 h 很大，我们就能将元素移动到很远的地方，为实现更小的 h 有序创造方便。
> 用这种方式，对于任意以 1 结尾的 h 序列，我们都能够将数组排序。这就是希尔排序。 

**希尔排序高效原因是它权衡了子数组的规模和有序性。**

希尔排序比插入排序快，而且随着数组的规模越大，优势越大。

复杂度 平均 O(n^1.3) 最好O(n) 最差O(n^s)[1<s<2] 空间O(1)

内循环通过模拟并行的方式完成分组的内部直接插入排序，而不是一个一个分组分组的排，在10w的随机数据20w的随机数据均表现优异。

```java
package com.lyj.algorithms.eightSorts;

public class ShellSortSolution {
	public static void shellSort(int[] a) {
		if (null == a || a.length < 2)
			return;
		int h=1,j;
		//定义间隔
		while(h<a.length/3) h = 3*h+1;//1,4,13,40...
		while(h>=1) {
			// 从1B开始先和1A比较 然后2A与2B...然后再1C向前与同组的比较
			//插入排序,将数组变成 h 有序
			for (int i = h; i < a.length; i++) {
				// 内部直接插入
				int temp = a[i];
				for(j = i-h;j >=0 && temp < a[j];j -= h) 
					a[j+h] = a[j];
				a[j+h] = temp;
			}
			h/=3;
		}
	}
	
	public static void main(String[] args) {
		int[] array = {2,5,4,3,1,7,9,8,6};
		shellSort(array);
		printArray(array);
	}

	private static void printArray(int[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.print(" "+array[i]);
		}
	}
}
```
### 4.归并排序[稳定]

> 原理：采用分治法
> 要将一个数组进行排序，可以先将它分为两半分别排序，然后将结果归并起来


复杂度：O(nlogn) - O(nlgn) - O(nlgn) - O(n)[平均 - 最好 - 最坏 - 空间复杂度]

```java
package com.lyj.algorithms.eightSorts;

import java.util.Arrays;

public class MergeSortSolution {
	
	public static void mergeSort(int[] a, int lo, int hi) {
		if (hi <= lo) return;
		int mid = (lo + hi) / 2;
		mergeSort(a, lo, mid);// 左边排序
		mergeSort(a, mid + 1, hi);// 右边排序
		merge(a, lo, mid, hi);// 归并结果
	}
	
	//将 a[lo..mid] 与 a[mid+1..hi] 合并 
	private static void merge(int a[], int lo, int mid, int hi) {
		// 归并所需的辅助数组
		int[] aux = new int[hi - lo + 1];
		// 辅助数组索引
		int k = 0;
		int i = lo;// 左指针
		int j = mid + 1;// 右指针
		// 把较小的数先移到新数组中(每個子數組也反復執行)
		while (i <= mid && j <= hi) {
			if (a[i] < a[j])
				aux[k++] = a[i++];
			else
				aux[k++] = a[j++];
		}
		// 把左边剩余的数移入数组  
		while (i <= mid) 
			aux[k++] = a[i++];

		// 把右边剩余的数移入数组  
		while (j <= hi)
			aux[k++] = a[j++];
		
		// 注意这里是lo + t  (即不同的子數組的起始位置----左指针)  把新数组中的数覆盖  原数组
		for (int t = 0; t < aux.length; t++)
			a[lo + t] = aux[t];
	}
	
	 public static void main(String[] args) {
	        int a[] = { 2, 6, 1, 4, 3, 9, 5, 8, 7 };
	        mergeSort(a, 0, a.length - 1);
	        System.out.println("排序结果：" + Arrays.toString(a));
	    }
}

```


### 5.快速排序[不稳定]

原理：分治+递归

切分的位置取决于数组的内容 找到不大于不小于的中数

分别将左右两部分排序，排好序之后，整个数组就是有序的。

复杂度：O(nlgn) - O(nlgn) - O(n^2) - O(1)[平均 - 最好 - 最坏 - 空间复杂度]

栈空间0(lgn) - O(n)

```java
package com.lyj.algorithms.eightSorts;

public class QuickSortSolution {

	public void quickSort(int[] a, int lo, int hi) {
		if (null == a || a.length < 2)
			return;
		if (hi < lo) return;
			//切分后得到基准点
			int mid = partition(a, lo, hi);//快排的切分
			quickSort(a, lo, mid-1);//左半部分排序
			quickSort(a, mid+1, hi);//右半部分排序
	}
	
	//快速排序的切分 切分的位置取决于数组的内容 找到不大于不小于的中数
	private int partition(int[] a, int lo, int hi) {
		//选择基准点
		int pivot = a[lo];

		while (lo < hi) {
			// a[hi] 与基准点比较，如果大于，则 hi 指针往左移动。注意等于，否则死循环
			while (lo < hi && a[hi] >= pivot)
				hi--;
			// a[hi] 小于基准点则  hi与lo交换位置
			a[lo] = a[hi];
			
			//a[lo] 与基准点比较，如果小于等于 则 lo 指针往右移动。 注意等于，否则死循环
			while (lo < hi && a[lo] <= pivot)
				lo++;
			
			// a[lo] 大于基准点则  hi与lo交换位置
			a[hi] = a[lo];
			//最终 a[hi] 要大于基准点，a[lo]要小于基准点
		}
		a[lo] = pivot;//基准点的值赋值给最后的 lo 。排序完毕
		return lo;//返回基准点索引
	}
}
```


### 6.堆排序[不稳定]

堆一般指二叉堆。

堆是一种重要的数据结构，为一棵完全二叉树, 底层如果用数组存储数据的话，假设某个元素为序号为i(Java数组从0开始,i为0到n-1),**如果它有左子树，那么左子树的位置是2i+1，如果有右子树，右子树的位置是2i+2，如果有父节点，父节点的位置是(n-1)/2取整。**

分为最大堆和最小堆，最大堆的任意子树根节点不小于任意子结点，最小堆的根节点不大于任意子结点


复杂度：O(nlogn) - O(nlgn) - O(nlgn) - O(1)[平均 - 最好 - 最坏 - 空间复杂度]

大顶堆实现从小到大的升序排列，小顶堆一般用于构造优先队列

```java
package com.lyj.algorithms.eightSorts;

/**
 * 如果它有左子树，那么
 * 左子树的位置是2i+1，
 * 
 * 如果有右子树，
 * 右子树的位置是2i+2，
 * 
 * 如果有父节点，
 * 父节点的位置是(n-1)/2取整
 * 
 * @author Ja0ck5
 *
 */
public class HeapSortSolution {
	public void heapSort(int[] a) {
		if (null == a || a.length < 2)
			return;
		// 建堆
		buildMaxHeap(a);
	
		for (int i = a.length - 1; i >= 0; i--) {
//			将每个当前最大的值放到堆末尾
			int temp = a[0];// 将堆顶元素和堆低元素交换，即得到当前最大元素正确的排序位置
			a[0] = a[i];
			a[i] = temp;
			// 调整堆
			adjustHeap(a, i, 0);
		}
	}

	// 构建大顶堆：将array看成完全二叉树的顺序存储结构
	private void buildMaxHeap(int[] a) {
		//父节点的位置是(n-1)/2取整
		// 从最后一个节点array.length-1的父节点（array.length-1-1）/2开始，直到根节点0，反复调整堆
		for (int i = (a.length / 2)-1; i >= 0; i--)
			adjustHeap(a, a.length, i);
	}

	// 递归调整堆
	private void adjustHeap(int[] a, int size, int parent) {
		//左子树的位置是2i+1
		int left = 2 * parent + 1;
		//右子树的位置是2i+2
		int right = 2 * parent + 2;
		
		int largest = parent;
		if (left < size && a[left] > a[parent])
			largest = left;

		if (right < size && a[right] > a[largest])
			largest = right;

		if (parent != largest) {
			int temp = a[parent];
			a[parent] = a[largest];
			a[largest] = temp;
			adjustHeap(a, size, largest);
		}
	}
}
```

### 7.冒泡排序[稳定]

复杂度：O(n^2) - O(n) - O(n^2) - O(1)[平均 - 最好 - 最坏 - 空间复杂度]

```java
package com.lyj.algorithms.eightSorts;

import java.util.Arrays;

public class BubbleSortSolution {
	
	public static void bubbleSort(int[] a){
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a.length-1-i; j++) {
				if(a[j] > a[j+1]){
					a[j] ^= a[j+1];
					a[j+1] ^= a[j];
					a[j] ^= a[j+1];
				}
			}
		}
	}
	
	public static void main(String[] args) {
		int[] array = {2,5,4,3,1,7,9,8,6};
		bubbleSort(array);
		System.out.println(Arrays.toString(array));
	}
}
```



### 8.基数排序[稳定]

原理：分配加收集

复杂度： O(d(n+r)) r为基数d为位数 空间复杂度O(n+r)

```java
// 基数排序
	public void radixSort(int[] a, int begin, int end, int digit) {
		// 基数
		final int radix = 10;
		// 桶中的数据统计
		int[] count = new int[radix];
		int[] bucket = new int[end-begin+1];
		
		// 按照从低位到高位的顺序执行排序过程
		for (int i = 1; i <= digit; i++) {
			// 清空桶中的数据统计
			for (int j = 0; j < radix; j++) {
				count[j] = 0;
			}
			
			// 统计各个桶将要装入的数据个数
			for (int j = begin; j <= end; j++) {
				int index = getDigit(a[j], i);
				count[index]++;
			}
			
			// count[i]表示第i个桶的右边界索引
			for (int j = 1; j < radix; j++) {
				count[j] = count[j] + count[j - 1]; 
			}
			
			// 将数据依次装入桶中
            // 这里要从右向左扫描，保证排序稳定性 
			for (int j = end; j >= begin; j--) {
				int index = getDigit(a[j], i);
				bucket[count[index] - 1] = a[j];
				count[index]--;
			}
			
			// 取出，此时已是对应当前位数有序的表
			for (int j = 0; j < bucket.length; j++) {
				a[j] = bucket[j];
			}
		}
	}
	
	// 获取x的第d位的数字，其中最低位d=1
	private int getDigit(int x, int d) {
		String div = "1";
		while (d >= 2) {
			div += "0";
			d--;
		}
		return x/Integer.parseInt(div) % 10;
	}
}
```

