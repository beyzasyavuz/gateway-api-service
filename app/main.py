#Uygulamamızın kendisi. Tarayicidan girdigimizde bize "Gateway API Service aktif!" yanitini donecek.

from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
import os

app = FastAPI()

# Prometheus Metrik Toplayıcıyı Başlat
Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
    #Hangi sunucunun cevap verdigini anlamak icin(ileride yapacagımız load balancer testi icin)
    server_id = os.getenv("HOSTNAME","Bilinmeyen Sunucu")
    return {
        "status": "success",
        "message": "Gateway API Service v1.0 - CI/CD Pipeline aktif!",
        "server": server_id
    }

@app.get("/health")
def health_check():
    #DevOps sistemlerinin sunucunun cokup cokmedigini anlamasi icin
    return {"status":"healthy"}