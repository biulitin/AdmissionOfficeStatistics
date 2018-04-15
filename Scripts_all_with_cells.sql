select 
	SP.sp_Name as c1_1v3_5, 
	KL.kl_name as c2_2v3_5,
	'Подано заявлений' as c3_3v_3_3,
	'Зачислено' as c3_3v4_4,
	'План приема' as c3_3v_5_5,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name)) as c4_4v3_3,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1)) as c5_5v3_3,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2)) as c6_6v3_3, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')) as c7_7v3_3, 
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l1_id>0)) as c8_8v3_3, 
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l_id>0)) as c9_9v3_3,
	0 as c10_10v3_3, 
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l2_id>0)) as c11_11v3_3,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and not exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))))) as c12_12v3_3, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))))) as c13_13v3_3,
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%высшее%')) as c14_14v3_3, 
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%среднее проф%')) as c15_15v3_3, 
	
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and (AbitSp.z>0 or AbitSp.z_2014>0))) as c4_4v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 and (AbitSp.z>0 or (AbitSp.z_2014>0 and AbitSp.z_2014<7)))) as c5_5v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 and (AbitSp.z>0 or AbitSp.z_2014=7))) as c6_6v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '') and (AbitSp.z=1 or AbitSp.z_2014=4)) as c7_7v4_4,
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l1_id>0) and (AbitSp.z=1 or AbitSp.z_2014=4)) as c8_8v4_4,
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l_id>0) and (AbitSp.z=1 or AbitSp.z_2014=4)) as c9_9v4_4, 
	0 as c10_10v4_4, 
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l2_id>0) and (AbitSp.z>0 or AbitSp.z_2014>0)) as c11_11v4_4,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and not exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))) as c12_12v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))) as c13_13v4_4,
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%высшее%' and (AbitSp.z>0 or AbitSp.z_2014>0))) as c14_14v4_4, 
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%среднее проф%' and (AbitSp.z>0 or AbitSp.z_2014>0))) as c15_15v4_4, 

	PP.Qo + PP.F as c4_4v5_5,
	PP.Qo as c5_5v5_5,
	PP.F as c6_6v5_5,
	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.kl_id = KL.kl_id and PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')) as c7_7v5_5 

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;

select 
	SP.sp_Name as c1_1v2_2,	
	SP.sp_C as c2_2v2_2,
	(select count(*) from AbitSp where AbitSp.sp_id = SP.sp_id) as c3_3v2_2,
	(select count(*) FROM AbitSp where (AbitSp.sp_id = SP.sp_id) and (AbitSp.z=1 or AbitSp.z_2014=4)) as c4_4v2_2 
from Speciality SP, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and isNULL(SP.sp_C,'') != '')
order by SP.sp_Name, SP.sp_C;

