from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('index1.html')


@app.route('/baba')
def hello_baba():
    return render_template('header1.html')

@app.route('/var')
def hello_var():
    var = "Sumit's"
    return render_template('header1.html', template_var=var)


app.run(debug=True)

