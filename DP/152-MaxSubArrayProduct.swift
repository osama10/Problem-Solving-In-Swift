  /**
* We only need to consider arrays without 0. If an array has 0 in it, then the
* array should be divided into two parts on either side of 0 because 0 cannot ever
* be included in the product.
* Example: 1,2,0,3,4,5. Max should be on either side of 0.
*
* Also, the max product array cannot ever be in the middle of an array. It has to
* be anchored to either ends of the array.
* Example case 1: -ve, Max Array, -ve
* In this case we can include both negative numbers and get a larger product
* Example case 2: +ve, Max Array, +ve
* This case is trivial as both +ve numbers need to be included in the product
* Example case 3: -ve, Max Array, +ve or +ve, Max Array, -ve
* In both the above cases we can extend Max Array to cover the +ve element to get
* a larger product and thus anchor the array to the right or left end.
*
* Now the problem is reduced to calculating the product of numbers from left, and
* then doing the same from right, and then calculating the max product.
    
Idea behind it is very simple. You have 2 situations (forget about 0's for a second). First scenario: you have even number of negative numbers. Then - the solutions is whole array.
Second scenario: you have odd number of negative numbers. Then - the solutions starts from left till the last negiative number or the other way around.

Now, think about 0's. They are nothing different than just start of an array, and you don't have to think about them at all :)
    
*/ 

func maxProduct(_ nums: [Int]) -> Int {
        
       var maxProduct = Int.min
        var product = 1
        
        for num in nums {
            product = product * num
            maxProduct = max(product, maxProduct)
            if product == 0 { product = 1 }
        }
        
        product = 1
        
        for index in stride(from: nums.count - 1, to: -1, by: -1) {
            product = product * nums[index]
             maxProduct = max(product, maxProduct)
            if product == 0 { product = 1 }
        }

        return maxProduct
    }