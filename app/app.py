from flask import Flask, render_template, json, url_for, abort

app = Flask(__name__)


@app.route('/')
def home():
    with open('urls/urls.json', 'r') as f:
        data = json.load(f)
    return render_template('purltal.html', data=data)


if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5001)
