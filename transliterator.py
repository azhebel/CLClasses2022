char_dict = {
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'ё': 'e',
    'ж': 'zh',
    'з': 'z',
    'и': 'i',
    'й': 'i',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'c',
    'ч': 'ch',
    'ш': 'sh',
    'щ': 'sch',
    'ъ': '',
    'ы': 'y',
    'ь': '',
    'э': 'e',
    'ю': 'u',
    'я': 'ya',
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Е': 'E',
    'Ё': 'E',
    'Ж': 'ZH',
    'З': 'Z',
    'И': 'I',
    'Й': 'I',
    'К': 'K',
    'Л': 'L',
    'М': 'M',
    'Н': 'N',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Т': 'T',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'C',
    'Ч': 'CH',
    'Ш': 'SH',
    'Щ': 'SCH',
    'Ъ': '',
    'Ы': 'Y',
    'Ь': '',
    'Э': 'E',
    'Ю': 'U',
    'Я': 'YA',
    ',': ',',
    '?': '?',
    ' ': '_',
    '~': '~',
    '!': '!',
    '@': '@',
    '#': '#',
    '$': '$',
    '%': '%',
    '^': '^',
    '&': '&',
    '*': '*',
    '(': '(',
    ')': ')',
    '-': '-',
    '=': '=',
    '+': '+',
    ':': ':',
    ';': ';',
    '<': '<',
    '>': '>',
    '\'': '\'',
    '"': '"',
    '\\': '\\',
    '/': '/',
    '№': '#',
    '[': '[',
    ']': ']',
    '{': '{',
    '}': '}',
    'ґ': 'r',
    'ї': 'r',
    'є': 'e',
    'Ґ': 'g',
    'Ї': 'i',
    'Є': 'e',
    '—': '-'
}

# Input a string
typed_word = input("Enter a word:")

# Declare an empty string for the transliterated word
trans_word = ""

# Cycle through each character in the input string
for character in typed_word:
    # Concatenate transliterated word with the value that corresponds to the character in the dictionary
    trans_word += char_dict[character]

print("Transliterated via first method:", trans_word)

# Alternatively, we can cycle through each character in the dictionary and replace it directly in the input string.
# This way we don't need to create and fill a new string.
for character in char_dict:
    typed_word = typed_word.replace(character, char_dict[character])

print("Transliterated via second method:", typed_word)
