class UserProfile {
  final String? name;
  final String? dob;
  final String? location;
  final bool? male;
  // Thêm các trường thông tin khác nếu cần

  UserProfile(
    this.male, {
    this.name,
    this.dob,
    this.location,
    // Khởi tạo các trường thông tin khác nếu cần
  });
}
