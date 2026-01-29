extension TimeAgo on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) return 'just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} minutes ago';
    if (difference.inHours < 24) return '${difference.inHours} hours ago';
    if (difference.inDays < 7) return '${difference.inDays} days ago';

    return "${this.day.toString().padLeft(2, '0')}-${this.month.toString().padLeft(2, '0')}-${this.year}";
  }
}

extension DateTimeFormatting on DateTime {
  String toAmPmString() {
    final hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    final minute = this.minute.toString().padLeft(
      2,
      '0',
    );
    final amPm = this.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $amPm';
  }
}
