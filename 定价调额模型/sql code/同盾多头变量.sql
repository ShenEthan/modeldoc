-- 同盾多头
drop table if exists default.szy_djte_dz_model_user_list_tnd_risk;
create table default.szy_djte_dz_model_user_list_tnd_risk as
select uid
      ,max(case when item_name = '12个月内申请人在多个平台申请借款' then platform_count else 0 end) as tnd_rsk_itm_one_yer_ptf_apl
      ,max(case when item_name = '1个月内申请人在多个平台申请借款' then platform_count else 0 end) as tnd_rsk_itm_one_mth_ptf_apl
      ,max(case when item_name = '3个月内申请人在多个平台申请借款' then platform_count else 0 end) as tnd_rsk_itm_thr_mth_ptf_apl
      ,max(case when item_name = '6个月内申请人在多个平台申请借款' then platform_count else 0 end) as tnd_rsk_itm_six_mth_ptf_apl
      ,max(case when item_name = '7天内申请人在多个平台申请借款' then platform_count else 0 end) as tnd_rsk_itm_one_wek_ptf_apl
      ,sum(case when item_name = '1个月内设备或身份证或手机号申请次数过多' then 1 else 0 end) as tnd_rsk_itm_one_mth_apl_mor
      ,sum(case when item_name = '1个月内身份证使用过多设备进行申请' then 1 else 0 end) as tnd_rsk_itm_one_mth_idt_use_dvc_apl_mor
      ,sum(case when item_name = '1天内设备使用过多的身份证或手机号进行申请' then 1 else 0 end) as tnd_rsk_itm_one_day_dvc_use_idt_mob_apl_mor
      ,sum(case when item_name = '1天内身份证使用过多设备进行申请' then 1 else 0 end) as tnd_rsk_itm_one_day_idt_use_dvc_apl_mor
      ,sum(case when item_name = '3个月内申请信息关联多个身份证' then 1 else 0 end) as tnd_rsk_itm_thr_mth_apl_inf_rel_idt_mor
      ,sum(case when item_name = '3个月内身份证关联多个申请信息' then 1 else 0 end) as tnd_rsk_itm_thr_mth_idt_rel_apl_inf_mor
      ,sum(case when item_name = '7天内设备或身份证或手机号申请次数过多' then 1 else 0 end) as tnd_rsk_itm_one_wek_apl_mor
      ,sum(case when item_name = '7天内设备使用过多的身份证或手机号进行申请' then 1 else 0 end) as tnd_rsk_itm_one_wek_dvc_use_idt_mob_apl_mor
      ,sum(case when item_name = '7天内身份证使用过多设备进行申请' then 1 else 0 end) as tnd_rsk_itm_one_wek_idt_use_dvc_apl_mor
      ,sum(case when item_name = '短时间移动距离位置异常' then 1 else 0 end) as tnd_rsk_itm_mov_dst_abn
      ,sum(case when item_name = '借款设备代理识别' then 1 else 0 end) as tnd_rsk_itm_dvc_prx
      ,sum(case when item_name = '借款设备模拟器识别' then 1 else 0 end) as tnd_rsk_itm_dvc_vrt
      ,sum(case when item_name = '借款设备越狱识别' then 1 else 0 end) as tnd_rsk_itm_dvc_rot
      ,sum(case when item_name = '借款设备作弊工具识别' then 1 else 0 end) as tnd_rsk_itm_dvc_cht
      ,sum(case when item_name = '申请人属于高风险年龄段人群' then 1 else 0 end) as tnd_rsk_itm_usr_in_hgh_rsk_grp
      ,sum(case when item_name = '申请手机号归属地与真实IP的城市不匹配' then 1 else 0 end) as tnd_rsk_itm_mob_cty_ip_cty_not_mch
      ,sum(case when item_name = '身份证_姓名命中法院结案模糊名单' then 1 else 0 end) as tnd_rsk_itm_idt_nam_hit_cot_cas
      ,sum(case when item_name = '身份证_姓名命中法院失信模糊名单' then 1 else 0 end) as tnd_rsk_itm_idt_nam_hit_cot_dht
      ,sum(case when item_name = '身份证_姓名命中法院执行模糊名单' then 1 else 0 end) as tnd_rsk_itm_idt_nam_hit_cot_exc
      ,sum(case when item_name = '身份证_姓名命中网贷模糊黑名单' then 1 else 0 end) as tnd_rsk_itm_idt_nam_hit_blk_lst
      ,sum(case when item_name = '身份证_姓名命中信贷逾期模糊名单' then 1 else 0 end) as tnd_rsk_itm_idt_nam_hit_ovd
      ,sum(case when item_name = '身份证格式校验错误' then 1 else 0 end) as tnd_rsk_itm_idt_ptt_err
      ,sum(case when item_name = '身份证归属地位于高风险较为集中地区' then 1 else 0 end) as tnd_rsk_itm_idt_loc_in_hgh_rsk_are
      ,sum(case when item_name = '身份证号对应人存在助学贷款逾期历史' then 1 else 0 end) as tnd_rsk_itm_idt_psn_ext_ovd_stu_lon
      ,sum(case when item_name = '身份证命中车辆租赁违约名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_car_rnt_dft
      ,sum(case when item_name = '身份证命中低风险关注名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_low_rsk
      ,sum(case when item_name = '身份证命中法院结案名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_cot_cas
      ,sum(case when item_name = '身份证命中法院失信名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_cot_dht
      ,sum(case when item_name = '身份证命中法院信贷逾期名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_cot_ovd
      ,sum(case when item_name = '身份证命中法院执行名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_cot_exc
      ,sum(case when item_name = '身份证命中犯罪通缉名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_crm
      ,sum(case when item_name = '身份证命中高风险关注名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_hgh_rsk
      ,sum(case when item_name = '身份证命中公司欠税名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_com_tax
      ,sum(case when item_name = '身份证命中故意违章乘车名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_ilg_drv
      ,sum(case when item_name = '身份证命中欠款公司法人名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_det_com
      ,sum(case when item_name = '身份证命中欠税名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_tax
      ,sum(case when item_name = '身份证命中失联名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_los_cnc
      ,sum(case when item_name = '身份证命中同盾欺诈低级灰名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_tnd_frd_low_gry
      ,sum(case when item_name = '身份证命中同盾欺诈高级灰名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_tnd_frd_hgh_gry
      ,sum(case when item_name = '身份证命中同盾欺诈中级灰名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_tnd_frd_mid_gry
      ,sum(case when item_name = '身份证命中网贷黑名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_lon_blk_lst
      ,sum(case when item_name = '身份证命中信贷逾期名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_ovd
      ,sum(case when item_name = '身份证命中中风险关注名单' then 1 else 0 end) as tnd_rsk_itm_idt_hit_mid_rsk
      ,sum(case when item_name = '手机号格式校验错误' then 1 else 0 end) as tnd_rsk_itm_mob_ptt_err
      ,sum(case when item_name = '手机号命中车辆租赁违约名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_car_rnt_dft
      ,sum(case when item_name = '手机号命中贷款黑中介库' then 1 else 0 end) as tnd_rsk_itm_mob_hit_blk_agt
      ,sum(case when item_name = '手机号命中低风险关注名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_low_rsk
      ,sum(case when item_name = '手机号命中高风险关注名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_hgh_rsk
      ,sum(case when item_name = '手机号命中欠款公司法人名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_det_com
      ,sum(case when item_name = '手机号命中失联名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_los_cnc
      ,sum(case when item_name = '手机号命中通信小号库' then 1 else 0 end) as tnd_rsk_itm_mob_hit_alt_num
      ,sum(case when item_name = '手机号命中同盾欺诈低级灰名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_tnd_frd_low_gry
      ,sum(case when item_name = '手机号命中同盾欺诈高级灰名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_tnd_frd_hgh_gry
      ,sum(case when item_name = '手机号命中同盾欺诈中级灰名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_tnd_frd_mid_gry
      ,sum(case when item_name = '手机号命中网贷黑名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_lon_blk_lst
      ,sum(case when item_name = '手机号命中信贷逾期名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_ovd
      ,sum(case when item_name = '手机号命中虚假号码库' then 1 else 0 end) as tnd_rsk_itm_mob_hit_fak_num
      ,sum(case when item_name = '手机号命中诈骗骚扰库' then 1 else 0 end) as tnd_rsk_itm_mob_hit_frd
      ,sum(case when item_name = '手机号命中中风险关注名单' then 1 else 0 end) as tnd_rsk_itm_mob_hit_mid_rsk
      ,sum(case when item_name = '手机号疑似乱填' then 1 else 0 end) as tnd_rsk_itm_mob_num_mak_up
      ,count(distinct case when risk_level = 'high' then item_id else null end) as tnd_rsk_itm_hgh_rsk_typ_num
      ,count(distinct case when risk_level = 'medium' then item_id else null end) as tnd_rsk_itm_mdm_rsk_typ_num
      ,count(distinct case when risk_level = 'low' then item_id else null end) as tnd_rsk_itm_low_rsk_typ_num
      ,max(platform_count) as tnd_rsk_itm_max_ptf_cnt
      ,sum(case when `group` = '个人基本信息核查' then 1 else 0 end) as tnd_rsk_itm_psn_inf_chk
      ,sum(case when `group` = '客户行为检测' then 1 else 0 end) as tnd_rsk_itm_bhv_chk
      ,sum(case when `group` = '风险信息扫描' then 1 else 0 end) as tnd_rsk_itm_rsk_chk
      ,sum(case when `group` = '不良信息扫描' then 1 else 0 end) as tnd_rsk_itm_bad_inf_chk
      ,sum(case when `group` = '多平台借贷申请检测' then 1 else 0 end) as tnd_rsk_itm_mul_ptf_apl_chk
from default.szy_djte_dz_model_user_list_key as aa
left join (
    select aa.law_id
          ,aa.uid
          ,bb.item_id
          ,bb.item_name
          ,bb.risk_level
          ,bb.platform_count
          ,bb.`group`
    from default.szy_djte_dz_model_user_list_key as aa
    left join (
        select *
        from ods_loan.ods_loan_dsloan_creditdata_tnd_prs_risk_items
        where day <= '2020-10-22'
          and day >= '2020-08-01'
          and law_id is not null and law_id <> 'NULL' and law_id <> ''
    ) as bb
    on aa.law_id = bb.law_id
    where bb.created_at < date_add(aa.adt_tim,7)
) as bb
on aa.uid = bb.uid
group by aa.uid
;

-- 解析明细字典
drop table if exists default.szy_djte_dz_model_user_list_tnd_tmp;
create table default.szy_djte_dz_model_user_list_tnd_tmp as
select aa.uid
      ,bb.item_name as itm_nam
      ,bb.platform_count as ptf_cnt
      ,bb.platform_detail as ptf_dtl
      ,case when bb.platform_detail is not null then str_to_map(regexp_replace(bb.platform_detail, '[\\[\\]"]', ''), ',', ':') else null end as ptf_dtl_map
from default.szy_djte_dz_model_user_list_key as aa
left join (
    select aa.law_id
          ,aa.uid
          ,bb.item_id
          ,bb.item_name
          ,bb.risk_level
          ,bb.platform_count
          ,bb.platform_detail
          ,bb.`group`
    from default.szy_djte_dz_model_user_list_key as aa
    left join (
        select *
        from ods_loan.ods_loan_dsloan_creditdata_tnd_prs_risk_items
        where day <= '2020-10-22'
          and day >= '2020-08-01'
          and law_id is not null and law_id <> 'NULL' and law_id <> ''
    ) as bb
    on aa.law_id = bb.law_id
    where bb.created_at < date_add(aa.adt_tim,7)
) as bb
on aa.uid = bb.uid  
;


-- 7天内明细
drop table if exists default.szy_djte_dz_model_user_list_tnd_detail_7d;
create table default.szy_djte_dz_model_user_list_tnd_detail_7d as
select aa.uid
      ,bb.ptf_dtl_map['一般消费分期平台'] as tnd_rsk_itm_d7_gen_ist_ptf
      ,bb.ptf_dtl_map['大数据金融'] as tnd_rsk_itm_d7_big_dat_fin
      ,bb.ptf_dtl_map['小额贷款公司'] as tnd_rsk_itm_d7_ptt_lon_cmp
      ,bb.ptf_dtl_map['P2P网贷'] as tnd_rsk_itm_d7_p2p
      ,bb.ptf_dtl_map['大型消费金融公司'] as tnd_rsk_itm_d7_big_csm_fin_cmp
      ,bb.ptf_dtl_map['信用卡中心'] as tnd_rsk_itm_d7_crd_ctr
      ,bb.ptf_dtl_map['互联网金融门户'] as tnd_rsk_itm_d7_fin_net
      ,bb.ptf_dtl_map['综合类电商平台'] as tnd_rsk_itm_d7_com_ecm_ptf
      ,bb.ptf_dtl_map['银行个人业务'] as tnd_rsk_itm_d7_psn_bnk
      ,bb.ptf_dtl_map['银行小微贷款'] as tnd_rsk_itm_d7_bnk_sml_lon
      ,bb.ptf_dtl_map['O2O'] as tnd_rsk_itm_d7_o2o
      ,bb.ptf_dtl_map['网上银行'] as tnd_rsk_itm_d7_onl_bnk
      ,bb.ptf_dtl_map['厂商汽车金融'] as tnd_rsk_itm_d7_car_mnu_fin
      ,bb.ptf_dtl_map['直销银行'] as tnd_rsk_itm_d7_drt_sel_bnk
      ,bb.ptf_dtl_map['银行消费金融公司'] as tnd_rsk_itm_d7_rtl_bnk
      ,bb.ptf_dtl_map['财产保险'] as tnd_rsk_itm_d7_ppt_ins
      ,bb.ptf_dtl_map['融资租赁'] as tnd_rsk_itm_d7_fin_les
      ,bb.ptf_dtl_map['设备租赁'] as tnd_rsk_itm_d7_eqp_les
      ,bb.ptf_dtl_map['第三方服务商'] as tnd_rsk_itm_d7_thd_pty_svc_pvd
      ,bb.ptf_dtl_map['房屋租赁'] as tnd_rsk_itm_d7_hse_les
      ,bb.ptf_dtl_map['担保'] as tnd_rsk_itm_d7_grt
      ,bb.ptf_dtl_map['理财机构'] as tnd_rsk_itm_d7_fin_itt
      ,bb.ptf_dtl_map['汽车租赁'] as tnd_rsk_itm_d7_car_les
      ,bb.ptf_dtl_map['信息中介'] as tnd_rsk_itm_d7_inf_agt
      ,bb.ptf_dtl_map['第三方支付'] as tnd_rsk_itm_d7_thd_pty_pay
      ,bb.ptf_dtl_map['房地产金融'] as tnd_rsk_itm_d7_rel_est_fin
      ,bb.ptf_dtl_map['垂直类电商平台'] as tnd_rsk_itm_d7_vtc_ecm_ptf
      ,bb.ptf_dtl_map['交通工具租赁'] as tnd_rsk_itm_d7_trp_les
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    select *
    from (
        select uid
              ,itm_nam
              ,ptf_cnt
              ,ptf_dtl
              ,ptf_dtl_map
              ,row_number () over (partition by uid, itm_nam order by ptf_cnt desc) as n
	    from default.szy_djte_dz_model_user_list_tnd_tmp
	    where itm_nam = '7天内申请人在多个平台申请借款'
    ) as aa 
    where aa.n = 1
) as bb
on aa.uid = bb.uid
;

-- 一个月内明细
drop table if exists default.szy_djte_dz_model_user_list_tnd_detail_1m;
create table default.szy_djte_dz_model_user_list_tnd_detail_1m as
select aa.uid
      ,bb.ptf_dtl_map['一般消费分期平台'] as tnd_rsk_itm_m1_gen_ist_ptf
      ,bb.ptf_dtl_map['大数据金融'] as tnd_rsk_itm_m1_big_dat_fin
      ,bb.ptf_dtl_map['小额贷款公司'] as tnd_rsk_itm_m1_ptt_lon_cmp
      ,bb.ptf_dtl_map['P2P网贷'] as tnd_rsk_itm_m1_p2p
      ,bb.ptf_dtl_map['大型消费金融公司'] as tnd_rsk_itm_m1_big_csm_fin_cmp
      ,bb.ptf_dtl_map['信用卡中心'] as tnd_rsk_itm_m1_crd_ctr
      ,bb.ptf_dtl_map['互联网金融门户'] as tnd_rsk_itm_m1_fin_net
      ,bb.ptf_dtl_map['综合类电商平台'] as tnd_rsk_itm_m1_com_ecm_ptf
      ,bb.ptf_dtl_map['银行个人业务'] as tnd_rsk_itm_m1_psn_bnk
      ,bb.ptf_dtl_map['银行小微贷款'] as tnd_rsk_itm_m1_bnk_sml_lon
      ,bb.ptf_dtl_map['O2O'] as tnd_rsk_itm_m1_o2o
      ,bb.ptf_dtl_map['网上银行'] as tnd_rsk_itm_m1_onl_bnk
      ,bb.ptf_dtl_map['厂商汽车金融'] as tnd_rsk_itm_m1_car_mnu_fin
      ,bb.ptf_dtl_map['直销银行'] as tnd_rsk_itm_m1_drt_sel_bnk
      ,bb.ptf_dtl_map['银行消费金融公司'] as tnd_rsk_itm_m1_rtl_bnk
      ,bb.ptf_dtl_map['财产保险'] as tnd_rsk_itm_m1_ppt_ins
      ,bb.ptf_dtl_map['融资租赁'] as tnd_rsk_itm_m1_fin_les
      ,bb.ptf_dtl_map['设备租赁'] as tnd_rsk_itm_m1_eqp_les
      ,bb.ptf_dtl_map['第三方服务商'] as tnd_rsk_itm_m1_thd_pty_svc_pvd
      ,bb.ptf_dtl_map['房屋租赁'] as tnd_rsk_itm_m1_hse_les
      ,bb.ptf_dtl_map['担保'] as tnd_rsk_itm_m1_grt
      ,bb.ptf_dtl_map['理财机构'] as tnd_rsk_itm_m1_fin_itt
      ,bb.ptf_dtl_map['汽车租赁'] as tnd_rsk_itm_m1_car_les
      ,bb.ptf_dtl_map['信息中介'] as tnd_rsk_itm_m1_inf_agt
      ,bb.ptf_dtl_map['第三方支付'] as tnd_rsk_itm_m1_thd_pty_pay
      ,bb.ptf_dtl_map['房地产金融'] as tnd_rsk_itm_m1_rel_est_fin
      ,bb.ptf_dtl_map['垂直类电商平台'] as tnd_rsk_itm_m1_vtc_ecm_ptf
      ,bb.ptf_dtl_map['交通工具租赁'] as tnd_rsk_itm_m1_trp_les
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    select *
    from (
        select uid
              ,itm_nam
              ,ptf_cnt
              ,ptf_dtl
              ,ptf_dtl_map
              ,row_number () over (partition by uid, itm_nam order by ptf_cnt desc) as n
	    from default.szy_djte_dz_model_user_list_tnd_tmp
	    where itm_nam = '1个月内申请人在多个平台申请借款'
    ) as aa 
    where aa.n = 1
) as bb
on aa.uid = bb.uid
;

-- 三个月内明细
drop table if exists default.szy_djte_dz_model_user_list_tnd_detail_3m;
create table default.szy_djte_dz_model_user_list_tnd_detail_3m as
select aa.uid
      ,bb.ptf_dtl_map['一般消费分期平台'] as tnd_rsk_itm_m3_gen_ist_ptf
      ,bb.ptf_dtl_map['大数据金融'] as tnd_rsk_itm_m3_big_dat_fin
      ,bb.ptf_dtl_map['小额贷款公司'] as tnd_rsk_itm_m3_ptt_lon_cmp
      ,bb.ptf_dtl_map['P2P网贷'] as tnd_rsk_itm_m3_p2p
      ,bb.ptf_dtl_map['大型消费金融公司'] as tnd_rsk_itm_m3_big_csm_fin_cmp
      ,bb.ptf_dtl_map['信用卡中心'] as tnd_rsk_itm_m3_crd_ctr
      ,bb.ptf_dtl_map['互联网金融门户'] as tnd_rsk_itm_m3_fin_net
      ,bb.ptf_dtl_map['综合类电商平台'] as tnd_rsk_itm_m3_com_ecm_ptf
      ,bb.ptf_dtl_map['银行个人业务'] as tnd_rsk_itm_m3_psn_bnk
      ,bb.ptf_dtl_map['银行小微贷款'] as tnd_rsk_itm_m3_bnk_sml_lon
      ,bb.ptf_dtl_map['O2O'] as tnd_rsk_itm_m3_o2o
      ,bb.ptf_dtl_map['网上银行'] as tnd_rsk_itm_m3_onl_bnk
      ,bb.ptf_dtl_map['厂商汽车金融'] as tnd_rsk_itm_m3_car_mnu_fin
      ,bb.ptf_dtl_map['直销银行'] as tnd_rsk_itm_m3_drt_sel_bnk
      ,bb.ptf_dtl_map['银行消费金融公司'] as tnd_rsk_itm_m3_rtl_bnk
      ,bb.ptf_dtl_map['财产保险'] as tnd_rsk_itm_m3_ppt_ins
      ,bb.ptf_dtl_map['融资租赁'] as tnd_rsk_itm_m3_fin_les
      ,bb.ptf_dtl_map['设备租赁'] as tnd_rsk_itm_m3_eqp_les
      ,bb.ptf_dtl_map['第三方服务商'] as tnd_rsk_itm_m3_thd_pty_svc_pvd
      ,bb.ptf_dtl_map['房屋租赁'] as tnd_rsk_itm_m3_hse_les
      ,bb.ptf_dtl_map['担保'] as tnd_rsk_itm_m3_grt
      ,bb.ptf_dtl_map['理财机构'] as tnd_rsk_itm_m3_fin_itt
      ,bb.ptf_dtl_map['汽车租赁'] as tnd_rsk_itm_m3_car_les
      ,bb.ptf_dtl_map['信息中介'] as tnd_rsk_itm_m3_inf_agt
      ,bb.ptf_dtl_map['第三方支付'] as tnd_rsk_itm_m3_thd_pty_pay
      ,bb.ptf_dtl_map['房地产金融'] as tnd_rsk_itm_m3_rel_est_fin
      ,bb.ptf_dtl_map['垂直类电商平台'] as tnd_rsk_itm_m3_vtc_ecm_ptf
      ,bb.ptf_dtl_map['交通工具租赁'] as tnd_rsk_itm_m3_trp_les
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    select *
    from (
        select uid
              ,itm_nam
              ,ptf_cnt
              ,ptf_dtl
              ,ptf_dtl_map
              ,row_number () over (partition by uid, itm_nam order by ptf_cnt desc) as n
	    from default.szy_djte_dz_model_user_list_tnd_tmp
	    where itm_nam = '3个月内申请人在多个平台申请借款'
    ) as aa 
    where aa.n = 1
) as bb
on aa.uid = bb.uid
;


-- 六个月内明细
drop table if exists default.szy_djte_dz_model_user_list_tnd_detail_6m;
create table default.szy_djte_dz_model_user_list_tnd_detail_6m as
select aa.uid
      ,bb.ptf_dtl_map['一般消费分期平台'] as tnd_rsk_itm_m6_gen_ist_ptf
      ,bb.ptf_dtl_map['大数据金融'] as tnd_rsk_itm_m6_big_dat_fin
      ,bb.ptf_dtl_map['小额贷款公司'] as tnd_rsk_itm_m6_ptt_lon_cmp
      ,bb.ptf_dtl_map['P2P网贷'] as tnd_rsk_itm_m6_p2p
      ,bb.ptf_dtl_map['大型消费金融公司'] as tnd_rsk_itm_m6_big_csm_fin_cmp
      ,bb.ptf_dtl_map['信用卡中心'] as tnd_rsk_itm_m6_crd_ctr
      ,bb.ptf_dtl_map['互联网金融门户'] as tnd_rsk_itm_m6_fin_net
      ,bb.ptf_dtl_map['综合类电商平台'] as tnd_rsk_itm_m6_com_ecm_ptf
      ,bb.ptf_dtl_map['银行个人业务'] as tnd_rsk_itm_m6_psn_bnk
      ,bb.ptf_dtl_map['银行小微贷款'] as tnd_rsk_itm_m6_bnk_sml_lon
      ,bb.ptf_dtl_map['O2O'] as tnd_rsk_itm_m6_o2o
      ,bb.ptf_dtl_map['网上银行'] as tnd_rsk_itm_m6_onl_bnk
      ,bb.ptf_dtl_map['厂商汽车金融'] as tnd_rsk_itm_m6_car_mnu_fin
      ,bb.ptf_dtl_map['直销银行'] as tnd_rsk_itm_m6_drt_sel_bnk
      ,bb.ptf_dtl_map['银行消费金融公司'] as tnd_rsk_itm_m6_rtl_bnk
      ,bb.ptf_dtl_map['财产保险'] as tnd_rsk_itm_m6_ppt_ins
      ,bb.ptf_dtl_map['融资租赁'] as tnd_rsk_itm_m6_fin_les
      ,bb.ptf_dtl_map['设备租赁'] as tnd_rsk_itm_m6_eqp_les
      ,bb.ptf_dtl_map['第三方服务商'] as tnd_rsk_itm_m6_thd_pty_svc_pvd
      ,bb.ptf_dtl_map['房屋租赁'] as tnd_rsk_itm_m6_hse_les
      ,bb.ptf_dtl_map['担保'] as tnd_rsk_itm_m6_grt
      ,bb.ptf_dtl_map['理财机构'] as tnd_rsk_itm_m6_fin_itt
      ,bb.ptf_dtl_map['汽车租赁'] as tnd_rsk_itm_m6_car_les
      ,bb.ptf_dtl_map['信息中介'] as tnd_rsk_itm_m6_inf_agt
      ,bb.ptf_dtl_map['第三方支付'] as tnd_rsk_itm_m6_thd_pty_pay
      ,bb.ptf_dtl_map['房地产金融'] as tnd_rsk_itm_m6_rel_est_fin
      ,bb.ptf_dtl_map['垂直类电商平台'] as tnd_rsk_itm_m6_vtc_ecm_ptf
      ,bb.ptf_dtl_map['交通工具租赁'] as tnd_rsk_itm_m6_trp_les
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    select *
    from (
        select uid
              ,itm_nam
              ,ptf_cnt
              ,ptf_dtl
              ,ptf_dtl_map
              ,row_number () over (partition by uid, itm_nam order by ptf_cnt desc) as n
	    from default.szy_djte_dz_model_user_list_tnd_tmp
	    where itm_nam = '6个月内申请人在多个平台申请借款'
    ) as aa 
    where aa.n = 1
) as bb
on aa.uid = bb.uid
;


-- 12个月内明细
drop table if exists default.szy_djte_dz_model_user_list_tnd_detail_12m;
create table default.szy_djte_dz_model_user_list_tnd_detail_12m as
select aa.uid
      ,bb.ptf_dtl_map['一般消费分期平台'] as tnd_rsk_itm_m12_gen_ist_ptf
      ,bb.ptf_dtl_map['大数据金融'] as tnd_rsk_itm_m12_big_dat_fin
      ,bb.ptf_dtl_map['小额贷款公司'] as tnd_rsk_itm_m12_ptt_lon_cmp
      ,bb.ptf_dtl_map['P2P网贷'] as tnd_rsk_itm_m12_p2p
      ,bb.ptf_dtl_map['大型消费金融公司'] as tnd_rsk_itm_m12_big_csm_fin_cmp
      ,bb.ptf_dtl_map['信用卡中心'] as tnd_rsk_itm_m12_crd_ctr
      ,bb.ptf_dtl_map['互联网金融门户'] as tnd_rsk_itm_m12_fin_net
      ,bb.ptf_dtl_map['综合类电商平台'] as tnd_rsk_itm_m12_com_ecm_ptf
      ,bb.ptf_dtl_map['银行个人业务'] as tnd_rsk_itm_m12_psn_bnk
      ,bb.ptf_dtl_map['银行小微贷款'] as tnd_rsk_itm_m12_bnk_sml_lon
      ,bb.ptf_dtl_map['O2O'] as tnd_rsk_itm_m12_o2o
      ,bb.ptf_dtl_map['网上银行'] as tnd_rsk_itm_m12_onl_bnk
      ,bb.ptf_dtl_map['厂商汽车金融'] as tnd_rsk_itm_m12_car_mnu_fin
      ,bb.ptf_dtl_map['直销银行'] as tnd_rsk_itm_m12_drt_sel_bnk
      ,bb.ptf_dtl_map['银行消费金融公司'] as tnd_rsk_itm_m12_rtl_bnk
      ,bb.ptf_dtl_map['财产保险'] as tnd_rsk_itm_m12_ppt_ins
      ,bb.ptf_dtl_map['融资租赁'] as tnd_rsk_itm_m12_fin_les
      ,bb.ptf_dtl_map['设备租赁'] as tnd_rsk_itm_m12_eqp_les
      ,bb.ptf_dtl_map['第三方服务商'] as tnd_rsk_itm_m12_thd_pty_svc_pvd
      ,bb.ptf_dtl_map['房屋租赁'] as tnd_rsk_itm_m12_hse_les
      ,bb.ptf_dtl_map['担保'] as tnd_rsk_itm_m12_grt
      ,bb.ptf_dtl_map['理财机构'] as tnd_rsk_itm_m12_fin_itt
      ,bb.ptf_dtl_map['汽车租赁'] as tnd_rsk_itm_m12_car_les
      ,bb.ptf_dtl_map['信息中介'] as tnd_rsk_itm_m12_inf_agt
      ,bb.ptf_dtl_map['第三方支付'] as tnd_rsk_itm_m12_thd_pty_pay
      ,bb.ptf_dtl_map['房地产金融'] as tnd_rsk_itm_m12_rel_est_fin
      ,bb.ptf_dtl_map['垂直类电商平台'] as tnd_rsk_itm_m12_vtc_ecm_ptf
      ,bb.ptf_dtl_map['交通工具租赁'] as tnd_rsk_itm_m12_trp_les
from default.szy_djte_dz_model_user_list_key as aa 
left join (
    select *
    from (
        select uid
              ,itm_nam
              ,ptf_cnt
              ,ptf_dtl
              ,ptf_dtl_map
              ,row_number () over (partition by uid, itm_nam order by ptf_cnt desc) as n
	    from default.szy_djte_dz_model_user_list_tnd_tmp
	    where itm_nam = '12个月内申请人在多个平台申请借款'
    ) as aa 
    where aa.n = 1
) as bb
on aa.uid = bb.uid
;



-- 计算比率合并中间表(第一部分)
drop table if exists default.szy_djte_dz_model_user_list_tnd_risk_ratio;
create table default.szy_djte_dz_model_user_list_tnd_risk_ratio as
select aa.uid
      ,bb.tnd_rsk_itm_max_ptf_cnt
      ,bb.tnd_rsk_itm_psn_inf_chk
      ,bb.tnd_rsk_itm_bhv_chk
      ,bb.tnd_rsk_itm_rsk_chk
      ,bb.tnd_rsk_itm_bad_inf_chk
      ,bb.tnd_rsk_itm_mul_ptf_apl_chk
      ,cc.tnd_rsk_itm_d7_gen_ist_ptf
      ,cc.tnd_rsk_itm_d7_big_dat_fin
      ,cc.tnd_rsk_itm_d7_ptt_lon_cmp
      ,cc.tnd_rsk_itm_d7_p2p
      ,cc.tnd_rsk_itm_d7_big_csm_fin_cmp
      ,cc.tnd_rsk_itm_d7_crd_ctr
      ,cc.tnd_rsk_itm_d7_fin_net
      ,cc.tnd_rsk_itm_d7_com_ecm_ptf
      ,cc.tnd_rsk_itm_d7_psn_bnk
      ,cc.tnd_rsk_itm_d7_bnk_sml_lon
      ,cc.tnd_rsk_itm_d7_o2o
      ,cc.tnd_rsk_itm_d7_onl_bnk
      ,cc.tnd_rsk_itm_d7_car_mnu_fin
      ,cc.tnd_rsk_itm_d7_drt_sel_bnk
      ,cc.tnd_rsk_itm_d7_rtl_bnk
      ,cc.tnd_rsk_itm_d7_ppt_ins
      ,cc.tnd_rsk_itm_d7_fin_les
      ,cc.tnd_rsk_itm_d7_eqp_les
      ,cc.tnd_rsk_itm_d7_thd_pty_svc_pvd
      ,cc.tnd_rsk_itm_d7_hse_les
      ,cc.tnd_rsk_itm_d7_grt
      ,cc.tnd_rsk_itm_d7_fin_itt
      ,cc.tnd_rsk_itm_d7_car_les
      ,cc.tnd_rsk_itm_d7_inf_agt
      ,cc.tnd_rsk_itm_d7_thd_pty_pay
      ,cc.tnd_rsk_itm_d7_rel_est_fin
      ,cc.tnd_rsk_itm_d7_vtc_ecm_ptf
      ,cc.tnd_rsk_itm_d7_trp_les
      ,dd.tnd_rsk_itm_m1_gen_ist_ptf
      ,dd.tnd_rsk_itm_m1_big_dat_fin
      ,dd.tnd_rsk_itm_m1_ptt_lon_cmp
      ,dd.tnd_rsk_itm_m1_p2p
      ,dd.tnd_rsk_itm_m1_big_csm_fin_cmp
      ,dd.tnd_rsk_itm_m1_crd_ctr
      ,dd.tnd_rsk_itm_m1_fin_net
      ,dd.tnd_rsk_itm_m1_com_ecm_ptf
      ,dd.tnd_rsk_itm_m1_psn_bnk
      ,dd.tnd_rsk_itm_m1_bnk_sml_lon
      ,dd.tnd_rsk_itm_m1_o2o
      ,dd.tnd_rsk_itm_m1_onl_bnk
      ,dd.tnd_rsk_itm_m1_car_mnu_fin
      ,dd.tnd_rsk_itm_m1_drt_sel_bnk
      ,dd.tnd_rsk_itm_m1_rtl_bnk
      ,dd.tnd_rsk_itm_m1_ppt_ins
      ,dd.tnd_rsk_itm_m1_fin_les
      ,dd.tnd_rsk_itm_m1_eqp_les
      ,dd.tnd_rsk_itm_m1_thd_pty_svc_pvd
      ,dd.tnd_rsk_itm_m1_hse_les
      ,dd.tnd_rsk_itm_m1_grt
      ,dd.tnd_rsk_itm_m1_fin_itt
      ,dd.tnd_rsk_itm_m1_car_les
      ,dd.tnd_rsk_itm_m1_inf_agt
      ,dd.tnd_rsk_itm_m1_thd_pty_pay
      ,dd.tnd_rsk_itm_m1_rel_est_fin
      ,dd.tnd_rsk_itm_m1_vtc_ecm_ptf
      ,dd.tnd_rsk_itm_m1_trp_les
      ,ee.tnd_rsk_itm_m3_gen_ist_ptf
      ,ee.tnd_rsk_itm_m3_big_dat_fin
      ,ee.tnd_rsk_itm_m3_ptt_lon_cmp
      ,ee.tnd_rsk_itm_m3_p2p
      ,ee.tnd_rsk_itm_m3_big_csm_fin_cmp
      ,ee.tnd_rsk_itm_m3_crd_ctr
      ,ee.tnd_rsk_itm_m3_fin_net
      ,ee.tnd_rsk_itm_m3_com_ecm_ptf
      ,ee.tnd_rsk_itm_m3_psn_bnk
      ,ee.tnd_rsk_itm_m3_bnk_sml_lon
      ,ee.tnd_rsk_itm_m3_o2o
      ,ee.tnd_rsk_itm_m3_onl_bnk
      ,ee.tnd_rsk_itm_m3_car_mnu_fin
      ,ee.tnd_rsk_itm_m3_drt_sel_bnk
      ,ee.tnd_rsk_itm_m3_rtl_bnk
      ,ee.tnd_rsk_itm_m3_ppt_ins
      ,ee.tnd_rsk_itm_m3_fin_les
      ,ee.tnd_rsk_itm_m3_eqp_les
      ,ee.tnd_rsk_itm_m3_thd_pty_svc_pvd
      ,ee.tnd_rsk_itm_m3_hse_les
      ,ee.tnd_rsk_itm_m3_grt
      ,ee.tnd_rsk_itm_m3_fin_itt
      ,ee.tnd_rsk_itm_m3_car_les
      ,ee.tnd_rsk_itm_m3_inf_agt
      ,ee.tnd_rsk_itm_m3_thd_pty_pay
      ,ee.tnd_rsk_itm_m3_rel_est_fin
      ,ee.tnd_rsk_itm_m3_vtc_ecm_ptf
      ,ee.tnd_rsk_itm_m3_trp_les
      ,ff.tnd_rsk_itm_m6_gen_ist_ptf
      ,ff.tnd_rsk_itm_m6_big_dat_fin
      ,ff.tnd_rsk_itm_m6_ptt_lon_cmp
      ,ff.tnd_rsk_itm_m6_p2p
      ,ff.tnd_rsk_itm_m6_big_csm_fin_cmp
      ,ff.tnd_rsk_itm_m6_crd_ctr
      ,ff.tnd_rsk_itm_m6_fin_net
      ,ff.tnd_rsk_itm_m6_com_ecm_ptf
      ,ff.tnd_rsk_itm_m6_psn_bnk
      ,ff.tnd_rsk_itm_m6_bnk_sml_lon
      ,ff.tnd_rsk_itm_m6_o2o
      ,ff.tnd_rsk_itm_m6_onl_bnk
      ,ff.tnd_rsk_itm_m6_car_mnu_fin
      ,ff.tnd_rsk_itm_m6_drt_sel_bnk
      ,ff.tnd_rsk_itm_m6_rtl_bnk
      ,ff.tnd_rsk_itm_m6_ppt_ins
      ,ff.tnd_rsk_itm_m6_fin_les
      ,ff.tnd_rsk_itm_m6_eqp_les
      ,ff.tnd_rsk_itm_m6_thd_pty_svc_pvd
      ,ff.tnd_rsk_itm_m6_hse_les
      ,ff.tnd_rsk_itm_m6_grt
      ,ff.tnd_rsk_itm_m6_fin_itt
      ,ff.tnd_rsk_itm_m6_car_les
      ,ff.tnd_rsk_itm_m6_inf_agt
      ,ff.tnd_rsk_itm_m6_thd_pty_pay
      ,ff.tnd_rsk_itm_m6_rel_est_fin
      ,ff.tnd_rsk_itm_m6_vtc_ecm_ptf
      ,ff.tnd_rsk_itm_m6_trp_les
      ,gg.tnd_rsk_itm_m12_gen_ist_ptf
      ,gg.tnd_rsk_itm_m12_big_dat_fin
      ,gg.tnd_rsk_itm_m12_ptt_lon_cmp
      ,gg.tnd_rsk_itm_m12_p2p
      ,gg.tnd_rsk_itm_m12_big_csm_fin_cmp
      ,gg.tnd_rsk_itm_m12_crd_ctr
      ,gg.tnd_rsk_itm_m12_fin_net
      ,gg.tnd_rsk_itm_m12_com_ecm_ptf
      ,gg.tnd_rsk_itm_m12_psn_bnk
      ,gg.tnd_rsk_itm_m12_bnk_sml_lon
      ,gg.tnd_rsk_itm_m12_o2o
      ,gg.tnd_rsk_itm_m12_onl_bnk
      ,gg.tnd_rsk_itm_m12_car_mnu_fin
      ,gg.tnd_rsk_itm_m12_drt_sel_bnk
      ,gg.tnd_rsk_itm_m12_rtl_bnk
      ,gg.tnd_rsk_itm_m12_ppt_ins
      ,gg.tnd_rsk_itm_m12_fin_les
      ,gg.tnd_rsk_itm_m12_eqp_les
      ,gg.tnd_rsk_itm_m12_thd_pty_svc_pvd
      ,gg.tnd_rsk_itm_m12_hse_les
      ,gg.tnd_rsk_itm_m12_grt
      ,gg.tnd_rsk_itm_m12_fin_itt
      ,gg.tnd_rsk_itm_m12_car_les
      ,gg.tnd_rsk_itm_m12_inf_agt
      ,gg.tnd_rsk_itm_m12_thd_pty_pay
      ,gg.tnd_rsk_itm_m12_rel_est_fin
      ,gg.tnd_rsk_itm_m12_vtc_ecm_ptf
      ,gg.tnd_rsk_itm_m12_trp_les
      ,case when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_wek_ptf_apl is not null and bb.tnd_rsk_itm_one_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_wek_ptf_apl / bb.tnd_rsk_itm_one_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_7d_div_1m
      ,case when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_wek_ptf_apl is not null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_wek_ptf_apl / bb.tnd_rsk_itm_thr_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_7d_div_3m
      ,case when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_wek_ptf_apl is not null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_wek_ptf_apl / bb.tnd_rsk_itm_six_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_7d_div_6m
      ,case when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_wek_ptf_apl is not null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then bb.tnd_rsk_itm_one_wek_ptf_apl / bb.tnd_rsk_itm_one_yer_ptf_apl 
            else -999 end as tnd_rsk_itm_7d_div_12m
      ,case when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_mth_ptf_apl is not null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_mth_ptf_apl / bb.tnd_rsk_itm_thr_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_1m_div_3m
      ,case when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_mth_ptf_apl is not null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_mth_ptf_apl / bb.tnd_rsk_itm_six_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_1m_div_6m
      ,case when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_mth_ptf_apl is not null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then bb.tnd_rsk_itm_one_mth_ptf_apl / bb.tnd_rsk_itm_one_yer_ptf_apl 
            else -999 end as tnd_rsk_itm_1m_div_12m
      ,case when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is not null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then bb.tnd_rsk_itm_thr_mth_ptf_apl / bb.tnd_rsk_itm_six_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_3m_div_6m
      ,case when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is null then -998
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is not null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then bb.tnd_rsk_itm_thr_mth_ptf_apl / bb.tnd_rsk_itm_one_yer_ptf_apl 
            else -999 end as tnd_rsk_itm_3m_div_12m
      ,case when bb.tnd_rsk_itm_six_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is null then -998
            when bb.tnd_rsk_itm_six_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_six_mth_ptf_apl is not null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then bb.tnd_rsk_itm_six_mth_ptf_apl / bb.tnd_rsk_itm_one_yer_ptf_apl 
            else -999 end as tnd_rsk_itm_6m_div_12m
      ,case when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_wek_ptf_apl is null and bb.tnd_rsk_itm_one_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_mth_ptf_apl is not null and bb.tnd_rsk_itm_one_wek_ptf_apl is not null then bb.tnd_rsk_itm_one_mth_ptf_apl - bb.tnd_rsk_itm_one_wek_ptf_apl 
            else -999 end as tnd_rsk_itm_1m_dif_7d
      ,case when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_one_mth_ptf_apl is null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is not null and bb.tnd_rsk_itm_one_mth_ptf_apl is not null then bb.tnd_rsk_itm_thr_mth_ptf_apl - bb.tnd_rsk_itm_one_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_3m_dif_1m
      ,case when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is null then -998
            when bb.tnd_rsk_itm_thr_mth_ptf_apl is null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_six_mth_ptf_apl is not null and bb.tnd_rsk_itm_thr_mth_ptf_apl is not null then bb.tnd_rsk_itm_six_mth_ptf_apl - bb.tnd_rsk_itm_thr_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_6m_dif_3m
      ,case when bb.tnd_rsk_itm_six_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is null then -998
            when bb.tnd_rsk_itm_six_mth_ptf_apl is null and bb.tnd_rsk_itm_one_yer_ptf_apl is not null then -997
            when bb.tnd_rsk_itm_one_yer_ptf_apl is not null and bb.tnd_rsk_itm_six_mth_ptf_apl is not null then bb.tnd_rsk_itm_one_yer_ptf_apl - bb.tnd_rsk_itm_six_mth_ptf_apl 
            else -999 end as tnd_rsk_itm_12m_dif_6m
      ,case when bb.tnd_rsk_itm_mob_hit_mid_rsk is not null and bb.tnd_rsk_itm_mob_hit_hgh_rsk is not null and bb.tnd_rsk_itm_mob_hit_low_rsk is not null then bb.tnd_rsk_itm_mob_hit_mid_rsk / (bb.tnd_rsk_itm_mob_hit_hgh_rsk + bb.tnd_rsk_itm_mob_hit_low_rsk + bb.tnd_rsk_itm_mob_hit_mid_rsk) else null end as tnd_rsk_itm_rsk_mid_div
      ,case when bb.tnd_rsk_itm_mob_hit_mid_rsk is not null and bb.tnd_rsk_itm_mob_hit_hgh_rsk is not null and bb.tnd_rsk_itm_mob_hit_low_rsk is not null then bb.tnd_rsk_itm_mob_hit_hgh_rsk / (bb.tnd_rsk_itm_mob_hit_hgh_rsk + bb.tnd_rsk_itm_mob_hit_low_rsk + bb.tnd_rsk_itm_mob_hit_mid_rsk) else null end as tnd_rsk_itm_rsk_hgh_div
      ,case when bb.tnd_rsk_itm_mob_hit_mid_rsk is not null and bb.tnd_rsk_itm_mob_hit_hgh_rsk is not null and bb.tnd_rsk_itm_mob_hit_low_rsk is not null then bb.tnd_rsk_itm_mob_hit_low_rsk / (bb.tnd_rsk_itm_mob_hit_hgh_rsk + bb.tnd_rsk_itm_mob_hit_low_rsk + bb.tnd_rsk_itm_mob_hit_mid_rsk) else null end as tnd_rsk_itm_rsk_low_div
      ,(nvl(cc.tnd_rsk_itm_d7_car_les,0) + nvl(cc.tnd_rsk_itm_d7_trp_les,0) + nvl(cc.tnd_rsk_itm_d7_eqp_les,0) + nvl(cc.tnd_rsk_itm_d7_fin_les,0) + nvl(cc.tnd_rsk_itm_d7_hse_les,0)) as tnd_rsk_itm_d7_les
      ,(nvl(cc.tnd_rsk_itm_d7_drt_sel_bnk,0) + nvl(cc.tnd_rsk_itm_d7_psn_bnk,0) + nvl(cc.tnd_rsk_itm_d7_bnk_sml_lon,0) + nvl(cc.tnd_rsk_itm_d7_onl_bnk,0) + nvl(cc.tnd_rsk_itm_d7_crd_ctr,0)) as tnd_rsk_itm_d7_bnk
      ,(nvl(cc.tnd_rsk_itm_d7_big_csm_fin_cmp,0) + nvl(cc.tnd_rsk_itm_d7_rtl_bnk,0)) as tnd_rsk_itm_d7_csm
      ,(nvl(cc.tnd_rsk_itm_d7_com_ecm_ptf,0) + nvl(cc.tnd_rsk_itm_d7_vtc_ecm_ptf,0)) as tnd_rsk_itm_d7_ecm_ptf
      ,(nvl(cc.tnd_rsk_itm_d7_ptt_lon_cmp,0) + nvl(cc.tnd_rsk_itm_d7_p2p,0)) as tnd_rsk_itm_d7_ptt_lon
      ,(nvl(cc.tnd_rsk_itm_d7_gen_ist_ptf,0) + nvl(cc.tnd_rsk_itm_d7_o2o,0) + nvl(cc.tnd_rsk_itm_d7_rel_est_fin,0) + nvl(cc.tnd_rsk_itm_d7_thd_pty_svc_pvd,0) + nvl(cc.tnd_rsk_itm_d7_inf_agt,0) + nvl(cc.tnd_rsk_itm_d7_fin_net,0) + nvl(cc.tnd_rsk_itm_d7_big_dat_fin,0)) as tnd_rsk_itm_d7_oth
      ,(nvl(dd.tnd_rsk_itm_m1_car_les,0) + nvl(dd.tnd_rsk_itm_m1_trp_les,0) + nvl(dd.tnd_rsk_itm_m1_eqp_les,0) + nvl(dd.tnd_rsk_itm_m1_fin_les,0) + nvl(dd.tnd_rsk_itm_m1_hse_les,0)) as tnd_rsk_itm_m1_les
      ,(nvl(dd.tnd_rsk_itm_m1_drt_sel_bnk,0) + nvl(dd.tnd_rsk_itm_m1_psn_bnk,0) + nvl(dd.tnd_rsk_itm_m1_bnk_sml_lon,0) + nvl(dd.tnd_rsk_itm_m1_onl_bnk,0) + nvl(dd.tnd_rsk_itm_m1_crd_ctr,0)) as tnd_rsk_itm_m1_bnk
      ,(nvl(dd.tnd_rsk_itm_m1_big_csm_fin_cmp,0) + nvl(dd.tnd_rsk_itm_m1_rtl_bnk,0)) as tnd_rsk_itm_m1_csm
      ,(nvl(dd.tnd_rsk_itm_m1_com_ecm_ptf,0) + nvl(dd.tnd_rsk_itm_m1_vtc_ecm_ptf,0)) as tnd_rsk_itm_m1_ecm_ptf
      ,(nvl(dd.tnd_rsk_itm_m1_ptt_lon_cmp,0) + nvl(dd.tnd_rsk_itm_m1_p2p,0)) as tnd_rsk_itm_m1_ptt_lon
      ,(nvl(dd.tnd_rsk_itm_m1_gen_ist_ptf,0) + nvl(dd.tnd_rsk_itm_m1_o2o,0) + nvl(dd.tnd_rsk_itm_m1_rel_est_fin,0) + nvl(dd.tnd_rsk_itm_m1_thd_pty_svc_pvd,0) + nvl(dd.tnd_rsk_itm_m1_inf_agt,0) + nvl(dd.tnd_rsk_itm_m1_fin_net,0) + nvl(dd.tnd_rsk_itm_m1_big_dat_fin,0)) as tnd_rsk_itm_m1_oth
      ,(nvl(ee.tnd_rsk_itm_m3_car_les,0) + nvl(ee.tnd_rsk_itm_m3_trp_les,0) + nvl(ee.tnd_rsk_itm_m3_eqp_les,0) + nvl(ee.tnd_rsk_itm_m3_fin_les,0) + nvl(ee.tnd_rsk_itm_m3_hse_les,0)) as tnd_rsk_itm_m3_les
      ,(nvl(ee.tnd_rsk_itm_m3_drt_sel_bnk,0) + nvl(ee.tnd_rsk_itm_m3_psn_bnk,0) + nvl(ee.tnd_rsk_itm_m3_bnk_sml_lon,0) + nvl(ee.tnd_rsk_itm_m3_onl_bnk,0) + nvl(ee.tnd_rsk_itm_m3_crd_ctr,0)) as tnd_rsk_itm_m3_bnk
      ,(nvl(ee.tnd_rsk_itm_m3_big_csm_fin_cmp,0) + nvl(ee.tnd_rsk_itm_m3_rtl_bnk,0)) as tnd_rsk_itm_m3_csm
      ,(nvl(ee.tnd_rsk_itm_m3_com_ecm_ptf,0) + nvl(ee.tnd_rsk_itm_m3_vtc_ecm_ptf,0)) as tnd_rsk_itm_m3_ecm_ptf
      ,(nvl(ee.tnd_rsk_itm_m3_ptt_lon_cmp,0) + nvl(ee.tnd_rsk_itm_m3_p2p,0)) as tnd_rsk_itm_m3_ptt_lon
      ,(nvl(ee.tnd_rsk_itm_m3_gen_ist_ptf,0) + nvl(ee.tnd_rsk_itm_m3_o2o,0) + nvl(ee.tnd_rsk_itm_m3_rel_est_fin,0) + nvl(ee.tnd_rsk_itm_m3_thd_pty_svc_pvd,0) + nvl(ee.tnd_rsk_itm_m3_inf_agt,0) + nvl(ee.tnd_rsk_itm_m3_fin_net,0) + nvl(ee.tnd_rsk_itm_m3_big_dat_fin,0)) as tnd_rsk_itm_m3_oth
      ,(nvl(ff.tnd_rsk_itm_m6_car_les,0) + nvl(ff.tnd_rsk_itm_m6_trp_les,0) + nvl(ff.tnd_rsk_itm_m6_eqp_les,0) + nvl(ff.tnd_rsk_itm_m6_fin_les,0) + nvl(ff.tnd_rsk_itm_m6_hse_les,0)) as tnd_rsk_itm_m6_les
      ,(nvl(ff.tnd_rsk_itm_m6_drt_sel_bnk,0) + nvl(ff.tnd_rsk_itm_m6_psn_bnk,0) + nvl(ff.tnd_rsk_itm_m6_bnk_sml_lon,0) + nvl(ff.tnd_rsk_itm_m6_onl_bnk,0) + nvl(ff.tnd_rsk_itm_m6_crd_ctr,0)) as tnd_rsk_itm_m6_bnk
      ,(nvl(ff.tnd_rsk_itm_m6_big_csm_fin_cmp,0) + nvl(ff.tnd_rsk_itm_m6_rtl_bnk,0)) as tnd_rsk_itm_m6_csm
      ,(nvl(ff.tnd_rsk_itm_m6_com_ecm_ptf,0) + nvl(ff.tnd_rsk_itm_m6_vtc_ecm_ptf,0)) as tnd_rsk_itm_m6_ecm_ptf
      ,(nvl(ff.tnd_rsk_itm_m6_ptt_lon_cmp,0) + nvl(ff.tnd_rsk_itm_m6_p2p,0)) as tnd_rsk_itm_m6_ptt_lon
      ,(nvl(ff.tnd_rsk_itm_m6_gen_ist_ptf,0) + nvl(ff.tnd_rsk_itm_m6_o2o,0) + nvl(ff.tnd_rsk_itm_m6_rel_est_fin,0) + nvl(ff.tnd_rsk_itm_m6_thd_pty_svc_pvd,0) + nvl(ff.tnd_rsk_itm_m6_inf_agt,0) + nvl(ff.tnd_rsk_itm_m6_fin_net,0) + nvl(ff.tnd_rsk_itm_m6_big_dat_fin,0)) as tnd_rsk_itm_m6_oth
      ,(nvl(gg.tnd_rsk_itm_m12_car_les,0) + nvl(gg.tnd_rsk_itm_m12_trp_les,0) + nvl(gg.tnd_rsk_itm_m12_eqp_les,0) + nvl(gg.tnd_rsk_itm_m12_fin_les,0) + nvl(gg.tnd_rsk_itm_m12_hse_les,0)) as tnd_rsk_itm_m12_les
      ,(nvl(gg.tnd_rsk_itm_m12_drt_sel_bnk,0) + nvl(gg.tnd_rsk_itm_m12_psn_bnk,0) + nvl(gg.tnd_rsk_itm_m12_bnk_sml_lon,0) + nvl(gg.tnd_rsk_itm_m12_onl_bnk,0) + nvl(gg.tnd_rsk_itm_m12_crd_ctr,0)) as tnd_rsk_itm_m12_bnk
      ,(nvl(gg.tnd_rsk_itm_m12_big_csm_fin_cmp,0) + nvl(gg.tnd_rsk_itm_m12_rtl_bnk,0)) as tnd_rsk_itm_m12_csm
      ,(nvl(gg.tnd_rsk_itm_m12_com_ecm_ptf,0) + nvl(gg.tnd_rsk_itm_m12_vtc_ecm_ptf,0)) as tnd_rsk_itm_m12_ecm_ptf
      ,(nvl(gg.tnd_rsk_itm_m12_ptt_lon_cmp,0) + nvl(gg.tnd_rsk_itm_m12_p2p,0)) as tnd_rsk_itm_m12_ptt_lon
      ,(nvl(gg.tnd_rsk_itm_m12_gen_ist_ptf,0) + nvl(gg.tnd_rsk_itm_m12_o2o,0) + nvl(gg.tnd_rsk_itm_m12_rel_est_fin,0) + nvl(gg.tnd_rsk_itm_m12_thd_pty_svc_pvd,0) + nvl(gg.tnd_rsk_itm_m12_inf_agt,0) + nvl(gg.tnd_rsk_itm_m12_fin_net,0) + nvl(gg.tnd_rsk_itm_m12_big_dat_fin,0)) as tnd_rsk_itm_m12_oth
from default.szy_djte_dz_model_user_list_key as aa
left join default.szy_djte_dz_model_user_list_tnd_risk as bb
on aa.uid = bb.uid
left join default.szy_djte_dz_model_user_list_tnd_detail_7d as cc
on aa.uid = cc.uid
left join default.szy_djte_dz_model_user_list_tnd_detail_1m as dd
on aa.uid = dd.uid
left join default.szy_djte_dz_model_user_list_tnd_detail_3m as ee
on aa.uid = ee.uid
left join default.szy_djte_dz_model_user_list_tnd_detail_6m as ff
on aa.uid = ff.uid
left join default.szy_djte_dz_model_user_list_tnd_detail_12m as gg
on aa.uid = gg.uid
;

-- 计算比率合并第一部分（第一部分+第二部分）
drop table if exists default.szy_djte_dz_model_user_list_tnd_risk_ratio_2;
create table default.szy_djte_dz_model_user_list_tnd_risk_ratio_2 as
select aa.*
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_les / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_les_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_bnk / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_bnk_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_csm / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_csm_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then nvl(aa.tnd_rsk_itm_d7_car_mnu_fin,0) / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_car_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_ecm_ptf / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_ecm_ptf_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_ptt_lon / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_ptt_lon_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_d7_oth / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_d7_oth_rat
      
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_les / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_les_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_bnk / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_bnk_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_csm / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_csm_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then nvl(aa.tnd_rsk_itm_m1_car_mnu_fin,0) / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_car_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_ecm_ptf / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_ecm_ptf_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_ptt_lon / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_ptt_lon_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m1_oth / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m1_oth_rat
      
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_les / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_les_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_bnk / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_bnk_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_csm / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_csm_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then nvl(aa.tnd_rsk_itm_m3_car_mnu_fin,0) / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_car_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_ecm_ptf / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_ecm_ptf_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_ptt_lon / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_ptt_lon_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m3_oth / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m3_oth_rat
      
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_les / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_les_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_bnk / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_bnk_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_csm / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_csm_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then nvl(aa.tnd_rsk_itm_m6_car_mnu_fin,0) / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_car_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_ecm_ptf / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_ecm_ptf_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_ptt_lon / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_ptt_lon_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m6_oth / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m6_oth_rat
      
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_les / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_les_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_bnk / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_bnk_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_csm / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_csm_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then nvl(aa.tnd_rsk_itm_m12_car_mnu_fin,0) / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_car_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_ecm_ptf / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_ecm_ptf_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_ptt_lon / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_ptt_lon_rat
      ,case when aa.tnd_rsk_itm_max_ptf_cnt is not null then aa.tnd_rsk_itm_m12_oth / aa.tnd_rsk_itm_max_ptf_cnt else null end as tnd_rsk_itm_m12_oth_rat
from default.szy_djte_dz_model_user_list_tnd_risk_ratio as aa
;


-- 计算比率合并中间表第一部分+第二部分+第三部分）
-- 展开明细字典
drop table if exists default.szy_djte_dz_model_user_list_tnd_tmp2;
create table default.szy_djte_dz_model_user_list_tnd_tmp2 as
select aa.*,map_key,map_val
from default.szy_djte_dz_model_user_list_tnd_tmp as aa
lateral view explode(aa.ptf_dtl_map) table1 as map_key, map_val;

-- 合并所有衍生字段
drop table if exists default.szy_djte_dz_model_user_list_tnd_risk_ratio_3;
create table default.szy_djte_dz_model_user_list_tnd_risk_ratio_3 as
select aa.*
      ,bb.tnd_rsk_itm_d7_typ
      ,cc.tnd_rsk_itm_m1_typ
      ,dd.tnd_rsk_itm_m3_typ
      ,ee.tnd_rsk_itm_m6_typ
      ,ff.tnd_rsk_itm_m12_typ
      ,case when bb.tnd_rsk_itm_d7_typ is null and ff.tnd_rsk_itm_m12_typ is null then -998
            when bb.tnd_rsk_itm_d7_typ is null and ff.tnd_rsk_itm_m12_typ is not null then -997
            when bb.tnd_rsk_itm_d7_typ is not null and ff.tnd_rsk_itm_m12_typ is not null then bb.tnd_rsk_itm_d7_typ / ff.tnd_rsk_itm_m12_typ 
            else -999 end as tnd_rsk_itm_typ_7d_div_m12
      ,case when cc.tnd_rsk_itm_m1_typ is null and ff.tnd_rsk_itm_m12_typ is null then -998
            when cc.tnd_rsk_itm_m1_typ is null and ff.tnd_rsk_itm_m12_typ is not null then -997
            when cc.tnd_rsk_itm_m1_typ is not null and ff.tnd_rsk_itm_m12_typ is not null then cc.tnd_rsk_itm_m1_typ / ff.tnd_rsk_itm_m12_typ 
            else -999 end as tnd_rsk_itm_typ_m1_div_m12
      ,case when dd.tnd_rsk_itm_m3_typ is null and ff.tnd_rsk_itm_m12_typ is null then -998
            when dd.tnd_rsk_itm_m3_typ is null and ff.tnd_rsk_itm_m12_typ is not null then -997
            when dd.tnd_rsk_itm_m3_typ is not null and ff.tnd_rsk_itm_m12_typ is not null then dd.tnd_rsk_itm_m3_typ / ff.tnd_rsk_itm_m12_typ 
            else -999 end as tnd_rsk_itm_typ_m3_div_m12
      ,case when ee.tnd_rsk_itm_m6_typ is null and ff.tnd_rsk_itm_m12_typ is null then -998
            when ee.tnd_rsk_itm_m6_typ is null and ff.tnd_rsk_itm_m12_typ is not null then -997
            when ee.tnd_rsk_itm_m6_typ is not null and ff.tnd_rsk_itm_m12_typ is not null then ee.tnd_rsk_itm_m6_typ / ff.tnd_rsk_itm_m12_typ 
            else -999 end as tnd_rsk_itm_typ_m6_div_m12
      ,case when bb.tnd_rsk_itm_d7_typ is null and ee.tnd_rsk_itm_m6_typ is null then -998
            when bb.tnd_rsk_itm_d7_typ is null and ee.tnd_rsk_itm_m6_typ is not null then -997
            when bb.tnd_rsk_itm_d7_typ is not null and ee.tnd_rsk_itm_m6_typ is not null then bb.tnd_rsk_itm_d7_typ / ee.tnd_rsk_itm_m6_typ 
            else -999 end as tnd_rsk_itm_typ_d7_div_m6
      ,case when cc.tnd_rsk_itm_m1_typ is null and ee.tnd_rsk_itm_m6_typ is null then -998
            when cc.tnd_rsk_itm_m1_typ is null and ee.tnd_rsk_itm_m6_typ is not null then -997
            when cc.tnd_rsk_itm_m1_typ is not null and ee.tnd_rsk_itm_m6_typ is not null then cc.tnd_rsk_itm_m1_typ / ee.tnd_rsk_itm_m6_typ 
            else -999 end as tnd_rsk_itm_typ_m1_div_m6
      ,case when dd.tnd_rsk_itm_m3_typ is null and ee.tnd_rsk_itm_m6_typ is null then -998
            when dd.tnd_rsk_itm_m3_typ is null and ee.tnd_rsk_itm_m6_typ is not null then -997
            when dd.tnd_rsk_itm_m3_typ is not null and ee.tnd_rsk_itm_m6_typ is not null then dd.tnd_rsk_itm_m3_typ / ee.tnd_rsk_itm_m6_typ 
            else -999 end as tnd_rsk_itm_typ_m3_div_m6
      ,case when bb.tnd_rsk_itm_d7_typ is null and dd.tnd_rsk_itm_m3_typ is null then -998
            when bb.tnd_rsk_itm_d7_typ is null and dd.tnd_rsk_itm_m3_typ is not null then -997
            when bb.tnd_rsk_itm_d7_typ is not null and dd.tnd_rsk_itm_m3_typ is not null then bb.tnd_rsk_itm_d7_typ / dd.tnd_rsk_itm_m3_typ 
            else -999 end as tnd_rsk_itm_typ_d7_div_m3
      ,case when cc.tnd_rsk_itm_m1_typ is null and dd.tnd_rsk_itm_m3_typ is null then -998
            when cc.tnd_rsk_itm_m1_typ is null and dd.tnd_rsk_itm_m3_typ is not null then -997
            when cc.tnd_rsk_itm_m1_typ is not null and dd.tnd_rsk_itm_m3_typ is not null then cc.tnd_rsk_itm_m1_typ / dd.tnd_rsk_itm_m3_typ 
            else -999 end as tnd_rsk_itm_typ_m1_div_m3
      ,case when bb.tnd_rsk_itm_d7_typ is null and cc.tnd_rsk_itm_m1_typ is null then -998
            when bb.tnd_rsk_itm_d7_typ is null and cc.tnd_rsk_itm_m1_typ is not null then -997
            when bb.tnd_rsk_itm_d7_typ is not null and cc.tnd_rsk_itm_m1_typ is not null then bb.tnd_rsk_itm_d7_typ / cc.tnd_rsk_itm_m1_typ 
            else -999 end as tnd_rsk_itm_typ_d7_div_m1
from default.szy_djte_dz_model_user_list_tnd_risk_ratio_2 as aa
left join (
    select aa.uid,count(aa.map_key) as tnd_rsk_itm_d7_typ
    from (
        select uid
              ,map_key
              ,row_number () over (partition by uid, map_key order by map_val desc) as n
        from default.szy_djte_dz_model_user_list_tnd_tmp2
        where itm_nam = '7天内申请人在多个平台申请借款'
    ) as aa
    where aa.n = 1
    group by aa.uid
) as bb
on aa.uid = bb.uid
left join (
    select aa.uid,count(aa.map_key) as tnd_rsk_itm_m1_typ
    from (
        select uid
              ,map_key
              ,row_number () over (partition by uid, map_key order by map_val desc) as n
        from default.szy_djte_dz_model_user_list_tnd_tmp2
        where itm_nam = '1个月内申请人在多个平台申请借款'
    ) as aa
    where aa.n = 1
    group by aa.uid
) as cc
on aa.uid = cc.uid
left join (
    select aa.uid,count(aa.map_key) as tnd_rsk_itm_m3_typ
    from (
        select uid
              ,map_key
              ,row_number () over (partition by uid, map_key order by map_val desc) as n
        from default.szy_djte_dz_model_user_list_tnd_tmp2
        where itm_nam = '3个月内申请人在多个平台申请借款'
    ) as aa
    where aa.n = 1
    group by aa.uid
) as dd
on aa.uid = dd.uid
left join (
    select aa.uid,count(aa.map_key) as tnd_rsk_itm_m6_typ
    from (
        select uid
              ,map_key
              ,row_number () over (partition by uid, map_key order by map_val desc) as n
        from default.szy_djte_dz_model_user_list_tnd_tmp2
        where itm_nam = '6个月内申请人在多个平台申请借款'
    ) as aa
    where aa.n = 1
    group by aa.uid
) as ee
on aa.uid = ee.uid
left join (
    select aa.uid,count(aa.map_key) as tnd_rsk_itm_m12_typ
    from (
        select uid
              ,map_key
              ,row_number () over (partition by uid, map_key order by map_val desc) as n
        from default.szy_djte_dz_model_user_list_tnd_tmp2
        where itm_nam = '12个月内申请人在多个平台申请借款'
    ) as aa
    where aa.n = 1
    group by aa.uid
) as ff
on aa.uid = ff.uid
;