# #!/usr/bin/env echo

# to run; java cli
# --glue com.myco.myproject.cucumber.steps

Feature: Is it Friday yet?
  Everybody wants to know when it's Friday

  Scenario: Sunday isn't Friday
    Given today is Sunday
    When I ask whether it's Friday yet
    Then I should be told "Nope"