SELECT 
  SP.sp_Name AS c1_1v3_6,
  KL.kl_name AS c2_2v3_6,

  'бюджет' AS c3_3v3_4,
  'подано заявлений' AS c4_4v3_3,
  (select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1)) AS c5_5v3_3, 
  0 AS c6_6v3_3,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.Gr not like '%Российская Федерация%') AS c7_7v3_3,
  0 AS c8_8v3_3, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd, Ind_Documents WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND AbitInd.aid = AbitSp.aid AND AbitInd.ind_id = Ind_Documents.ind_id and (Ind_Documents.ind_name like '%Диплом%' OR Ind_Documents.ind_name like '%Аттестат%')) AS c9_9v3_3,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region like '%Нижегородская%') AS c10_10v3_3, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region not like '%Нижегородская%') AS c11_11v3_3, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%') AS c12_12v3_3,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%') AS c13_13v3_3,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%') AS c14_14v3_3,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%') AS c15_15v3_3,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL))) AS c16_16v3_3, 
  'зачислено' AS с4_4v4_4,
  (select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 and (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)))) AS c5_5v4_4,
  0 AS c6_6v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.Gr not like '%Российская Федерация%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c7_7v4_4,
  0 AS c8_8v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd, Ind_Documents WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND AbitInd.aid = AbitSp.aid AND AbitInd.ind_id = Ind_Documents.ind_id and (Ind_Documents.ind_name like '%Диплом%' OR Ind_Documents.ind_name like '%Аттестат%') AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c9_9v4_4, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region like '%Нижегородская%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c10_10v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region not like '%Нижегородская%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c11_11v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c12_12v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c13_13v4_4, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c14_14v4_4,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c15_15v4_4, 
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL)) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c16_16v4_4,
  (SELECT isNULL(AVG(minb), 0) FROM AbitSp, Speciality WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c17_17v3_4,
  'платно' AS c3_3v5_6,
  'подано заявлений' AS c4_4v5_5,
  (select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2)) AS c5_5v5_5, 
  0  AS c6_6v5_5, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.Gr not like '%Российская Федерация%') AS c7_7v5_5, 
  0  AS c8_8v5_5,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd, Ind_Documents WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND AbitInd.aid = AbitSp.aid AND AbitInd.ind_id = Ind_Documents.ind_id and (Ind_Documents.ind_name like '%Диплом%' OR Ind_Documents.ind_name like '%Аттестат%')) AS c9_9v5_5, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region like '%Нижегородская%') AS c10_10v5_5,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region not like '%Нижегородская%')  AS c11_11v5_5,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%') AS c12_12v5_5,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%')  AS c13_13v5_5,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%') AS c14_14v5_5, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%')  AS c15_15v5_5, 
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL))) AS c16_16v5_5,
  'зачислено' AS с4_4v6_6,
  (select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 and (AbitSp.z>0 or AbitSp.z_2014=7))) AS с5_5v6_6,
  0  AS с6_6v6_6,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.Gr not like '%Российская Федерация%' AND (AbitSp.z>0 or AbitSp.z_2014=7))  AS с7_7v6_6, 
  0  AS с8_8v6_6,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd, Ind_Documents WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND AbitInd.aid = AbitSp.aid AND AbitInd.ind_id = Ind_Documents.ind_id and (Ind_Documents.ind_name like '%Диплом%' OR Ind_Documents.ind_name like '%Аттестат%') AND (AbitSp.z>0 or AbitSp.z_2014=7))  AS с9_9v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region like '%Нижегородская%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с10_10v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.Gr like '%Российская Федерация%' AND Abit.Region not like '%Нижегородская%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с11_11v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с12_12v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее общее%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с13_13v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y = cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с14_14v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit, Level_edu WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND Abit.leid = Level_edu.leid and Abit.S_Y < cast(year(getdate()) as varchar) AND Level_edu.leName like '%реднее профф%' AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с15_15v6_6, 
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL)) AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с16_16v6_6,
  (SELECT AVG(minb) FROM AbitSp, Speciality WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS с17_17v5_6

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;

select 
	SP.sp_Name AS c1_1v4_4,
	KL.kl_name AS c2_2v4_4, 
	PP.Qo + PP.F AS c3_3v4_4,
	PP.Qo AS c4_4v4_4,
	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.kl_id = KL.kl_id and PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')) AS c5_5v4_4, 
	PP.F AS c6_6v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name)) AS c7_7v4_4,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1)) AS c8_8v4_4,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')) AS c9_9v4_4,
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2)) AS c10_10v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and (AbitSp.z>0 or AbitSp.z_2014>0)))  AS c11_11v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 and (AbitSp.z>0 or (AbitSp.z_2014>0 and AbitSp.z_2014<7))))  AS c12_12v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '') and (AbitSp.z=1 or AbitSp.z_2014=4))  AS c13_13v4_4, 
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 and (AbitSp.z>0 or AbitSp.z_2014=7))) AS c14_14v4_4 

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;


select
	SP.sp_Name AS c1_1v3_3,	
	KL.kl_name AS c2_2v3_3,	
	AAI.ai_name AS c3_3v3_3,
	E.ex_Name AS c4_4v3_3,		
	(select count(*) from Speciality, AbitSp, AbitAddInfo where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name and exists (select * from AbitEGE where AbitSp.aid = AbitEGE.aid and AbitEGE.m100b > 0 and AbitEGE.ex_id = E.ex_id))) AS c5_5v3_3,
	(select count(*) from Speciality, AbitSp, AbitAddInfo where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name and exists (select * from AbitEGE where AbitSp.aid = AbitEGE.aid and AbitEGE.m100b > 0 and AbitEGE.ex_id = E.ex_id) and (AbitSp.z > 0 or AbitSp.z_2014 > 0)))  AS c6_6v3_3

from Speciality SP, KindLearn KL, 
	(select distinct AbitAddInfo.ai_name from AbitAddInfo) as AAI, Exam E where 
		isNULL(SP.sp_C,'') = ''
	and E.ex_Name not like 'Русский%'
	and exists (select * from AbitSp, AbitAddInfo where AbitSp.sp_id = SP.sp_id and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name)
order by SP.sp_Name, KL.kl_name, AAI.ai_name, E.ex_Name;


select 
	SP.sp_Name AS c1_1v3_3,
	KL.kl_name AS c2_2v3_3,	
	LG.fName AS c3_3v3_3,	
	(select count(*) from Abit, AbitSp where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l1_id = LG.fid))  AS c4_4v3_3, 
	(select count(*) from Abit, AbitSp where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l1_id = LG.fid) and (AbitSp.z=1 or AbitSp.z_2014=4)) AS c5_5v3_3

