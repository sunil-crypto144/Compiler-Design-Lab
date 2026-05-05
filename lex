import re

# Define token patterns
token_patterns = [
    ('KEYWORD', r'\b(if|else|while|for|int|float|return|char|void)\b'),
    ('IDENTIFIER', r'\b[a-zA-Z_][a-zA-Z0-9_]*\b'),
    ('NUMBER', r'\b\d+(\.\d+)?\b'),
    ('OPERATOR', r'[+\-*/=<>!]'),
    ('SEPARATOR', r'[(){};,]'),
    ('STRING', r'\".*?\"'),
    ('WHITESPACE', r'\s+'),
]

def lexical_analyzer(code):
    tokens = []
    
    while code:
        match = None
        
        for token_type, pattern in token_patterns:
            regex = re.compile(pattern)
            match = regex.match(code)
            
            if match:
                value = match.group(0)
                
                if token_type != 'WHITESPACE':
                    tokens.append((token_type, value))
                
                code = code[len(value):]
                break
        
        if not match:
            print("Invalid character:", code[0])
            code = code[1:]
    
    return tokens


# Example input
source_code = '''
int main() {
    int a = 10;
    float b = 20.5;
    if(a < b){
        return a;
    }
}
'''

# Run lexical analyzer
result = lexical_analyzer(source_code)

# Print tokens
for token in result:
    print(token)
