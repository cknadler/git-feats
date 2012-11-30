Feature: Feats

  A user should get feats when using git commands for the first time

  Scenario: Get Status Feat
    When I run `git-feats status`
    Then the output should contain "Feat Completed!"
    And the output should contain "git status"

