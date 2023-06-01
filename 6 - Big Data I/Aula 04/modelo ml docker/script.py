import numpy as np
import pandas as pd
from fastapi import FastAPI
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

iris = pd.read_csv('iris.csv')

X = iris.iloc[:, :4]
y = iris.iloc[:, 4]

# separa os dados em treino e teste
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

model = RandomForestClassifier()

# treina o modelo
model.fit(X_train, y_train)

# faz a previsão nos dados de teste
y_pred = model.predict(X_test)

# avalia a precisão do modelo
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)


# cria a aplicação FastAPI
app = FastAPI()

# define o endpoint para a previsão
@app.post("/predict")
def predict(x1: int, x2: int, x3: int, x4: int):

    # transforma a entrada em um array numpy
    X = np.array([[x1, x2, x3, x3]])

    # faz a previsão usando o modelo treinado
    prediction = model.predict(X)[0]

    # retorna a espécie prevista como uma resposta da API
    return {"especie": prediction}