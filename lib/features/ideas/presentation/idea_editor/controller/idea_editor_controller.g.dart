// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_editor_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ideaEditorControllerHash() =>
    r'20a0cb1ab0aca6ebe5483c04a526d054a170c05f';

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
    extends BuildlessAutoDisposeNotifier<EcoIdea> {
  late final EcoIdea? idea;

  EcoIdea build(
    EcoIdea? idea,
  );
}

/// See also [IdeaEditorController].
@ProviderFor(IdeaEditorController)
const ideaEditorControllerProvider = IdeaEditorControllerFamily();

/// See also [IdeaEditorController].
class IdeaEditorControllerFamily extends Family<EcoIdea> {
  /// See also [IdeaEditorController].
  const IdeaEditorControllerFamily();

  /// See also [IdeaEditorController].
  IdeaEditorControllerProvider call(
    EcoIdea? idea,
  ) {
    return IdeaEditorControllerProvider(
      idea,
    );
  }

  @override
  IdeaEditorControllerProvider getProviderOverride(
    covariant IdeaEditorControllerProvider provider,
  ) {
    return call(
      provider.idea,
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
class IdeaEditorControllerProvider
    extends AutoDisposeNotifierProviderImpl<IdeaEditorController, EcoIdea> {
  /// See also [IdeaEditorController].
  IdeaEditorControllerProvider(
    EcoIdea? idea,
  ) : this._internal(
          () => IdeaEditorController()..idea = idea,
          from: ideaEditorControllerProvider,
          name: r'ideaEditorControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ideaEditorControllerHash,
          dependencies: IdeaEditorControllerFamily._dependencies,
          allTransitiveDependencies:
              IdeaEditorControllerFamily._allTransitiveDependencies,
          idea: idea,
        );

  IdeaEditorControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idea,
  }) : super.internal();

  final EcoIdea? idea;

  @override
  EcoIdea runNotifierBuild(
    covariant IdeaEditorController notifier,
  ) {
    return notifier.build(
      idea,
    );
  }

  @override
  Override overrideWith(IdeaEditorController Function() create) {
    return ProviderOverride(
      origin: this,
      override: IdeaEditorControllerProvider._internal(
        () => create()..idea = idea,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idea: idea,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IdeaEditorController, EcoIdea>
      createElement() {
    return _IdeaEditorControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IdeaEditorControllerProvider && other.idea == idea;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idea.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IdeaEditorControllerRef on AutoDisposeNotifierProviderRef<EcoIdea> {
  /// The parameter `idea` of this provider.
  EcoIdea? get idea;
}

class _IdeaEditorControllerProviderElement
    extends AutoDisposeNotifierProviderElement<IdeaEditorController, EcoIdea>
    with IdeaEditorControllerRef {
  _IdeaEditorControllerProviderElement(super.provider);

  @override
  EcoIdea? get idea => (origin as IdeaEditorControllerProvider).idea;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
