import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required List<AbilityInfo> abilities,
    @JsonKey(name: 'base_experience') required int baseExperience,
    required List<Form> forms,
    @JsonKey(name: 'game_indices') required List<GameIndex> gameIndices,
    required int height,
    @JsonKey(name: 'held_items') required List<HeldItem> heldItems,
    required int id,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'location_area_encounters')
    required String locationAreaEncounters,
    required List<Move> moves,
    required String name,
    required int order,
    required Species species,
    required Sprites sprites,
    required List<Stat> stats,
    required List<TypeInfo> types,
    required int weight,
  }) = _Pokemon;

  factory Pokemon.empty() => const Pokemon(
        abilities: [],
        baseExperience: 0,
        forms: [],
        gameIndices: [],
        height: 0,
        heldItems: [],
        id: 0,
        isDefault: false,
        locationAreaEncounters: '',
        moves: [],
        name: '',
        order: 0,
        species: Species(name: '', url: ''),
        sprites: Sprites(),
        stats: [],
        types: [],
        weight: 0,
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
class AbilityInfo with _$AbilityInfo {
  const factory AbilityInfo({
    required Ability ability,
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required int slot,
  }) = _AbilityInfo;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({
    required String name,
    required String url,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@freezed
class Form with _$Form {
  const factory Form({
    required String name,
    required String url,
  }) = _Form;

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
}

@freezed
class GameIndex with _$GameIndex {
  const factory GameIndex({
    @JsonKey(name: 'game_index') required int gameIndex,
    required Version version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);
}

@freezed
class Version with _$Version {
  const factory Version({
    required String name,
    required String url,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}

@freezed
class HeldItem with _$HeldItem {
  const factory HeldItem({
    required Item item,
    @JsonKey(name: 'version_details')
    required List<VersionDetail> versionDetails,
  }) = _HeldItem;

  factory HeldItem.fromJson(Map<String, dynamic> json) =>
      _$HeldItemFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String name,
    required String url,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class VersionDetail with _$VersionDetail {
  const factory VersionDetail({
    required int rarity,
    required Version version,
  }) = _VersionDetail;

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);
}

@freezed
class Move with _$Move {
  const factory Move({
    required MoveInfo move,
    @JsonKey(name: 'version_group_details')
    required List<VersionGroupDetail> versionGroupDetails,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}

@freezed
class MoveInfo with _$MoveInfo {
  const factory MoveInfo({
    required String name,
    required String url,
  }) = _MoveInfo;

  factory MoveInfo.fromJson(Map<String, dynamic> json) =>
      _$MoveInfoFromJson(json);
}

@freezed
class VersionGroupDetail with _$VersionGroupDetail {
  const factory VersionGroupDetail({
    @JsonKey(name: 'level_learned_at') required int levelLearnedAt,
    @JsonKey(name: 'move_learn_method')
    required MoveLearnMethod moveLearnMethod,
    @JsonKey(name: 'version_group') required Version versionGroup,
  }) = _VersionGroupDetail;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailFromJson(json);
}

@freezed
class MoveLearnMethod with _$MoveLearnMethod {
  const factory MoveLearnMethod({
    required String name,
    required String url,
  }) = _MoveLearnMethod;

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) =>
      _$MoveLearnMethodFromJson(json);
}

@freezed
class Species with _$Species {
  const factory Species({
    required String name,
    required String url,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
}

@freezed
class Sprites with _$Sprites {
  const factory Sprites({
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_female') String? backFemale,
    @JsonKey(name: 'back_shiny') String? backShiny,
    @JsonKey(name: 'back_shiny_female') String? backShinyFemale,
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_female') String? frontFemale,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'front_shiny_female') String? frontShinyFemale,
    // Add other fields as needed
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@freezed
class Stat with _$Stat {
  const factory Stat({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required StatInfo stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@freezed
class StatInfo with _$StatInfo {
  const factory StatInfo({
    required String name,
    required String url,
  }) = _StatInfo;

  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);
}

@freezed
class TypeInfo with _$TypeInfo {
  const factory TypeInfo({
    required int slot,
    required Type type,
  }) = _TypeInfo;

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    required String name,
    required String url,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
