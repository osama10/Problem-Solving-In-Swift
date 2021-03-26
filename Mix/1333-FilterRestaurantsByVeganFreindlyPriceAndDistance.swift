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