from Speciality SP, KindLearn KL, PlanPr PP, Lgot1 LG where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name, LG.fName;


select
	SP.sp_Name AS c1_1v2_2,
	Region AS c2_2v2_2,

	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	))  AS c3_3v2_2,
	(select count(*) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	)) AS c4_4v2_2,
	(select count(*) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	) and (AbitSp.z = 1 or AbitSp.z_2014 = 4))  AS c5_5v2_2,
	(select isNULL(min((minb + ind_ball)), 0) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	) and (AbitSp.z = 1 or AbitSp.z_2014 = 4))  AS c6_6v2_2

from Speciality SP, (select distinct Region from Abit) as R where (
		isNULL(SP.sp_C,'') = ''
	and R.Region not in ('нет', '')
	and exists (select * from Speciality, PlanPr where (Speciality.sp_id = PlanPr.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	)))
order by SP.sp_Name, R.Region;


SELECT 
	SP.sp_Name  AS c1_1v3_3,
	KL.kl_name  AS c2_2v3_3, 

	(select isNULL(min((minb + ind_ball)), 0) from Speciality, AbitSp where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))))  AS c3_3v3_3, 
	(select isNULL(min((minb + ind_ball)), 0) from Speciality, AbitSp where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 AND (AbitSp.z>0 OR AbitSp.z_2014=7))) AS c4_4v3_3

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;


SELECT 
  SP.sp_Name  AS c1_1v4_5, 
  'бюджет' AS c2_2v4_4,
  (SELECT SUM(Qo) FROM PlanPr, Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id) AS c3_3v4_4,
  (SELECT SUM(Lg) FROM PlanPr,Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id)  AS c4_4v4_4,
  (SELECT SUM(Qo) FROM PlanPr, Speciality WHERE KL.kl_id = PlanPr.kl_id AND PlanPr.sp_id = Speciality.sp_id AND isNULL(Speciality.sp_C,'') != '' AND Speciality.sp_Name = SP.sp_Name AND KL.kl_id = PlanPr.kl_id) AS c5_5v4_4,
  (SELECT SUM(Qo) FROM PlanPr,Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id) - (SELECT SUM(Lg) FROM PlanPr, Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id) - (SELECT SUM(Qo) FROM PlanPr, Speciality WHERE PlanPr.sp_id = Speciality.sp_id AND KL.kl_id = PlanPr.kl_id AND isNULL(Speciality.sp_C,'') != '' AND Speciality.sp_Name = SP.sp_Name AND KL.kl_id = PlanPr.kl_id)  AS c6_6v4_4,
  'коммерция' AS c2_2v5_5,
  (SELECT SUM(F) FROM PlanPr, Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id) AS c3_3v5_5,
  (SELECT SUM(F) FROM PlanPr, Speciality WHERE SP.sp_Name = Speciality.sp_Name AND Speciality.sp_id = PlanPr.sp_id AND KL.kl_id = PlanPr.kl_id)  AS c6_6v5_5

   FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id  
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');


SELECT 
  SP.sp_Name AS c1_1v6_7,  
  'бюджет' AS c2_2v6_6,
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000')  AS c3_3v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND l_id>0) AS c4_4v6_6,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND l1_id>0)  AS c5_5v6_6, 
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND isNULL(SP.sp_C,'') != '') AS c6_6v6_6, 
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000')-
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND l_id>0)-
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND l1_id>0)-
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data<='26.07.2017 0:00:00.000' AND isNULL(SP.sp_C,'') != '')  AS c7_7v6_6, 
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=1 AND AbitSp.d_data>'26.07.2017 0:00:00.000')  AS c8_8v6_6,
  'коммерция'  AS c2_2v7_7,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=2 AND AbitSp.d_data<='26.07.2017 0:00:00.000') AS c3_3v7_7,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=2 AND AbitSp.d_data<='26.07.2017 0:00:00.000') AS c7_7v7_7,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_Name = SP.sp_Name AND f=2 AND AbitSp.d_data>'26.07.2017 0:00:00.000')  AS c8_8v7_7
   FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id  
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');


