/* !!! ------ ВНУТРЕННЯЯ СТАТИСТИКА ------ !!! */
/*---------------------------------------------*/

--1_Обобщенная по приему
select 
	SP.sp_Name, --специальность
	KL.kl_name, --форма обучения
	
	--ПОДАНО
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name)), --всего подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1)), --на бюджет подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2)), --по договорам подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')), --по целевым подано
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l1_id>0)), --квотники подано
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l_id>0)), --БВИ подано
	0, --Вне конкурса подано
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l2_id>0)), --с преимуществом подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and not exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))))), --по ЕГЭ подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))))), --по экз. ВУЗа подано
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%высшее%')), --с ВО подано
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%среднее проф%')), --с СПО подано
	
	--ЗАЧИСЛЕНО
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and (AbitSp.z>0 or AbitSp.z_2014>0))), --всего зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 and (AbitSp.z>0 or (AbitSp.z_2014>0 and AbitSp.z_2014<7)))), --на бюджет зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 and (AbitSp.z>0 or AbitSp.z_2014=7))), --по договорам зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '') and (AbitSp.z=1 or AbitSp.z_2014=4)), --по целевым зачислено
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l1_id>0) and (AbitSp.z=1 or AbitSp.z_2014=4)), --квотники зачислено
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and AbitSp.f = 1 and Abit.l_id>0) and (AbitSp.z=1 or AbitSp.z_2014=4)), --БВИ зачислено
	0, --Вне конкурса зачислено
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l2_id>0) and (AbitSp.z>0 or AbitSp.z_2014>0)), --с преимуществом зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and not exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))), --по ЕГЭ зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))), --по экз. ВУЗа зачислено
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%высшее%' and (AbitSp.z>0 or AbitSp.z_2014>0))), --с ВО зачислено
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%среднее проф%' and (AbitSp.z>0 or AbitSp.z_2014>0))), --с СПО зачислено

	--ПЛАН ПРИЕМА
	PP.Qo + PP.F, --ПП всего
	PP.Qo, --ПП бюджет
	PP.F, --ПП по договорам
	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.kl_id = KL.kl_id and PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')) --ПП поцелевым местам

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;


--2_По целевым организациям
select 
	SP.sp_Name,	--специальность
	SP.sp_C,	--название организации
	(select count(*) from AbitSp where AbitSp.sp_id = SP.sp_id), --подано 
	(select count(*) FROM AbitSp where (AbitSp.sp_id = SP.sp_id) and (AbitSp.z=1 or AbitSp.z_2014=4)) --зачислено
from Speciality SP, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and isNULL(SP.sp_C,'') != '')
order by SP.sp_Name, SP.sp_C;

