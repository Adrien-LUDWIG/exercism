#include <string>

namespace log_line {
    // Returns the message of a log line.
    std::string message(std::string log_line) {
        return log_line.substr(log_line.find(" ") + 1);
    }

    // Returns the log level of a log_line.
    std::string log_level(std::string log_line) {
        return log_line.substr(1, log_line.find("]") - 1);
    }

    // Reformats a log line to: <message> (<log_level>)
    std::string reformat(std::string log_line) {
        return message(log_line) + " (" + log_level(log_line) + ")";
    }
}  // namespace log_line
