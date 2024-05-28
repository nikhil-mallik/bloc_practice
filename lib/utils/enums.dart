// Enum representing the status of a post operation.
enum PostStatus {
  loading, // Indicates the post is currently loading.
  success, // Indicates the post operation was successful.
  failure // Indicates the post operation failed.
}

// Enum representing the status of a list operation.
enum ListStatus {
  loading, // Indicates the list is currently loading.
  success, // Indicates the list operation was successful.
  failure // Indicates the list operation failed.
}

// Enum representing the status of a login operation.
enum LoginStatus {
  initial, // Indicates the initial state before login starts.
  loading, // Indicates the login operation is currently loading.
  success, // Indicates the login operation was successful.
  error // Indicates the login operation encountered an error.
}