--3_Обобщенная по приему+УчЗ
SELECT 
  SP.sp_Name, --специальность
  KL.kl_name, --форма обучения
  --БЮДЖЕТ
  --подано заявлений
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1) AS призеры, --призеры олипиад
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, KindLearn, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.Gr != 'Российская Федерация'), --РАБОТАЕТ НЕПРАВИЛЬНО, УСЛОВИЕ С РФ НЕ СРАБАТЫВАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND AbitInd.aid = AbitSp.aid AND (ind_nd = 'Диплом' OR ind_nd='Аттестат о среднем (полном) общем образовании, золотая медаль')), --с дипломом или золотой медалью
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region = 'Нижегородская область'),--из Нижегородской Области,  УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region != 'Нижегородская область'),--не из Нижегородской Области,  УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 1), -- Лица, окончившие   общеобразовательные учреждения в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 1), -- Лица, окончившие   общеобразовательные учреждения до текущего года
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 2), -- Лица, окончившие   учреждения СПО в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 2), --Лица, окончившие   учреждения СПО до текущего года
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL))), --Лица, поступающие по результатам вступительных испытаний ВУЗа
  --зачислено
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))) AS призеры,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, KindLearn, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.Gr != 'Российская Федерация' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --РАБОТАЕТ НЕПРАВИЛЬНО, УСЛОВИЕ С РФ НЕ СРАБАТЫВАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND AbitInd.aid = AbitSp.aid AND (ind_nd = 'Диплом' OR ind_nd='Аттестат о среднем (полном) общем образовании, золотая медаль') AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --с дипломом или золотой медалью
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region = 'Нижегородская область' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), -- из Нижегородской Области, УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region != 'Нижегородская область' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --не из Нижегородской Области, УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 1  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Лица, окончившие   общеобразовательные учреждения в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 1  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Лица, окончившие   общеобразовательные учреждения до текущего года
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 2  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Лица, окончившие   учреждения СПО в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 2  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Лица, окончившие   учреждения СПО до текущего года
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 1 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL)) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Лица, поступающие по результатам вступительных испытаний ВУЗа
 
  (SELECT AVG(minb) FROM AbitSp, Speciality WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name=Speciality.sp_Name AND f=1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --Средний балл зачисленных
 --ПЛАТНО
   --подано заявлений
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2) AS призеры, --призеры олипиад
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, KindLearn, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.Gr != 'Российская Федерация'), --РАБОТАЕТ НЕПРАВИЛЬНО, УСЛОВИЕ С РФ НЕ СРАБАТЫВАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND AbitInd.aid = AbitSp.aid AND (ind_nd = 'Диплом' OR ind_nd='Аттестат о среднем (полном) общем образовании, золотая медаль')), --с дипломом или золотой медалью
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region = 'Нижегородская область'),--из Нижегородской Области,  УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region != 'Нижегородская область'),--не из Нижегородской Области,  УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 1), -- Лица, окончившие   общеобразовательные учреждения в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 1), -- Лица, окончившие   общеобразовательные учреждения до текущего года
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 2), -- Лица, окончившие   учреждения СПО в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 2), --Лица, окончившие   учреждения СПО до текущего года
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name  AND AbitSp.f = 2 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL))), --Лица, поступающие по результатам вступительных испытаний ВУЗа
  --зачислено
  (SELECT COUNT(*) FROM Speciality, AbitSp WHERE AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))) AS призеры,
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, KindLearn, Abit WHERE Abit.aid = AbitSp.aid AND AbitSp.sp_id = Speciality.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.Gr != 'Российская Федерация' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --РАБОТАЕТ НЕПРАВИЛЬНО, УСЛОВИЕ С РФ НЕ СРАБАТЫВАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, AbitInd WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND AbitInd.aid = AbitSp.aid AND (ind_nd = 'Диплом' OR ind_nd='Аттестат о среднем (полном) общем образовании, золотая медаль') AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --с дипломом или золотой медалью
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region = 'Нижегородская область' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), -- из Нижегородской Области, УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND  Abit.Gr = 'Российская Федерация' AND Abit.Region != 'Нижегородская область' AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --не из Нижегородской Области, УСЛОВИЕ С РФ НЕ РАБОТАЕТ
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 1  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --Лица, окончившие   общеобразовательные учреждения в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 1  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --Лица, окончившие   общеобразовательные учреждения до текущего года
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y = '2017' AND Abit.leid = 2  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --Лица, окончившие   учреждения СПО в текущем году
  (SELECT COUNT(DISTINCT(AbitSp.aid)) FROM Speciality, AbitSp, Abit WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id= AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND Abit.aid = AbitSp.aid AND S_Y < '2017' AND Abit.leid = 2  AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --Лица, окончившие   учреждения СПО до текущего года
  (SELECT COUNT(*) FROM AbitSp, Speciality WHERE KL.kl_id = AbitSp.kl_id AND Speciality.sp_id = AbitSp.sp_id AND SP.sp_Name = Speciality.sp_Name AND AbitSp.f = 2 AND EXISTS(SELECT * FROM AbitEGE WHERE AbitEGE.aid = AbitSp.aid AND (d_ex IS NOT NULL OR gr IS NOT NULL)) AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))), --Лица, поступающие по результатам вступительных испытаний ВУЗа
 
  (SELECT AVG(minb) FROM AbitSp, Speciality WHERE Speciality.sp_id = AbitSp.sp_id AND KL.kl_id = AbitSp.kl_id AND SP.sp_Name=Speciality.sp_Name AND f=1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014=7))) --Средний балл зачисленных

 FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id  
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');

