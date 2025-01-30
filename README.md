# TMDB - Flutter Movie App 🎥  
TMDB is a Flutter mobile application powered by the TMDB public APIs. The app allows users to:  
- Search for movies.  
- View movie details (about, cast, reviews).  
- Explore movie categories like "Top Rated" and "Popular."  
- Add movies to their favorites list.  

You can find the figma design [here](https://www.figma.com/design/yPDLLKcSnAsc11GmIz78m6/MovieDB?node-id=347-862&t=yYU3GhVvLTtyrutu-1)

## Features ✨  
- **Search Movies**: Instantly search for your favorite movies by title.  
- **Movie Details**: View comprehensive details about movies, including cast, reviews, and descriptions.  
- **Category Browsing**: Explore movies by categories such as Top Rated, Popular, Upcoming, and more.  
- **Favorites Management**: Mark movies as favorites and access them later.  
- **Offline Support**: Access saved favorites even without an Internet connection.  

## Technologies & Packages Used 📦  

- **[BLoC](https://pub.dev/packages/flutter_bloc)**: For state management.  
- **[Hive](https://pub.dev/packages/hive)**: For local storage.  
- **[Dio](https://pub.dev/packages/dio)**: For HTTP requests.  
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)**: For efficient image loading and caching.  


## Setup Instructions ⚙️  

### 1. Clone the Repository 
```
git clone https://github.com/Hiwa-Shaloudegi/TMDB.git
cd TMDB
```

### 2. Set Up API Key 
This project requires an API access token from TMDB. To configure it:

1. Create a .env file in the root directory by copying .env.example:
```
cp .env.example .env
```
2. Open .env and update it with a valid API access token:
```
API_ACCESS_TOKEN=your_api_access_token_here
```

### 3. Install Dependencies
```
flutter pub get
```

### 4. Run the App
```
flutter run
```

## Screenshots 📸  

<p align="center">
  <img src="https://github.com/user-attachments/assets/3a98ec0f-901b-4674-924a-98edc8eb69d3" width="250" alt="Home Screen" hspace="4" />
  <img src="https://github.com/user-attachments/assets/1511a44a-8d8d-4c47-9557-97c47250859e" width="250" alt="Movie Details" hspace="4" />
  <img src="https://github.com/user-attachments/assets/0ce78694-34d4-4295-8be3-51533eda860c" width="250" alt="Search Movies" hspace="4" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/4933b8f2-7e68-4e4d-b11b-ff7b4bc85255" width="250" alt="Categories" hspace="4" />
  <img src="https://github.com/user-attachments/assets/69261b22-4b10-49cc-b4af-874740f649a0" width="250" alt="Favorites" hspace="4" />
</p>



