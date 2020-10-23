-- 个人属性数据
-- 用户申请时基本信息
drop table if exists default.szy_djte_dz_model_user_list_basic;
create table default.szy_djte_dz_model_user_list_basic as
select aa.uid
      ,bb.nation as bsc_cus_nat -- 民族
      ,bb.province as bsc_prv -- 定位省份
      ,bb.city as bsc_cty -- 定位城市
      ,bb.meridian as bsc_mrd -- 定位纬度
      ,bb.parallel as bsc_prl -- 定位经度
      ,cc.usr_acd as bsc_usr_acd --学历
      ,cc.mar_flg as bsc_mrg_flg -- 婚姻
      ,cc.sex_typ as bsc_sex_typ -- 性别
      ,cc.age_val as bsc_age_val -- 年龄
      ,cc.cre_lmt as bsc_cre_lmt -- 自填卡额度
      ,case when regexp_extract(cc.eml_adr, '@(.+)\\.com', 1) in ('qq','163','126','139','') then regexp_extract(cc.eml_adr, '@(.+)\\.com', 1)
            when cc.eml_adr is null then null 
            else 'other' end as bsc_eml_typ -- 邮箱类别 正则调整
      ,case when cc.eml_adr like '%@qq.com%' then length(regexp_extract(cc.eml_adr, '([0-9]+)@qq.com', 1)) 
            else null end as bsc_len_qq_num -- qq邮箱长度
      ,cc.avg_mth_icm as bsc_avg_mth_icm -- 平均月收入
      ,cc.grd_yer as bsc_grd_yer -- 毕业年份
      ,cc.use_of_lon as bsc_use_of_lon -- 借款用途
      ,cc.usr_crd_typ as bsc_usr_crd_typ -- 绑卡类型
      ,cc.crd_mth_csp as bsc_crd_mth_csp -- 信用卡月消费
      ,case when substr(cc.adt_mob_f, 1, 3) in ('134','135','136','137','138','139','147','150','151','152','157','158','159','172','178','182','183','184','187','188','198','148') then 1
            when substr(cc.adt_mob_f, 1, 3) in ('130','131','132','145','155','156','166','175','176','185','186','166','146') then 2
            when substr(cc.adt_mob_f, 1, 3) in ('133','149','153','173','177','180','181','189','199','191') then 3
            when substr(cc.adt_mob_f, 1, 4) in ('1703','1705','1706','1707','1704','1708','1709','1700','1701','1702') then 4
            else null end as bsc_yys_opt -- 运营商类型
      ,cc.cus_cha as bsc_cus_cha -- 用户渠道
      ,case when split(cc.idt_adr,'县')[1] like '%村%' then 'countryside' else 'city' end as bsc_is_cts --身份证地址是否农村
      ,dd.city as bsc_mob_cty -- 前七位伪表匹配 手机归属城市
      ,dd.province as bsc_mob_prv -- 前七位伪表匹配 手机归属省份
      ,ee.sns_ctt_cnt -- 通讯录中的敏感词个数
      ,ee.rel_cnt -- 通讯录个数
from default.szy_djte_dz_model_user_list_key as aa
left join ods_loan.ods_loan_dsloan_credit_mgr_user_apply_info as bb on aa.law_id = bb.law_id
left join (
    select *
          ,case when adt_mob is null then reg_mob else adt_mob end as adt_mob_f
    from dbank.loan_f_user_all_apply_info
) as cc 
on aa.law_id = cc.law_id
left join (
    select phone_header,province,city
    from dbank.dbank_d_phone_address
    group by phone_header,province,city
) as dd
on substr(cc.adt_mob_f,1,7) = dd.phone_header
left join dbank.loan_f_user_apply_info as ee
on aa.uid = ee.uid 
;