drop table if exists default.szy_djte_dz_model_user_list_bj_hm;
create table default.szy_djte_dz_model_user_list_bj_hm as 
select aa.uid
      ,bb.bj_hm_score 
      ,bb.bj_top7d 
      ,bb.bj_property7d 
      ,bb.bj_tools7d 
      ,bb.bj_health7d 
      ,bb.bj_education7d 
      ,bb.bj_finance7d 
      ,bb.bj_travel7d 
      ,bb.bj_woman7d 
      ,bb.bj_car7d 
      ,bb.bj_app_stability7d 
      ,bb.bj_sns7d 
      ,bb.bj_service7d 
      ,bb.bj_shopping7d 
      ,bb.bj_tail7d 
      ,bb.bj_loan7d 
      ,bb.bj_game7d 
      ,bb.bj_entertainment7d 
      ,bb.bj_top90d 
      ,bb.bj_property90d 
      ,bb.bj_tools90d 
      ,bb.bj_health90d 
      ,bb.bj_education90d 
      ,bb.bj_finance90d 
      ,bb.bj_travel90d 
      ,bb.bj_woman90d 
      ,bb.bj_car90d 
      ,bb.bj_app_stability90d 
      ,bb.bj_sns90d 
      ,bb.bj_service90d 
      ,bb.bj_shopping90d 
      ,bb.bj_tail90d 
      ,bb.bj_loan90d 
      ,bb.bj_game90d 
      ,bb.bj_entertainment90d 
      ,bb.bj_reading90d 
      ,bb.bj_top180d 
      ,bb.bj_property180d 
      ,bb.bj_tools180d 
      ,bb.bj_health180d 
      ,bb.bj_education180d 
      ,bb.bj_finance180d 
      ,bb.bj_travel180d 
      ,bb.bj_woman180d 
      ,bb.bj_car180d 
      ,bb.bj_app_stability180d 
      ,bb.bj_sns180d 
      ,bb.bj_service180d 
      ,bb.bj_shopping180d 
      ,bb.bj_tail180d 
      ,bb.bj_loan180d 
      ,bb.bj_game180d 
      ,bb.bj_entertainment180d 
      ,bb.bj_reading7d 
      ,bb.bj_reading180d 
from default.szy_djte_dz_model_user_list_key as aa
left join (
    select aa.*
    from (
        select aa.uid
              ,bb.bj_hm_score
              ,bb.top7d as bj_top7d 
              ,bb.property7d as bj_property7d 
              ,bb.tools7d as bj_tools7d 
              ,bb.health7d as bj_health7d 
              ,bb.education7d as bj_education7d 
              ,bb.finance7d as bj_finance7d 
              ,bb.travel7d as bj_travel7d 
              ,bb.woman7d as bj_woman7d 
              ,bb.car7d as bj_car7d 
              ,bb.app_stability7d as bj_app_stability7d 
              ,bb.sns7d as bj_sns7d 
              ,bb.service7d as bj_service7d 
              ,bb.shopping7d as bj_shopping7d 
              ,bb.tail7d as bj_tail7d 
              ,bb.loan7d as bj_loan7d 
              ,bb.game7d as bj_game7d 
              ,bb.entertainment7d as bj_entertainment7d 
              ,bb.top90d as bj_top90d 
              ,bb.property90d as bj_property90d 
              ,bb.tools90d as bj_tools90d 
              ,bb.health90d as bj_health90d 
              ,bb.education90d as bj_education90d 
              ,bb.finance90d as bj_finance90d 
              ,bb.travel90d as bj_travel90d 
              ,bb.woman90d as bj_woman90d 
              ,bb.car90d as bj_car90d 
              ,bb.app_stability90d as bj_app_stability90d 
              ,bb.sns90d as bj_sns90d 
              ,bb.service90d as bj_service90d 
              ,bb.shopping90d as bj_shopping90d 
              ,bb.tail90d as bj_tail90d 
              ,bb.loan90d as bj_loan90d 
              ,bb.game90d as bj_game90d 
              ,bb.entertainment90d as bj_entertainment90d 
              ,bb.reading90d as bj_reading90d 
              ,bb.top180d as bj_top180d 
              ,bb.property180d as bj_property180d 
              ,bb.tools180d as bj_tools180d 
              ,bb.health180d as bj_health180d 
              ,bb.education180d as bj_education180d 
              ,bb.finance180d as bj_finance180d 
              ,bb.travel180d as bj_travel180d 
              ,bb.woman180d as bj_woman180d 
              ,bb.car180d as bj_car180d 
              ,bb.app_stability180d as bj_app_stability180d 
              ,bb.sns180d as bj_sns180d 
              ,bb.service180d as bj_service180d 
              ,bb.shopping180d as bj_shopping180d 
              ,bb.tail180d as bj_tail180d 
              ,bb.loan180d as bj_loan180d 
              ,bb.game180d as bj_game180d 
              ,bb.entertainment180d as bj_entertainment180d 
              ,bb.reading7d as bj_reading7d 
              ,bb.reading180d as bj_reading180d 
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_bingjian_huomou_info
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where bb.created_at < date_add(aa.adt_tim,7)
    ) as aa
    where n = 1
) as bb 
on aa.uid = bb.uid
