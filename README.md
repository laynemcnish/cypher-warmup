g3-cypher-warmup
================

1. Remove all non-alphabetical characters.
2. Capitalize all letters.
3. Split the messages into 5 character groups.
4. Add ‘X’s to the end of the last group to make it 5 characters long.

Input:
Now this is a story all about how… 

Output:
`NOWTH ISISA STORY ALLAB OUTHO WXXXX`

5. You will use virtual deck of 52 cards and two jokers, we will assign the values as so:

*Clubs*

`Card Value:   A  2  3  4  5  6  7  8  9  10  J  Q  K`

`Number Value: 1  2  3  4  5  6  7  8  9  10  11 12 13`

*Diamonds*

`Card Value:   A  2  3  4  5  6  7  8  9  10  J  Q  K`

`Number Value: 14 15 16 17 18 19 20 21 22 23  24 25 26`

*Hearts*

`Card Value:   A  2  3  4  5  6  7  8  9  10  J  Q  K`

`Number Value: 27 28 29 30 31 32 33 34 35 36  37 38 39`

*Spades*

`Card Value:   A  2  3  4  5  6  7  8  9  10  J  Q  K`

`Number Value: 40 41 42 43 44 45 46 47 48 49  50 51 52`

*Jokers*

`Card Value:   A  B`

`Number Value: 53 53`

### Keying the deck

6. You will want to shuffle the deck since this will randomize the cards, adding security to your cipher. Since we are just testing things out, let’s skip the shuffling, and assume our cards are in the correct order of value.

*Top of deck*
Ace of clubs -> King of clubs
Ace of diamonds -> King of diamonds
Ace of hearts -> King of hearts
A
B
*Bottom of deck*

7. Move the A joker down one card. 

`Your deck:`

`1 2 3 … 52 B A`

Since we just moved J1 down one card.

8. Move the B joker down two cards. If the joker is at the bottom of the deck, move it one card under the top card, as if it were circular. 

`Your deck:`

`1 B 2 3 … 52 A`

Since we have now moved B as well. 

9. Triple cut: Move all the cards on top of B to below A and move all cards below A to the top of B. Jokers and the middle cards stay put.

`Your deck:`

`B 2 3 … 52 A 1`

10. Count cut: Using the value of the bottom card, in our case 1. Take that many cards off the top and put them back in the deck just above the bottom card.

`Your deck:`

`2 3 … 52 A B 1`

11. Output letter: Using the value of the top card, in our case 2. Count that many cards down and look at the card, in our case 4. Convert 4 to a letter using our method.

`2 3 *4* 5 6 7`

`B C *D* E F G`

12. If you need another encrypted letter go back to step 7.

13. Convert all of the letters from your original message to numbers, using our method:

`A B C D E F G H I J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X Y  Z`

`1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26`

Our original passphrase converted to numbers:
`14 15 23 20 8  9 19 9 19 1  19 20 15 18 25  1 12 12 1 2  15 21 20 8 15  23 24 24 24 24`

After you have generated all of your encrypted letters, turn them into numbers. This will be your key!

`8 24 12 16 2  5 17 23 19 14  10 9 14 3 12  4 12 14 20 11  13 23 21 12 9  10 20 13 21 7`

14. You will add each value of the corresponding set of numbers together.

`22 39 35 36 10  14 36 32 38 15  29 29 29 21 37  5 24 26 21 13  28 24 41 20 24  33 44 37 45 31`

15. Convert the numbers back into letters, subtract 26 if the number is larger than 26.

`V M I J J  N J F L O  C C C U K  E X Z U M  B X O T X  G N K S E`

You have now completed the encryption.

16. To decrypt the message you subtract your key, generated in step 13 from the letters in step 15 converted into numbers.

`14 15 23 20 8  9 19 9 19 1  19 20 15 18 25  1 12 12 1 2  15 21 20 8 15  23 24 24 24 24`

And then back into letters:

`NOWTH ISISA STORY ALLAB OUTHO WXXXX`


