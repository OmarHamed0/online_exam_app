import 'package:flutter/material.dart';
import '../../../../../../../../core/styles/colors/app_colors.dart';

class QuestionAnswerContainer extends StatelessWidget {
  final Map<String, dynamic> question;
  final bool isResultScreen;

  const QuestionAnswerContainer({super.key, 
    required this.question,
    this.isResultScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: question['isCorrect'] ? AppColors.kLightGreen : AppColors.kRed,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question['question'] ?? "Question: ${question['questionId']}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: question['options']?.length ?? 0,
            itemBuilder: (context, index) {
              final option = question['options'][index];
              final isSelected = question['selectedAnswer'] == option['key'];
              final isCorrect = option['key'] == question['correct'];

              return _buildOptionItem(
                option['answer'] ?? '',
                isSelected,
                isCorrect,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(String text, bool isSelected, bool isCorrect) {
    Color backgroundColor = AppColors.kLightBlue;
    Color textColor = AppColors.kBlack;

    if (isSelected) {
      backgroundColor = isCorrect ? AppColors.kLightGreen : AppColors.kRed;
      textColor = AppColors.kWhite;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isSelected
                ? (isCorrect ? Icons.check_circle : Icons.cancel)
                : Icons.radio_button_unchecked,
            color: isSelected ? AppColors.kWhite : AppColors.kBlack,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
