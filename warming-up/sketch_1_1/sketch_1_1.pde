/*
 * Algorithms for CreaTe
 * Creative Technology module 4
 * Author: Anand Chowdhary
 * License: CC-BY 4.0

 * 1.1 Write for each of the following a program that defines an array of characters, and:
 * 1.1.1. writes the content of the array on the Processing window, letter by letter
 * 1.1.2. writes the content of the array on the Processing window, backwards order, i.e., starting with the last
 * 1.1.3. counts how many occurrences of the letter ‘e’ are contained in the array
 * 1.1.4. decides whether the array form a palindrome, i.e. reading from beginning gives the same “word” as reading from the end. An example for a palindrome is "ANNA".
 */

char[] text;
int index;

void setup() {
	size(500, 300);
	text = "Sample string".toCharArray();
	index = 0;
}

void draw() {
	background(255, 255, 244);
	fill(0, 0, 0);
	letterByLetter(text, index);
	letterByLetterBackwards(text, index);
	if (index < text.length - 1) {
		index++;
	} else {
		index = 0;
	}
	text("Number of occurrances of e: " + str(countOccurrences(text, 'e')), 100, 160);
	text("Is it a palindrome: " + (isPalindrome(text) ? "Yes" : "No"), 100, 190);
	delay(200);
}

/*
 * Displays the word letter by letter
 * @param text - Array of characters with text
 * @param index - Current index for displaying
 */
void letterByLetter(char[] text, int index) {
	String textToDisplay = "";
	for (int j = 0; j <= index; j++) {
		textToDisplay += text[j];
	}
	text(textToDisplay, 100, 100);
}

/*
 * Displays the word letter by letter in backwards order
 * @param text - Array of characters with text
 * @param index - Current index for displaying
 */
void letterByLetterBackwards(char[] text, int index) {
	String textToDisplay = "";
	for (int j = 0; j <= index; j++) {
		textToDisplay += text[text.length - j - 1];
	}
	text(textToDisplay, 100, 130);
}

/*
 * Counts the number of occurrences of a character
 * @param text - Array of characters with text
 * @param letter - Character to count occurrences of
 */
int countOccurrences(char[] text, char letter) {
	int count = 0;
	for (int i = 0; i < text.length; i++) {
		if (text[i] == letter) count++;
	}
	return count;
}

/*
 * Returns whether or not a word is a palindrome
 * @param text - Array of characters with text
 * @param letter - Character to count occurrences of
 */
boolean isPalindrome(char[] text) {
	for (int i = 0; i < text.length; i++)
		if (text[i] != text[text.length - i - 1]) return false;
	return true;
}