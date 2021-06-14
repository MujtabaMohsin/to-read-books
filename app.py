from flask import Flask, request, redirect, url_for,render_template,flash
from flask_migrate import Migrate
from flask_moment import Moment
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config')
moment = Moment(app)

db = SQLAlchemy(app)
migrate = Migrate(app, db)


# ------------- models -----------------------

class Book(db.Model):
    __tablename__ = 'Book'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String)
    author = db.Column(db.String(120))
    type = db.Column(db.String(120))
    read = db.Column(db.Boolean)

    def __init__(self,title,author,type,read=False):
        self.title = title
        self.author = author
        self.type = type
        self.read = read




@app.route('/')
def index():
    books = Book.query.all()

    return render_template('my-books.html', books=books)


@app.route('/add-book')
def addBook():
    return render_template('add-book.html')



@app.route('/create-book',methods=['GET','POST'])
def createBook():

    title = request.form.get('title')
    author = request.form.get('author')
    type = request.form.get('type')

    book = Book(title,author,type)
    db.session.add(book)
    db.session.commit()

    books = Book.query.all()
    return redirect(url_for('index'))


@app.route('/update-book/<book_id>')
def updateBook(book_id):


    book = Book.query.get(book_id)
    book.read = True

    db.session.commit()

    return redirect(url_for('index'))


@app.route('/delete-book/<book_id>')
def deleteBook(book_id):



    book = Book.query.get(book_id)
    db.session.delete(book)
    db.session.commit()


    return redirect(url_for('index'))


# Default port:
if __name__ == '__main__':
    app.run(debug=True)