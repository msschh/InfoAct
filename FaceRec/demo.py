import math
from sklearn import neighbors
import os
import os.path
import pickle
from PIL import Image, ImageDraw
import face_recognition
from face_recognition.face_recognition_cli import image_files_in_folder

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}


def predict(X_img_path, model_path=None):
    if not os.path.isfile(X_img_path) or os.path.splitext(X_img_path)[1][1:] not in ALLOWED_EXTENSIONS:
        raise Exception("Invalid image path: {}".format(X_img_path))

    if knn_clf is None and model_path is None:
        raise Exception("Must supply knn classifier either thourgh knn_clf or model_path")

    with open(model_path, 'rb') as f:
        knn_clf = pickle.load(f)

    X_img = face_recognition.load_image_file(X_img_path)
    X_face_locations = face_recognition.face_locations(X_img)
    faces_encodings = face_recognition.face_encodings(X_img, known_face_locations=X_face_locations);

    if len(X_face_locations) != 1:
        return "unkown"

    return knn_clf.predict(faces_encodings)[0]


if __name__ == "__main__":
    model_path="trained_knn_model.clf"
    #img = "ChrisHemsworth.jpg"
    #img = "KitHarington.jpg"
    img = "EmiliaClarke.jpg"

    name = predict(img, model_path=model_path)
    print(name)
