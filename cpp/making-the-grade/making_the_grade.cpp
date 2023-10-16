#include <array>
#include <string>
#include <vector>

const int FAILING_SCORE{40};
const int PERFECT_SCORE{100};
const int LETTER_GRADES_STEPS{4};

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std::vector<int> rounded_scores{};

    for (auto student_score : student_scores)
        // Casting rounds down because it is a truncation.
        rounded_scores.emplace_back(static_cast<int>(student_score));

    return rounded_scores;
}

// Count the number of failing students out of the group provided.
// A student is failing if his/her score is less than or equal to 40.
int count_failed_students(std::vector<int> student_scores) {
    int count{0};

    for (auto student_score : student_scores)
        if (student_score <= FAILING_SCORE) count++;

    return count;
}

// Determine how many of the provided student scores were 'the best' based on
// the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores,
                                 int threshold) {
    std::vector<int> best_scores{};

    for (auto student_score : student_scores)
        if (student_score >= threshold) best_scores.emplace_back(student_score);

    return best_scores;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, LETTER_GRADES_STEPS> letter_grades(int highest_score) {
    int step{(highest_score - FAILING_SCORE) / LETTER_GRADES_STEPS};

    std::array<int, LETTER_GRADES_STEPS> grade_thresholds{FAILING_SCORE + 1};

    for (int i{1}; i < LETTER_GRADES_STEPS; i++)
        grade_thresholds.at(i) = grade_thresholds.at(i - 1) + step;

    return grade_thresholds;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> ranking{};

    for (int i{0}; i < student_scores.size() && i < student_names.size(); i++)
        // Concatenation result : <rank>. <student_name>: <student score>
        ranking.emplace_back(std::to_string(i + 1) + ". " +
                             student_names.at(i) + ": " +
                             std::to_string(student_scores.at(i)));

    return ranking;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {
    for (int i{0}; i < student_scores.size() && i < student_names.size(); i++)
        if (student_scores.at(i) == PERFECT_SCORE) return student_names.at(i);

    return "";
}
