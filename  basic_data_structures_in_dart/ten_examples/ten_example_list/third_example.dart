void main() {
  // List of favorite movies
  List<String> favoriteMovies = ['Inception', 'The Matrix', 'Interstellar', 'The Shawshank Redemption'];

  // Check if a movie is in the list
  bool isFavorite = isMovieFavorite(favoriteMovies, 'Inception');

  // Print the list of favorite movies
  print('Favorite Movies:');
  for (var movie in favoriteMovies) {
    print('- $movie');
  }

  // Print if the movie is a favorite
  print('Is "Inception" a favorite movie? $isFavorite');
}

// Method to check if a movie is a favorite
bool isMovieFavorite(List<String> list, String movie) {
  return list.contains(movie);
}
