CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR (50) NOTTT NULL,
    tc_kn VARCHAR(11) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    customer_İD INT REFERENCES customers(id) ON DELETE CASCADE,
    iban VARCHAR(34) UNIQUE NOT NULL,
    account_type VARCHAR(10) CHECK (account_type IN ('TL','USD', 'EUR', 'GOLD')),
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Hesap Hareketleri Tablosu (Hesaplara Bağlı)
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    sender_account_id INT REFERENCES accounts(id,)
    receiver_acount_id INT REFERENCES accounts(id,)
    amount DECIMAL(15,2) NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('TRANSFER', 'EFT', 'FAST', 'CARD_PAYMENT')),
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (first_name, last_name, tc_kn) 
VALUES 
('Yavuz', 'Yılmaz', '12345678901'),
('Ayşe', 'Kaya', '98765432109'),
('Murat', 'Şahin', '55544433322'),
('Selin', 'Aydın', '99988877711'),
('Can', 'Demir', '45678912305'),
('Burak', 'Öztürk', '22334455667'),
('Gözde', 'Yıldız', '33445566778'),
('Oğuz', 'Karan', '44556677889'),
('Deniz', 'Sarı', '55667788990'),
('Kaan', 'Vural', '66778899002'),
('Seda', 'Soylu', '77889900113')
('Mert', 'Korkmaz', '88990011224'),
('Aslı', 'Güneş', '99001122335'),
('Onur', 'Turan', '10112233446'),
('Büşra', 'Yıldırım', '21223344557'),
('Tarkan', 'Alkan', '32334455668'),
('Ceren', 'Koç', '43445566779'),
('Hakan', 'Özdemir', '54556677880'),
('Ezgi', 'Yılmaz', '65667788991');

INSERT INTO accounts (customer_id, iban, account_type, balance) 
VALUES 
(1, 'TR12 0006 1000 0000 1111 2222 01', 'TL', 248500.00),
(1, 'TR12 0006 1000 0000 1111 2222 02', 'USD', 4200.50),
(1, 'TR12 0006 1000 0000 1111 2222 03', 'GOLD', 15.00),
(2, 'TR99 0001 5000 0000 3333 4444 01', 'TL', 85000.00),
(2, 'TR99 0001 5000 0000 3333 4444 02', 'EUR', 1200.00),
(3, 'TR55 0003 2000 0000 5555 6666 01', 'TL', 12500.00),
(5, 'TR11 0008 3000 0000 9999 0000 01', 'TL', 52000.00),
(6, 'TR22 0009 4000 0000 1111 0000 01', 'TL', 18500.00),
(7, 'TR33 0005 1000 0000 2222 1111 01', 'TL', 94000.00),
(8, 'TR44 0005 2000 0000 3333 2222 01', 'USD', 6100.00),
(9, 'TR55 0001 1000 0000 4444 1111 01', 'TL', 142000.00),
(10, 'TR66 0001 2000 0000 5555 2222 01', 'EUR', 3400.00),
(11, 'TR77 0002 1000 0000 6666 3333 01', 'TL', 28500.00),
(12, 'TR88 0002 2000 0000 7777 4444 01', 'USD', 8900.00),
(13, 'TR99 0003 1000 0000 8888 5555 01', 'TL', 67000.00),
(14, 'TR00 0004 1000 0000 9999 6666 01', 'GOLD', 42.00);
(15, 'TR11 0005 1000 0000 1234 5678 01', 'TL', 510000.00),
(16, 'TR22 0005 2000 0000 2345 6789 01', 'USD', 14500.00),
(17, 'TR33 0006 1000 0000 3456 7890 01', 'TL', 34000.00),
(18, 'TR44 0006 2000 0000 4567 8901 01', 'EUR', 8200.00),
(19, 'TR55 0007 1000 0000 5678 9012 01', 'GOLD', 120.00),
(20, 'TR66 0007 2000 0000 6789 0123 01', 'TL', 89000.00),
(21, 'TR77 0008 1000 0000 7890 1234 01', 'TL', 175000.00),
(22, 'TR88 0008 2000 0000 8901 2345 01', 'USD', 3100.00)

