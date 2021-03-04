
import Foundation
/// 1333

func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
    var sortedRestaurants = [(id: Int, rating: Int)]()
    restaurants.forEach { restaurant in
        if (veganFriendly == 0 || veganFriendly == restaurant[2]) && restaurant[3] <= maxPrice && restaurant[4] <= maxDistance {
            sortedRestaurants.append((restaurant[0], restaurant[1]))
        }
    }
    sortedRestaurants.sort{ $0.rating > $1.rating || ($0.rating == $1.rating && $0.id > $1.id) }
    return sortedRestaurants.map { $0.id }
}

filterRestaurants([[1,4,1,40,10],[2,8,0,50,5],[3,8,1,30,4],[4,10,0,10,3],[5,1,1,15,1]], 0, 50, 10)
