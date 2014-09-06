# Emoji expressions 😱

## Anchors

| symbol | description |
| ---------|:---------:|
| 💥 | beginning of line |
| 🚏 | end of line |

## Quantifiers

| symbol | description |
| ---------|:---------:|
| 🍺 | 0 or more |
| 🍻 | 1 or more |
| 🍷 | 0 or 1 |

You can add the *cheers* operator (🍷) to make quantifiers non-greedy.

## Groups and Ranges

| symbol | description |
| ---------|:---------:|
| 👽 | any character |
| 🙈a💫b🙊 | a or b |
| 🙈*...*🙊 | capture group |
| 😈*...*👿 | non-capture group |
| 🌑abc🌕 | range |
| 👎abc👍 | negative range |
