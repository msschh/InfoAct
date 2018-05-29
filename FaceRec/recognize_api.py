from flask import redirect, url_for, Flask, request
from recognize_svm import recognize_svm
from recognize_knn import recognize_knn
import json

app = Flask(__name__)

@app.route('/recognizeSVM/<img>/')
def recognizeSVM(img):
    img = "/home/alex/Desktop/InfoAct/InfoAct/InfoActWeb/src/main/webapp/img-test/" + img
    return recognize_svm(img)

@app.route('/recognizeKNN/<img>/')
def recognizeKNN(img):
    img = "/home/alex/Desktop/InfoAct/InfoAct/InfoActWeb/src/main/webapp/img-test/" + img
    return recognize_knn(img)

if __name__ == "__main__":
    app.run(port=8081,host='0.0.0.0')