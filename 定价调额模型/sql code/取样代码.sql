drop table if exists default.szy_djte_dz_model_user_list;
create table default.szy_djte_dz_model_user_list as 
select aa.uid
	  ,aa.flag
      ,aa.ato_tim
      ,aa.adt_tim
      ,aa.fst_ord_tim
      ,aa.lon_adt_dif
      ,case when aa.lon_adt_dif is not null then 1 else 0 end as is_lon
      ,case when aa.lon_adt_dif = 0 then 1 else 0 end as is_0d_lon
      ,case when aa.lon_adt_dif <= 7 then 1 else 0 end as is_7d_lon
      ,case when aa.lon_adt_dif <= 15 then 1 else 0 end as is_15d_lon
      ,case when aa.lon_adt_dif <= 30 then 1 else 0 end as is_30d_lon
      ,case when aa.lon_adt_dif <= 90 then 1 else 0 end as is_90d_lon
      ,case when aa.lon_adt_dif <= 180 then 1 else 0 end as is_180d_lon
      ,'2020-10-20' as day
from (
    select aa.uid
    	  ,aa.flag
          ,substr(aa.ato_tim,1,10) as ato_tim
          ,substr(aa.adt_tim,1,10) as adt_tim
          ,substr(bb.fst_ord_tim,1,10) as fst_ord_tim
          ,datediff(bb.fst_ord_tim,aa.adt_tim) as lon_adt_dif
    from (
        select *
        from default.apr154_simple as aa 
        left join (
        	select *
        	from dbank.dbank_f_all_milestone
        	where day = '2020-10-20'
        ) as bb 
        on aa.uid = bb.uid
    ) as aa 
    -- 取CASH和BT业务的首次动支时间
    left join (
        select uid
              ,min(crt_tim) as fst_ord_tim 
        from dbank.loan_f_order_info
        where day = '2020-10-20' 
          and bsy_typ in ('CASH','BALANCE_TRANSFER') 
          and ord_stt in ('LENDING','PAY_OFF','SOLD','EXCEED')
        group by uid
    ) as bb
    on aa.uid = bb.uid
) as aa
;


-- 各种用于关联表的key
drop table if exists default.szy_djte_dz_model_user_list_key;
create table default.szy_djte_dz_model_user_list_key as 
select aa.uid
      ,aa.ato_tim
      ,aa.adt_tim
      ,aa.fst_ord_tim
      ,bb.law_id
      ,case when cc.risk_id is not null then cc.risk_id else aa.uid end as risk_id
      ,dd.fst_cjj_id -- 首次登陆的cjj_id
      ,dd.adt_cjj_id -- 距离审核时间最近的cjj_id
from default.szy_djte_dz_model_user_list as aa 
left join dbank.loan_f_user_all_apply_info as bb 
on aa.uid = bb.uid 
left join ods_loan.ods_loan_dscreditdata_personas_personas_risk_id as cc
on aa.uid = cc.uid
left join (
    select aa.uid
          ,max(case when n1 = 1 then aa.cjj_id end) as fst_cjj_id
          ,max(case when n2 = 1 then aa.cjj_id end) as adt_cjj_id
    from (
        select aa.uid
              ,bb.cjj_id
              ,row_number() over(partition by aa.uid order by bb.created_at asc) as n1
              ,row_number() over(partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n2
        from default.szy_djte_dz_model_user_list as aa
        left join ods_loan.ods_loan_dsloan_userloan_count_device_register_login as bb
        on aa.uid = bb.uid
        where bb.created_at < date_add(aa.adt_tim,7)
    ) as aa
    where aa.n1 = 1 or aa.n2 = 1
    group by aa.uid
) as dd 
on aa.uid = dd.uid
;