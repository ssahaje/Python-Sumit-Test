from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail, Message
# import os


with open('config.json', 'r') as cnfg:
    params = json.load(cnfg)["params"]

local_server = True
app = Flask(__name__)

'''***********  Email block begins here   *************'''

# mail_settings = {
#     "MAIL_SERVER": 'smtp.gmail.com',
#     "MAIL_PORT": 465,
#     "MAIL_USE_SSL": True,
#     "MAIL_USERNAME": os.environ['EMAIL_USER'],
#     "MAIL_PASSWORD": os.environ['EMAIL_PASSWORD']
# }
#
# app.config.update(mail_settings)
# mail = Mail(app)
app.config.update(
    MAIL_SERVER=params['GMAIL_SERVER'],
    MAIL_PORT=params['GMAIL_PORT'],
    MAIL_USE_SSL=params['GMAIL_USE_SSL'],
    MAIL_USERNAME=params['GMAIL_USERNAME'],
    MAIL_PASSWORD=params['GMAIL_PASSWORD']
)
mail = Mail(app)

'''***********  Email block ends here   *************'''

'''***********  Database block begins here   *************'''

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
db = SQLAlchemy(app)


class Contacts(db.Model):
    ''' Sr_No, Name, Email, Phone_Number, Message, Date '''

    Sr_No = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(50), nullable=False)
    Email = db.Column(db.String(50), nullable=False)
    Phone_Number = db.Column(db.String(12), nullable=False)
    Message = db.Column(db.String(120), nullable=False)
    Date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    ''' Sr_No, Title, Content, Slug, Date '''
    Sr_No = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(50), nullable=False)
    Content = db.Column(db.String(120), nullable=False)
    Slug = db.Column(db.String(50), nullable=False)
    img_file = db.Column(db.String(20), nullable=True)
    Date = db.Column(db.String(12), nullable=True)


'''***********  Database block ends here   *************'''


@app.route('/')
def home():
    return render_template('index.html', params=params)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(Slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if request.method == 'POST':
        pass
    else:
        return render_template('login.html', params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''Add entry to database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        '''
            DB Table column names - Sr_No, Name, Email, Phone_Number, Message, Date
        '''
        entry = Contacts(Name=name, Email=email, Phone_Number=phone, Message=message, Date=datetime.now())

        db.session.add(entry)
        db.session.commit()
        mail.send_message('New mail from ' + name,
                          sender=email,
                          recipients=[params['GMAIL_USERNAME'], 'ssahaje@gmail.com'],
                          body=message + '\n' + phone
                          )

    return render_template('contact.html', params=params)


@app.route('/post')
def post():
    return render_template('post.html', params=params, post=post)


app.run(debug=True)

