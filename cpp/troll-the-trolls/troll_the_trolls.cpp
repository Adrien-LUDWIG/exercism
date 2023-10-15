namespace hellmath {

    // Sorted from least to most priority.
    enum class AccountStatus { troll, guest, user, mod };

    enum class Action { read, write, remove };

    // Checks if a given viewer should see a given post.
    bool display_post(AccountStatus poster, AccountStatus viewer) {
        // Posts from trolls should only be seen by trolls.
        return poster != AccountStatus::troll || viewer == AccountStatus::troll;
    }

    // Checks if a given account can perform a given action.
    bool permission_check(Action action, AccountStatus account) {
        switch (account) {
            case AccountStatus::mod:
                return true;
            case AccountStatus::user:
            case AccountStatus::troll:
                return action == Action::read || action == Action::write;
            default:  // guest
                return action == Action::read;
        }
    }

    // Checks if two players can play together depending on there account
    // status.
    bool valid_player_combination(AccountStatus player1,
                                  AccountStatus player2) {
        // One of the players is a guest
        if (player1 == AccountStatus::guest || player2 == AccountStatus::guest)
            return false;
        // Both players are trolls
        if (player1 == AccountStatus::troll && player2 == AccountStatus::troll)
            return true;
        // Neither player is a troll
        return player1 != AccountStatus::troll &&
               player2 != AccountStatus::troll;
    }

    // Check wether the first player has priority over the other.
    bool has_priority(AccountStatus player1, AccountStatus player2) {
        return player1 > player2;
    }
}  // namespace hellmath