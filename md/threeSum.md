
学习一些算法，思路的总结。

Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
Note:
Elements in a triplet (a,b,c) must be in non-descending order. (ie, a \leq b \leq ca≤b≤c)
The solution set must not contain duplicate triplets.
For example, given array S = {-1 0 1 2 -1 -4}.+

A solution set is:

    (-1, 0, 1)
    (-1, -1, 2)


给定一个包含 n 个 integer 类型数组 S，在 数组 S 中是否有元素 a,b,c 能够符合 a+b+c = 0;

在这个数组中找出所有唯一的 三个和为0 的一组元素。

注：
	元素（a,b,c）必须非降序排序。（a<=b<=c）

结果不能包含重复的一组元素

例如 给定数组  S = {-1 0 1 2 -1 -4}

结果集为：

    (-1, 0, 1)
    (-1, -1, 2)

## 思路

因为是三个元素之和，定义两个元素 j 和 k。从 [j,k] 范围内查找符合的元素

<div align="center">
<img src="http://i.imgur.com/SgDx9AF.png" />
</div>

定义符合的三个元素之和为目标 

```
target = 0
```

### 首先进行排序

使用 

```
Arrays.sort();
```

### 当前元素
当前元素 i>0;

如果当前元素与上一个元素相同，则执行下一次循环，避免重复元素。

<div align="center">
<img src="http://i.imgur.com/X6w3akK.png" />
</div>


### 左区间

nums = S
若三元素之和小于目标值则左(右)区间往中间逼近

若下个元素即(j+1) 依然与上个元素(j) 相等，则左区间索引 +1

```
nums[i]+nums[j]+nums[k]<target
```

### 右区间
nums = S
若三元素之和小于目标值则右(左)区间往中间逼近

若上个元素即(k-1) 依然与下个元素(k) 相等，则右区间索引 -1

### 三元素值与目标值相等

左右区间同时往中间逼近

左区间 j 判断 下个元素是否还与当前左区间相等。相等则索引继续 +1


右区间 k 判断 上个元素是否还与当前右区间相等。相等则索引继续 -1


<div align="center">
<img src="http://i.imgur.com/JA1iKxb.png" />
</div>

## 代码实现

	//S = {-1 0 1 2 -1 -4}.
	public static List<List<Integer>> threeSum(int[] nums){
		//定义结果集
		List<List<Integer>> result = new ArrayList<>();
		//长度判断
		if(nums.length < 3) return result;
		//sort 排序
		Arrays.sort(nums);
		//目标值
		final int target = 0;
		
		for (int i = 0; i < nums.length - 2; i++) {
			//判断 当前值与上一个值是否一致，一致则 进行下一次循环。(不进行判断则会出现重复现象)
			if(i>0 && nums[i] == nums[i-1]) continue;
			//base scope
			int j = i+1;
			int k = nums.length-1;
			//给定范围内循环
			while(j < k){
				if(nums[i]+nums[j]+nums[k]<target){
					j++;
					//若出现重复的值，则 左区间  索引 +1,往中间逼近
					while(nums[j] == nums[j-1] && j<k) j++;
				}else if(nums[i]+nums[j]+nums[k]>target){
					k--;
					//若出现重复的值，则右区间  索引 -1,往中间逼近
					while(nums[k+1]  == nums[k] && j<k) k--;
				}else{
					result.add(Arrays.asList(nums[i],nums[j],nums[k]));
					j++;
					k--;
					//若出现重复的值，则 左区间  索引 +1,往中间逼近
					while(nums[j] == nums[j-1] && j<k) j++;
					//若出现重复的值，则右区间  索引 -1,往中间逼近
					while(nums[k+1] == nums[k] && j<k) k--;
				}
			}
		}
		return result;
	}


## 测试结果

![](http://i.imgur.com/p35Obvi.png)