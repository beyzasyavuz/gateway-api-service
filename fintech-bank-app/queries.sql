#Musterinin toplam varligi ve hesap ozeti
SELECT
    c.first_name,
    c.last_name,
    a.account_type,
    a.iban,
    a.balance
FROM customers c
JOIN sender_account_id a 
ON c.id = a.customer_id
WHERE c.id = 1;

#Hesap Hareketleri
SELECT 
    t.id AS islem_id,
    t.transaction_type AS islem_tipi,
    t.amount AS tutar,
    t.description AS aciklama,
    t.created_at AS tarih
FROM transactions t
JOIN accounts a ON (t.sender_account_id = a.id OR t.receiver_account_id = a.id)
WHERE a.customer_id = 1
ORDER BY t.created_at DESC;

#En cok harcama yapilan kategori
SELECT 
    description AS harcama_yeri,
    COUNT(*) AS islem_sayisi,
    SUM(amount) AS toplam_harcama
FROM transactions
WHERE sender_account_id = 1 AND transaction_type = 'CARD_PAYMENT'
GROUP BY description
ORDER BY toplam_harcama DESC
LIMIT 5;