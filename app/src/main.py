""" 
 dada joke API. 

 author: ashraf minhaj
 email : ashraf_minhaj@yahoo.com
"""
from flask import Flask
import random

app = Flask(__name__)

# List of random dad jokes
dad_jokes = [
    "Why did the scarecrow win an award? Because he was outstanding in his field!",
    "Did you hear about the math teacher who’s afraid of negative numbers? He’ll stop at nothing to avoid them!",
    "What do you call fake spaghetti? An impasta!",
    "Why don't skeletons fight each other? They don't have the guts!",
    "I only know 25 letters of the alphabet. I don't know y!",
    "What do dentists call their x-rays? Tooth pics!",
    "Why should you never trust stairs? They’re always up to something.",
    "When does a joke become a ‘dad’ joke? When it becomes apparent.",
    "Why did the bullet end up losing his job? He got fired."
]

@app.route('/')
def index():
    # Select a random dad joke
    random_joke = random.choice(dad_jokes)
    return random_joke

@app.route('/health')
def health():
    return "ok"

if __name__ == '__main__':
    print("running")
    app.run(debug=False, host='0.0.0.0', port="8080")