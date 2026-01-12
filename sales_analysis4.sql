

select sum(adet) as 'TOPLAM SATIÞ ADEDÝ' from satisverileri

/* ürünleri gruplandýrýp karlarýnýn ne kadar olduðunu buldým*/
select urun_adi,sum(kar_tutari)as TOPLAMKAR
from satisverileri
group by urun_adi
order by TOPLAMKAR desc


/*bölgeleri grulandýrarak hangi bölgede ne kadar kar edilmiþ ona bakacaðým*/

select  bolge,urun_adi, sum(kar_tutari) as Bölge_bazlý_karlar
from satisverileri
group by bolge,urun_adi
order by bolge desc

/*Yukarýdaki sorgunun çýktýsýnda dolayý þunu söylemek mümkün oluyor
Marmara bölgesindeki çalýþma masasý satýþlarýnda yapýlan %20'lik yüksek indirim oraný
operasyonel maliyetlerin kârý karþýlayamamasýna ve bu satýþtan zarar edilmesine neden olmuþtur.*/

SELECT urun_adi, satis_tutari, adet, indirim_orani, kar_tutari
FROM satisverileri
WHERE urun_adi = 'Çalýþma Masasý' AND bolge = 'Marmara';




SELECT 
    urun_adi, 
    SUM(satis_tutari) AS Toplam_Ciro,
    SUM(kar_tutari) AS Toplam_Kar,
    (SUM(kar_tutari) / SUM(satis_tutari)) * 100 AS Ortalama_Kar_Marji
FROM satisverileri
GROUP BY urun_adi
ORDER BY Toplam_Kar DESC;