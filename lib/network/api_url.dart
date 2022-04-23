class ApiURL {
  static const String movieforUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN';

  
    static String  castUrl (String id) => 'https://api.themoviedb.org/3/movie/${id}/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=viVN';
}
