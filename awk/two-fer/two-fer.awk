# Set 'name' to "you" by default
BEGIN {
    name = "you";
}

# If a name is provided, update 'name'
$0 != "" {
    name = $0
}

END {
    print "One for " name ", one for me.";
}
