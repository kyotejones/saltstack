# testing
Display a message:
  test.show_notification:
    - text: testing

# New Style
test.random_hash:
  module.run:
    - test.random_hash:
      - size: 42
      - hash_type: sha256

# Legacy Style
test.random_hash:
  module.run:
    - size: 42
    - hash_type: sha256