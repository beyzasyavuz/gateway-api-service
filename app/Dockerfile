#Python kodlarinin standart bir ortamda calismasi icin Docker'a verilen kutulama talimatlari:

FROM python:3.11-slim
WORKDIR /app

#Sadece requirements.txt'yi kopyalayip kurmak icin(cache optimizasyonu)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Tum kodlari kopyala 
COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]