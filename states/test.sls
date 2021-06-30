# testing
Display a message:
  test.show_notification:
    - text: testing

show off module.run with args:
  module.run:
    - test.random_hash:
      - size: 42
      - hash_type: sha256