SELECT 
  SP.sp_Name  AS c1_1v8_9, 
  'бюджет' AS c2_2v8_8,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)))  AS c3_3v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND SP.sp_id = AbitSp.sp_id AND AbitSp.f = 1 AND Abit.l_id > 0 AND Lgot.fid = Abit.l_id AND Lgot.fName LIKE '%Всерос%' AND (z=1 OR z_2014=4))  AS c4_4v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND SP.sp_id = AbitSp.sp_id AND AbitSp.f = 1 AND Abit.l_id > 0 AND Lgot.fid = Abit.l_id AND Lgot.fName LIKE '%всеукр%' AND (z=1 OR z_2014=4))  AS c5_5v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND SP.sp_id = AbitSp.sp_id AND AbitSp.f = 1 AND Abit.l_id > 0 AND Lgot.fid = Abit.l_id AND (Lgot.fName NOT LIKE '%Всерос%' AND  Lgot.fName NOT LIKE '%всеурк%' AND Lgot.fName NOT LIKE '%олимп* игр%') AND (z=1 OR z_2014=4))  AS c6_6v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND SP.sp_id = AbitSp.sp_id AND AbitSp.f = 1 AND Abit.l_id > 0 AND Lgot.fid = Abit.l_id AND Lgot.fName LIKE '%олимп* игр%' AND (z=1 OR z_2014=4))  AS c7_7v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND SP.sp_id = AbitSp.sp_id AND AbitSp.f = 1 AND Abit.l1_id > 0 AND (z=1 OR z_2014=4))  AS c8_8v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit, Lgot, Speciality WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND isNULL(Speciality.sp_C,'') = '' AND (z=1 OR z_2014=4))  AS c9_9v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id  AND AbitSp.f = 1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c13_13v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0))  AS c14_14v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0))  AS c15_15v8_8, 
  'коммерция' AS c2_2v9_9,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND (AbitSp.z>0 or AbitSp.z_2014=7)) AS c3_3v9_9,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id  AND AbitSp.f = 2 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 or AbitSp.z_2014=7))  AS c13_13v9_9, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid = AbitSp.aid AND KL.kl_id = AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 or AbitSp.z_2014=7) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0))  AS c14_14v9_9, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (Abit.l1_id = 0 OR Abit.l1_id IS NULL) AND (AbitSp.z>0 or AbitSp.z_2014=7) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0))  AS c15_15v9_9

 FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id  
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');
	
SELECT 
  SP.sp_Name  AS c1_1v8_9, 
  'бюджет'AS c2_2v8_8,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND f=1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS c3_3v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Speciality, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND f=1 AND Abit.l_id>0 AND (AbitSp.z=1 OR AbitSp.z_2014=4)) AS c4_4v8_8, 			
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND Abit.l1_id>0 AND (AbitSp.z=1 OR AbitSp.z_2014=4))  AS c5_5v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND Abit.l1_id>0 AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE Abit.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != ''))) AS c6_6v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND Abit.l1_id>0 AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND EXISTS(SELECT * FROM AbitEGE WHERE Abit.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND EXISTS(SELECT * FROM AbitEGE WHERE Abit.aid = AbitEGE.aid AND isNULL(y_ege,'') != ''))  AS c7_7v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND Abit.l1_id>0 AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND EXISTS(SELECT * FROM AbitEGE WHERE Abit.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != ''))) AS c8_8v8_8,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND isNULL(Speciality.sp_C,'') != '' AND (AbitSp.z=1 OR AbitSp.z_2014=4)) AS c9_9v8_8,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND isNULL(Speciality.sp_C,'') != '' AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != ''))) AS c10_10v8_8, 
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND isNULL(Speciality.sp_C,'') != '' AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '') OR isNULL(d_ex,'') != '') AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND isNULL(y_ege,'') != '')) AS c11_11v8_8,
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND isNULL(Speciality.sp_C,'') != '' AND (AbitSp.z=1 OR AbitSp.z_2014=4) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '') OR isNULL(d_ex,'') != '')) AS c12_12v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)))  AS c13_13v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0))  AS c14_14v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0)) AS c15_15v8_8, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '') OR isNULL(d_ex,'') != '') AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND isNULL(y_ege,'') != '')) AS c16_16v8_8,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=1 AND (Abit.l_id = 0 OR Abit.l_id IS NULL) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '') OR isNULL(d_ex,'') != '')) AS c17_17v8_8,
  'коммерция'  AS c2_2v9_9,
   (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = Speciality.sp_id AND SP.sp_Name = Speciality.sp_Name AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7)) AS c3_3v9_9, 
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7)) AS c13_13v9_9,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0)) AS c14_14v9_9,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7) AND NOT EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND AbitEGE.m100b > 0)) AS c15_15v9_9,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND isNULL(y_ege,'') != '')) AS c16_16v9_9,
  (SELECT COUNT(DISTINCT(Abit.aid)) FROM AbitSp, Abit WHERE Abit.aid=AbitSp.aid AND KL.kl_id=AbitSp.kl_id AND AbitSp.sp_id = SP.sp_id AND f=2 AND (AbitSp.z>0 OR AbitSp.z_2014=7) AND EXISTS(SELECT * FROM AbitEGE WHERE AbitSp.aid = AbitEGE.aid AND (isNULL(gr,'') != '' OR isNULL(d_ex,'') != '')))  AS c17_17v9_9 
   FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id  
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');