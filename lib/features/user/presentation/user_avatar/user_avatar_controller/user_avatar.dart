enum UserAvatarSource { local, network }

class UserAvatar {
  const UserAvatar({required this.path, required this.source});
  UserAvatar.local(String path)
      : this(path: path, source: UserAvatarSource.local);
  UserAvatar.network(String path)
      : this(path: path, source: UserAvatarSource.network);
  final String path;
  final UserAvatarSource source;
}
