#include <stdio.h>

reverse() {
    int num, reversed = 0, remainder;

    // Input from user
    printf("Enter a number: ");
    scanf("%d", &num);

    // Reverse the number
    while (num != 0) {
        remainder = num % 10;       // Get the last digit
        reversed = reversed * 10 + remainder; // Append digit to reversed number
        num /= 10;                  // Remove last digit
    }

    // Output result
    printf("Reversed number: %d\n", reversed);

//    return 0;
}

