drop table if exists default.szy_djte_dz_model_user_list_wbzx_scr;
create table default.szy_djte_dz_model_user_list_wbzx_scr as 
select aa.uid
      ,bb.zhi_xin_scr -- 同盾智信分
      ,cc.br_scr -- 百融贷前联合建模分
      ,dd.bj_hm_score_v18 -- 冰鉴火眸分V18
      ,ee.tx_risk_score -- 天御反欺诈通用分
      ,ff.ali_xxhf_scr -- 阿里云先享后付分
      ,gg.zhi_shu_grd -- 智数收入等级
      ,gg.min_income -- 收入最小值
      ,gg.max_income -- 收入最大值
      ,hh.xy_b22170001 -- 贷款行为分
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    -- 同盾智信分
    select aa.uid
          ,aa.zhi_xin_scr -- 智信分
    from (
        select aa.uid
              ,bb.score as zhi_xin_scr
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_zhixinfen_tyfjcb_new
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as bb 
on aa.uid = bb.uid
left join (
    -- 百融贷前联合建模分
    select aa.uid
          ,aa.br_scr -- 百融贷前联合建模分
    from (
        select aa.uid
              ,bb.model_score as br_scr
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_bairong_get_report
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as cc 
on aa.uid = cc.uid
left join (
    -- 冰鉴火眸分V18
    select aa.uid
          ,aa.bj_hm_score_v18 -- 冰鉴火眸分V18
    from (
        select aa.uid
              ,bb.bj_hm_score as bj_hm_score_v18
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_bingjian_huomou_info
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as dd 
on aa.uid = dd.uid
left join (
    -- 腾讯天御反欺诈通用分
    select aa.uid
          ,aa.tx_risk_score -- 腾讯天御反欺诈通用分
    from (
        select aa.uid
              ,bb.risk_score as tx_risk_score
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_qcloud_anti_fraud
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as ee
on aa.uid = ee.uid
left join (
    -- 阿里云先享后付分
    select aa.uid
          ,aa.ali_xxhf_scr -- 阿里云先享后付分
    from (
        select aa.uid
              ,bb.score as ali_xxhf_scr
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_aliyun_xxiang_hfu_bo
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as ff
on aa.uid = ff.uid
left join (
    -- 阿里云先享后付分
    select aa.uid
          ,aa.zhi_shu_grd -- 智数收入等级
          ,aa.min_income -- 收入最小值
          ,aa.max_income -- 收入最大值
    from (
        select aa.uid
              ,bb.result as zhi_shu_grd
              ,bb.min as min_income
              ,bb.max as max_income
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_zhi_shu_resp
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as gg
on aa.uid = gg.uid
left join (
    -- 新颜多头全景雷达V2 行为
    select aa.uid
          ,aa.xy_b22170001 -- 贷款行为分
    from (
        select aa.uid
              ,bb.b22170001 as xy_b22170001 -- 贷款行为分
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa  
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_behavior_report_detail_v2
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where abs(datediff(aa.adt_tim,bb.created_at)) <= 7
    ) as aa 
    where aa.n = 1
) as hh
on aa.uid = hh.uid