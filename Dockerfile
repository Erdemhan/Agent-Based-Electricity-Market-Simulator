# 1. Python image'ı ile başla
FROM python:3.12

# 2. Gerekli paketleri yükle (CRLF düzeltme için dos2unix dahil)
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# 3. Çalışma dizini ayarla
WORKDIR /usr/src/app

# 4. Gereken dosyaları kopyala
COPY requirements.txt ./

# 5. Bağımlılıkları yükle
RUN pip install --no-cache-dir -r requirements.txt

# 6. Ekstra bağımlılıkları yükle (isteğe bağlı ama belirttiğin için ekliyorum)
RUN pip install matplotlib pandas pyyaml altair gunicorn

# 7. Uygulama dosyalarını kopyala
COPY . .

# 8. Tüm .py dosyalarının satır sonlarını LF formatına çevir (önemli)
RUN find . -name "*.py" -exec dos2unix {} \;

# 9. Opsiyonel: statik dosyaları topla (eğer static dosya yönetimi varsa)
# RUN python manage.py collectstatic --noinput

# 10. Django server'ı başlat
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
