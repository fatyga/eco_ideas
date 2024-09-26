// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_editor_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ideaEditorControllerHash() =>
    r'807c0ee7e4f50ecd79f26c586d76abcb8356fc83';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$IdeaEditorController
    extends BuildlessAutoDisposeAsyncNotifier<IdeaEditorState> {
  late final String ideaId;

  FutureOr<IdeaEditorState> build(
    String ideaId,
  );
}

/// See also [IdeaEditorController].
@ProviderFor(IdeaEditorController)
const ideaEditorControllerProvider = IdeaEditorControllerFamily();

/// See also [IdeaEditorController].
class IdeaEditorControllerFamily extends Family<AsyncValue<IdeaEditorState>> {
  /// See also [IdeaEditorController].
  const IdeaEditorControllerFamily();

  /// See also [IdeaEditorController].
  IdeaEditorControllerProvider call(
    String ideaId,
  ) {
    return IdeaEditorControllerProvider(
      ideaId,
    );
  }

  @override
  IdeaEditorControllerProvider getProviderOverride(
    covariant IdeaEditorControllerProvider provider,
  ) {
    return call(
      provider.ideaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ideaEditorControllerProvider';
}

/// See also [IdeaEditorController].
class IdeaEditorControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    IdeaEditorController, IdeaEditorState> {
  /// See also [IdeaEditorController].
  IdeaEditorControllerProvider(
    String ideaId,
  ) : this._internal(
          () => IdeaEditorController()..ideaId = ideaId,
          from: ideaEditorControllerProvider,
          name: r'ideaEditorControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ideaEditorControllerHash,
          dependencies: IdeaEditorControllerFamily._dependencies,
          allTransitiveDependencies:
              IdeaEditorControllerFamily._allTransitiveDependencies,
          ideaId: ideaId,
        );

  IdeaEditorControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ideaId,
  }) : super.internal();

  final String ideaId;

  @override
  FutureOr<IdeaEditorState> runNotifierBuild(
    covariant IdeaEditorController notifier,
  ) {
    return notifier.build(
      ideaId,
    );
  }

  @override
  Override overrideWith(IdeaEditorController Function() create) {
    return ProviderOverride(
      origin: this,
      override: IdeaEditorControllerProvider._internal(
        () => create()..ideaId = ideaId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ideaId: ideaId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<IdeaEditorController, IdeaEditorState>
      createElement() {
    return _IdeaEditorControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IdeaEditorControllerProvider && other.ideaId == ideaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ideaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IdeaEditorControllerRef
    on AutoDisposeAsyncNotifierProviderRef<IdeaEditorState> {
  /// The parameter `ideaId` of this provider.
  String get ideaId;
}

class _IdeaEditorControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IdeaEditorController,
        IdeaEditorState> with IdeaEditorControllerRef {
  _IdeaEditorControllerProviderElement(super.provider);

  @override
  String get ideaId => (origin as IdeaEditorControllerProvider).ideaId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
