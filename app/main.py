#Uygulamamızın kendisi. Tarayicidan girdigimizde bize "Gateway API Service aktif!" yanitini donecek.

from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    #Hangi sunucunun cevap verdigini anlamak icin(ileride yapacagımız load balancer testi icin)
    server_id = os.getenv("HOSTNAME","Bilinmeyen Sunucu")
    return {
        "status": "success",
        "message": "Gateway API Service aktif!",
        "server": server_id
    }

@app.get("/health")
def health_check():
    #DevOps sistemlerinin sunucunun cokup cokmedigini anlamasi icin
    return {"status":"healthy"}