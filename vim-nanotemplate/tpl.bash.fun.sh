function get_value() {
  echo "value $1"
}

echo "you are $(get_value test)"
get_value test
