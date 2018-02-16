/* !!! ------ ВНУТРЕННЯЯ СТАТИСТИКА ------ !!! */
/*---------------------------------------------*/

--1_Обобщенная по приему
Select 
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
	0, --Вне конкурса подано
	(select count(*) from AbitSp, Abit where (Abit.aid = AbitSp.aid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = SP.sp_id and Abit.l2_id>0) and (AbitSp.z>0 or AbitSp.z_2014>0)), --с преимуществом зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and not exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))), --по ЕГЭ зачислено
	(select count(*) from AbitSp, Speciality where (AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and exists(select * from AbitEGE where (AbitSp.aid = AbitEGE.aid and (AbitEGE.d_ex is not null or AbitEGE.gr is not null))) and (AbitSp.z>0 or AbitSp.z_2014>0))), --по экз. ВУЗа зачислено
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%высшее%' and (AbitSp.z>0 or AbitSp.z_2014>0))), --с ВО зачислено
	(select count(*) from Abit, AbitSp, Level_edu, Speciality where (Abit.aid = AbitSp.aid and Abit.leid = Level_edu.leid and AbitSp.kl_id = KL.kl_id and AbitSp.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and LOWER(Level_edu.leName) like '%среднее проф%' and (AbitSp.z>0 or AbitSp.z_2014>0))), --с СПО зачислено

	--ПЛАН ПРИЕМА
	PP.Qo + PP.F, --ПП всего
	PP.Qo, --ПП бюджет
	PP.F, --ПП по договорам
	(select sum(Qo) from PlanPr, Speciality where (PlanPr.kl_id = KL.kl_id and PlanPr.sp_id = Speciality.sp_id and Speciality.sp_Name = SP.sp_Name and isNULL(Speciality.sp_C,'') != ''))

from Speciality SP, KindLearn KL, PlanPr PP where (
		SP.sp_id = PP.sp_id 
	and KL.kl_id = PP.kl_id 
	and isNULL(SP.sp_C,'') = '');
	
--2_По целевым организациям
SELECT 
  SP.sp_Name, --специальность
  SP.sp_C, --название организации
  (SELECT COUNT(aid) FROM Speciality,  AbitSp WHERE (isNULL(Speciality.sp_C,'') != '') AND (AbitSp.sp_id = Speciality.sp_id) and (Speciality.sp_id = SP.sp_id)), --подано 
  (SELECT count(*) FROM AbitSp, Speciality where (AbitSp.sp_id = Speciality.sp_id and Speciality.sp_id = SP.sp_id and isNULL(Speciality.sp_C,'') != '') and (AbitSp.z=1 or AbitSp.z_2014=4)) --зачислено
FROM Speciality SP
  WHERE (isNULL(SP.sp_C,'') != '');
  
--8_Анкета_проход.балл

SELECT 
  SP.sp_Name, --специальность
	KL.kl_name, --форма обучения

  --проходной балл
  (SELECT MIN((minb + ind_ball)) FROM AbitEGE, AbitSp WHERE AbitEGE.aid = AbitSp.aid AND AbitSp.sp_id = SP.sp_id AND AbitSp.f = 1 AND (AbitSp.z>0 OR (AbitSp.z_2014>0 AND AbitSp.z_2014<7))), --на бюджет
  (SELECT MIN((minb + ind_ball)) FROM AbitEGE, AbitSp WHERE AbitEGE.aid = AbitSp.aid AND AbitSp.sp_id = SP.sp_id AND  AbitSp.f = 2 AND (AbitSp.z>0 OR AbitSp.z_2014=7)) --на коммерцию
  FROM Speciality SP, KindLearn KL, PlanPr PP WHERE (
		SP.sp_id = PP.sp_id 
	AND KL.kl_id = PP.kl_id 
	AND isNULL(SP.sp_C,'') = '');


