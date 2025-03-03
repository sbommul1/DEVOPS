#include <stdio.h>

paliendrome()
{
    int num, original, reversed = 0, remainder;

    // Input number
    printf("\nEnter an integer: ");
    scanf("%d", &num);

    original = num;  // Store original number

    // Reverse the number
    while (num != 0) {
        remainder = num % 10;
        reversed = reversed * 10 + remainder;
        num /= 10;
    }

    // Check if it's a palindrome
    if (original == reversed)
        printf("%d is a palindrome.\n", original);
    else
        printf("%d is not a palindrome.\n", original);

//    return 0;
}

