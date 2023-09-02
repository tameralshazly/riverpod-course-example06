// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;
  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film copy({required bool isFavorite}) {
    return Film(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() {
    return 'Film(id: $id, title: $title, description: $description, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant Film other) {
    if (identical(this, other)) return true;

    return other.id == id && other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      isFavorite,
    ]);
  }
}

const allFilms = [
  Film(
      id: '1',
      title: 'The Shawshank Redemption',
      description:
          'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      isFavorite: false),
  Film(
      id: '2',
      title: 'The Godfather',
      description:
          'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      isFavorite: false),
  Film(
      id: '3',
      title: 'The Godfather: Part II',
      description:
          'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.',
      isFavorite: false),
  Film(
      id: '4',
      title: 'The Dark Knight',
      description:
          'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.',
      isFavorite: false),
  Film(
      id: '5',
      title: '12 Angry Men',
      description:
          'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.',
      isFavorite: false),
  Film(
      id: '6',
      title: "Schindler's List",
      description:
          'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.',
      isFavorite: false),
  Film(
      id: '7',
      title: 'Pulp Fiction',
      description:
          'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
      isFavorite: false),
  Film(
      id: '8',
      title: 'Inception',
      description:
          'A thief who enters the dreams of others to steal secrets from their subconscious becomes involved in a more complex plot.',
      isFavorite: false),
  Film(
      id: '9',
      title: 'Fight Club',
      description:
          'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.',
      isFavorite: false),
  Film(
      id: '10',
      title: 'Forrest Gump',
      description:
          'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.',
      isFavorite: false),
  Film(
      id: '11',
      title: 'The Matrix',
      description:
          'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
      isFavorite: false),
  Film(
      id: '12',
      title: 'Goodfellas',
      description:
          'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.',
      isFavorite: false),
  Film(
      id: '13',
      title: 'The Lord of the Rings: The Fellowship of the Ring',
      description:
          'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.',
      isFavorite: false),
  Film(
      id: '14',
      title: 'Star Wars: Episode V - The Empire Strikes Back',
      description:
          'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader.',
      isFavorite: false),
  Film(
      id: '15',
      title: 'One Flew Over the Cuckoo\'s Nest',
      description:
          'A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.',
      isFavorite: false),
  Film(
      id: '16',
      title: 'Seven Samurai',
      description:
          'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.',
      isFavorite: false),
  Film(
      id: '17',
      title: 'Avengers: Endgame',
      description:
          'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',
      isFavorite: false),
  Film(
      id: '18',
      title: 'The Silence of the Lambs',
      description:
          'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.',
      isFavorite: false),
  Film(
      id: '19',
      title: 'Se7en',
      description:
          'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.',
      isFavorite: false),
  Film(
      id: '20',
      title: 'Life Is Beautiful',
      description:
          'When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.',
      isFavorite: false),
];

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(allFilms);

  void update(Film film, bool isFavorite) {
    state = state
        .map((thisFilm) => thisFilm.id == film.id
            ? thisFilm.copy(isFavorite: isFavorite)
            : thisFilm)
        .toList();
  }
}

enum FavoriteStatus { all, favorite, notFavorite }

// favorite status
final favoriteStatusProvider = StateProvider((ref) => FavoriteStatus.all);

// all films
final allFilmsProvider =
    StateNotifierProvider<FilmsNotifier, List<Film>>((ref) {
  return FilmsNotifier();
});

// favorite films
final favoriteFilmsProvider = Provider<Iterable<Film>>((ref) {
  return ref.watch(allFilmsProvider).where((film) => film.isFavorite);
});

// notFavorite films
final notFavoriteFilmsProvider = Provider<Iterable<Film>>((ref) {
  return ref.watch(allFilmsProvider).where((film) => film.isFavorite == false);
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Films"),
      ),
      body: Column(
        children: [
          const FilterWidget(),
          Consumer(
            builder: (context, ref, child) {
              final filter = ref.watch(favoriteStatusProvider);
              switch (filter) {
                case FavoriteStatus.all:
                  return FilmsList(provider: allFilmsProvider);
                case FavoriteStatus.favorite:
                  return FilmsList(provider: favoriteFilmsProvider);
                case FavoriteStatus.notFavorite:
                  return FilmsList(provider: notFavoriteFilmsProvider);
              }
            },
          ),
        ],
      ),
    );
  }
}

class FilmsList extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmsList({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
        child: ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films.elementAt(index);
        final favoriteIcon = film.isFavorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border);

        return ListTile(
          title: Text(film.title),
          subtitle: Text(film.description),
          trailing: IconButton(
            icon: favoriteIcon,
            onPressed: () {
              final isFavorite = !film.isFavorite;
              ref.read(allFilmsProvider.notifier).update(film, isFavorite);
            },
          ),
        );
      },
    ));
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
          value: ref.watch(favoriteStatusProvider),
          items: FavoriteStatus.values
              .map((fs) => DropdownMenuItem(
                    value: fs,
                    child: Text(fs.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (FavoriteStatus? fs) {
            ref.read(favoriteStatusProvider.notifier).state = fs!;
          },
        );
      },
    );
  }
}