INSERT INTO transactions (sender_account_id, receiver_account_id, amount, transaction_type, description) 
VALUES 
(1, 4, 12500.00, 'FAST', 'Kira Ödemesi'),
(1, 6, 450.00, 'TRANSFER', 'Aksam Yemegi Borcu'),
(4, 1, 85000.00, 'EFT', 'MaaS Odemesi'),
(1, NULL, 1250.00, 'CARD_PAYMENT', 'Trendyol Online Alisveris'),
(1, NULL, 320.00, 'CARD_PAYMENT', 'Starbucks Coffee'),
(1, NULL, 1850.00, 'CARD_PAYMENT', 'İSKİ & İGDAŞ Fatura Odemesi'),
(1, NULL, 4200.00, 'CARD_PAYMENT', 'Ajet Ucak Bileti'),
(4, 6, 2500.00, 'FAST', 'Egitim Kurs Ucreti'),
(6, 4, 150.00, 'FAST', 'Kahve Ismarlama'),
(1, NULL, 650.00, 'CARD_PAYMENT', 'Decathlon Spor Alışverişi'),
(1, NULL, 2400.00, 'CARD_PAYMENT', 'Marmaray & İSDOĞAZ Kart Dolumu'),
(1, NULL, 120.00, 'CARD_PAYMENT', 'Steam Oyun Alımı'),
(5, 1, 3200.00, 'FAST', 'Danışmanlık Hizmet Bedeli'),
(1, 6, 800.00, 'FAST', 'Doğum Günü Hediye Payı')
(1, NULL, 340.00, 'CARD_PAYMENT', 'Mikel Coffee'),
(1, NULL, 1850.00, 'CARD_PAYMENT', 'Amazon Turkey Online'),
(1, NULL, 620.00, 'CARD_PAYMENT', 'Macrocenter Market'),
(1, NULL, 2800.00, 'CARD_PAYMENT', 'Beymen Club Giyim'),
(1, NULL, 150.00, 'CARD_PAYMENT', 'EspressoLab'),
(1, NULL, 89.00, 'CARD_PAYMENT', 'Apple iCloud Depolama'),
(1, NULL, 4500.00, 'CARD_PAYMENT', 'Vatan Bilgisayar Ekipman'),
(9, 1, 18500.00, 'FAST', 'Yazılım Danışmanlık Hakediş'),
(10, 1, 7500.00, 'EFT', 'Tasarım Reklam Telif Ödemesi'),
(1, 11, 1400.00, 'FAST', 'Aksu Restoran Hesap Paylaşımı'),
(1, 12, 3000.00, 'FAST', 'Yurtdışı Otel Rezervasyon'),
(13, 1, 950.00, 'FAST', 'Etkinlik Bilet Transferi'),
(1, NULL, 1200.00, 'CARD_PAYMENT', 'Petrol Ofisi Yakıt Alımı'),
(1, NULL, 480.00, 'CARD_PAYMENT', 'Cinemaximum Bilet'),
(1, NULL, 3100.00, 'CARD_PAYMENT', 'İKEA Ev Dekorasyon')
(1, NULL, 540.00, 'CARD_PAYMENT', 'Mikel Coffee'),
(1, NULL, 3200.00, 'CARD_PAYMENT', 'Apple App Store Satın Alım'),
(1, NULL, 780.00, 'CARD_PAYMENT', 'Migros Jet Market'),
(1, NULL, 15000.00, 'CARD_PAYMENT', 'Teknosa Macbook Aksesuar'),
(1, NULL, 450.00, 'CARD_PAYMENT', 'CarrefourSA'),
(1, NULL, 230.00, 'CARD_PAYMENT', 'Kahve Dünyası Takeaway'),
(1, NULL, 8900.00, 'CARD_PAYMENT', 'THY Yurt Dışı Uçak Bileti'),
(1, NULL, 1250.00, 'CARD_PAYMENT', 'Decathlon Kamp Malzemeleri'),
(15, 1, 45000.00, 'EFT', 'Yıllık Bonus Ödemesi'),
(16, 1, 12000.00, 'FAST', 'Serbest Danışmanlık Proje Hakediş'),
(1, 17, 3500.00, 'FAST', 'Ortak Tatil Evi Paylaşımı'),
(1, 18, 2200.00, 'FAST', 'Düğün Hediye Gönderimi'),
(19, 1, 1500.00, 'FAST', 'İkinci El Laptop Satış Bedeli'),
(1, NULL, 420.00, 'CARD_PAYMENT', 'Oat Milk Latte & Bakery'),
(1, NULL, 1850.00, 'CARD_PAYMENT', 'Shell V-Power Yakıt'),
(1, NULL, 650.00, 'CARD_PAYMENT', 'D&R Kitap & Hobi'),
(1, NULL, 3400.00, 'CARD_PAYMENT', 'Airbnb Konaklama'),
(1, NULL, 850.00, 'CARD_PAYMENT', 'Uber VIP Yolculuk'),
(1, NULL, 290.00, 'CARD_PAYMENT', 'Steam Summer Sale Oyunlar'),
(21, 1, 9800.00, 'EFT', 'Mobil Uygulama Arayüz Tasarım Ücreti');