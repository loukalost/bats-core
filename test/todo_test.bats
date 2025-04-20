#!/usr/bin/env bats

# Vérifie que le service HTTP est accessible et répond correctement
@test "GET /todo répond avec succès (code HTTP 200)" {
  result="$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8081/todo)"
  [ "$result" -eq 200 ]
}

# Vérifie que la sortie du script n'est pas vide
@test "GET /todo retourne une sortie non vide" {
  result="$(curl -s http://localhost:8081/todo)"
  [ -n "$result" ]
}

# Vérifie que le contenu retourné correspond à une sortie attendue
@test "GET /todo retourne le contenu attendu" {
  result="$(curl -s http://localhost:8081/todo)"
  [[ "$result" =~ "Todo List" ]]
}