--4_Анкета_по_приему
select 
	SP.sp_Name, --специальность
	KL.kl_name, --форма обучения

	--ПЛАН ПРИЕМА
	PP.Qo + PP.F, --ПП всего
	PP.Qo, --ПП бюджет
	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.kl_id = KL.kl_id and PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')), --ПП поцелевым местам
	PP.F, --ПП по договорам

	--ПОДАНО
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name)), --всего подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1)), --на бюджет подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '')), --по целевым подано
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2)), --по договорам подано

	--ЗАЧИСЛЕНО
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and (AbitSp.z>0 or AbitSp.z_2014>0))), --всего зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 and (AbitSp.z>0 or (AbitSp.z_2014>0 and AbitSp.z_2014<7)))), --на бюджет зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != '') and (AbitSp.z=1 or AbitSp.z_2014=4)), --по целевым зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 and (AbitSp.z>0 or AbitSp.z_2014=7))) --по договорам зачислено

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;


--5_Анкета_БВИ_олимп
select
	SP.sp_Name,		--специальность
	KL.kl_name,		--форма обучения
	AAI.ai_name,	--название олимпиады
	E.ex_Name,		--экзамен (предмет)

	(select count(*) from Speciality, AbitSp, AbitAddInfo where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name and exists (select * from AbitEGE where AbitSp.aid = AbitEGE.aid and AbitEGE.m100b > 0 and AbitEGE.ex_id = E.ex_id))),	--подано
	(select count(*) from Speciality, AbitSp, AbitAddInfo where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name and exists (select * from AbitEGE where AbitSp.aid = AbitEGE.aid and AbitEGE.m100b > 0 and AbitEGE.ex_id = E.ex_id) and (AbitSp.z > 0 or AbitSp.z_2014 > 0))) --зачислено

from Speciality SP, KindLearn KL, 
	(select distinct AbitAddInfo.ai_name from AbitAddInfo) as AAI, Exam E where 
		isNULL(SP.sp_C,'') = ''
	and E.ex_Name not like 'Русский%'
	and exists (select * from AbitSp, AbitAddInfo where AbitSp.sp_id = SP.sp_id and AbitSp.kl_id = KL.kl_id and AbitSp.aid = AbitAddInfo.aid and AbitAddInfo.ai_name = AAI.ai_name)
order by SP.sp_Name, KL.kl_name, AAI.ai_name, E.ex_Name;

--6_Анкеты_квоты
select 
	SP.sp_Name,	--специальность
	KL.kl_name,	--форма обучения
	LG.fName,		--категория квоты
	(select count(*) from Abit, AbitSp where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l1_id = LG.fid)), --подано
	(select count(*) from Abit, AbitSp where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l1_id = LG.fid) and (AbitSp.z=1 or AbitSp.z_2014=4)) --зачислено

from Speciality SP, KindLearn KL, PlanPr PP, Lgot1 LG where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name, LG.fName;


--7_Анкета_целевики
select
	SP.sp_Name,
	Region,

	(select isNULL(sum(Qo), 0) from PlanPr, Speciality where (PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	)), --план приема
	(select count(*) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	)), --подано
	(select count(*) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	) and (AbitSp.z = 1 or AbitSp.z_2014 = 4)), --зачислено
	(select isNULL(min((minb + ind_ball)), 0) from AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and Speciality.sp_C like 
	case
		when Region like '%область%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%Чуваш%' then '%Чувашск%'
		when Region like '%абардин%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%арачаев%' then '%' + SUBSTRING(Region, 1, CHARINDEX(' ', Region) - 3)+ '%'
		when Region like '%еспублика%' then '%' + SUBSTRING(Region, CHARINDEX(' ', Region) + 1, LEN(Region))+ '%'
	end
	) and (AbitSp.z = 1 or AbitSp.z_2014 = 4)) --проходной балл

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


--8_Анкета_проход.балл
SELECT 
	SP.sp_Name, --специальность
	KL.kl_name, --форма обучения

	--проходной балл
	(select isNULL(min((minb + ind_ball)), 0) from Speciality, AbitSp where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7)))), --на бюджет
	(select isNULL(min((minb + ind_ball)), 0) from Speciality, AbitSp where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and AbitSp.f = 2 AND (AbitSp.z>0 OR AbitSp.z_2014=7))) --на коммерцию

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '')
order by SP.sp_Name, KL.kl_name;


