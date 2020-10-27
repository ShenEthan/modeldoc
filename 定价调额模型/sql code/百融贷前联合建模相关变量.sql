drop table if exists default.szy_djte_dz_model_user_list_br_mdl_var;
create table default.szy_djte_dz_model_user_list_br_mdl_var as 
select aa.uid
      ,bb.br_alf_apirisk_d180_mean
      ,bb.br_alf_apirisk_d180_sum
      ,bb.br_alf_apirisk_d30_sum
      ,bb.br_alf_apirisk_d90_sum
      ,bb.br_alf_apirisk_time_area_d15_sum
      ,bb.br_alf_apirisk_time_area_d180_mean
      ,bb.br_alf_apirisk_time_area_d30_sum
      ,bb.br_alf_apirisk_time_area_d360_mean
      ,bb.br_alf_apirisk_time_area_d90_mean
      ,bb.br_alf_apirisk_time_area_d90_sum
      ,bb.br_alf_apirisk_time_slope_d360_mean
      ,bb.br_alf_count_cell_model
      ,bb.br_alf_diff_bus_model
      ,bb.br_als_d15_on_pro_a
      ,bb.br_als_d15_on_pro_o
      ,bb.br_als_m1_on_pro_a
      ,bb.br_als_m1_on_pro_o
      ,bb.br_als_m6_bn_o
      ,bb.br_cf_cons_c10_amount_model
      ,bb.br_cf_cons_c10_views
      ,bb.br_cf_cons_c13_nums_model
      ,bb.br_cf_cons_c13_views
      ,bb.br_cf_cons_c15_amount_model
      ,bb.br_cf_cons_c15_views
      ,bb.br_cf_cons_c16_views
      ,bb.br_cf_cons_c18_views
      ,bb.br_cf_cons_c19_views
      ,bb.br_cf_cons_c1_amount
      ,bb.br_cf_cons_c1_nums
      ,bb.br_cf_cons_c1_views
      ,bb.br_cf_cons_c20_views
      ,bb.br_cf_cons_c21_views
      ,bb.br_cf_cons_c22_views
      ,bb.br_cf_cons_c25_views
      ,bb.br_cf_cons_c27_views
      ,bb.br_cf_cons_c29_views
      ,bb.br_cf_cons_c3_views
      ,bb.br_cf_cons_c4_amount
      ,bb.br_cf_cons_c4_nums
      ,bb.br_cf_cons_c4_views
      ,bb.br_cf_cons_c5_views
      ,bb.br_cf_cons_c8_views
      ,bb.br_cf_cons_views_model
      ,bb.br_cf_prob_min_model
      ,bb.br_cons_m3_myyp_num
      ,bb.br_frg_list_level_model
      ,bb.br_gl_m1_max_time_model
      ,bb.br_ir_allmatch_days
      ,bb.br_ir_id_x_mail_cnt
      ,bb.br_ir_m12_id_x_cell_cnt
      ,bb.br_ns_avg_amt_model
      ,bb.br_stab_mail_num_model
      ,bb.br_tl_nowamount
from default.szy_djte_dz_model_user_list_key as aa
left join (
    select aa.*
    from (
        select aa.uid
              ,bb.alf_apirisk_d180_mean as br_alf_apirisk_d180_mean -- 最近180天申请的申请机构风险等级均值
              ,bb.alf_apirisk_d180_sum as br_alf_apirisk_d180_sum -- 最近180天申请的申请机构风险等级求和
              ,bb.alf_apirisk_d30_sum as br_alf_apirisk_d30_sum -- 最近30天申请的申请机构风险等级求和
              ,bb.alf_apirisk_d90_sum as br_alf_apirisk_d90_sum -- 最近90天申请的申请机构风险等级求和
              ,bb.alf_apirisk_time_area_d15_sum as br_alf_apirisk_time_area_d15_sum -- 最近15天申请的申请机构风险相邻算法取值的求和
              ,bb.alf_apirisk_time_area_d180_mean as br_alf_apirisk_time_area_d180_mean -- 最近180天申请的申请机构风险相邻算法取值的均值
              ,bb.alf_apirisk_time_area_d30_sum as br_alf_apirisk_time_area_d30_sum -- 最近30天申请的申请机构风险相邻算法取值的求和
              ,bb.alf_apirisk_time_area_d360_mean as br_alf_apirisk_time_area_d360_mean -- 最近360天申请的申请机构风险相邻算法取值的均值
              ,bb.alf_apirisk_time_area_d90_mean as br_alf_apirisk_time_area_d90_mean -- 最近90天申请的申请机构风险相邻算法取值的均值
              ,bb.alf_apirisk_time_area_d90_sum as br_alf_apirisk_time_area_d90_sum -- 最近90天申请的申请机构风险相邻算法取值的求和
              ,bb.alf_apirisk_time_slope_d360_mean as br_alf_apirisk_time_slope_d360_mean -- 最近360天申请的申请机构风险趋势算法取值的均值
              ,bb.alf_count_cell_model as br_alf_count_cell_model -- 过往全部申请的不同手机号个数
              ,bb.alf_diff_bus_model as br_alf_diff_bus_model -- 过往全部申请的不同业务类目数
              ,bb.als_d15_on_pro_a as br_als_d15_on_pro_a -- 近15天在线上申请占银行+非银申请次数的比例
              ,bb.als_d15_on_pro_o as br_als_d15_on_pro_o -- 近15天在线上申请占银行+非银申请机构数的比例
              ,bb.als_m1_on_pro_a as br_als_m1_on_pro_a -- 近1个月在线上申请占银行+非银申请次数的比例
              ,bb.als_m1_on_pro_o as br_als_m1_on_pro_o -- 近1个月在线上申请占银行+非银申请机构数的比例
              ,bb.als_m6_bn_o as br_als_m6_bn_o -- 近6个月占银行+非银申请机构数
              ,bb.cf_cons_c10_amount_model as br_cf_cons_c10_amount_model -- 近两年家居家纺类消费总金额
              ,bb.cf_cons_c10_views as br_cf_cons_c10_views -- 近两年家居家纺类浏览总次数
              ,bb.cf_cons_c13_nums_model as br_cf_cons_c13_nums_model -- 近两年美食特产类购买总次数
              ,bb.cf_cons_c13_views as br_cf_cons_c13_views -- 近两年美食特产类浏览总次数
              ,bb.cf_cons_c15_amount_model as br_cf_cons_c15_amount_model -- 近两年汽车用品类消费总金额
              ,bb.cf_cons_c15_views as br_cf_cons_c15_views -- 近两年汽车用品类浏览总次数
              ,bb.cf_cons_c16_views as br_cf_cons_c16_views -- 近两年其他类浏览总次数
              ,bb.cf_cons_c18_views as br_cf_cons_c18_views -- 近两年收藏类浏览总次数
              ,bb.cf_cons_c19_views as br_cf_cons_c19_views -- 近两年手机/手机配件类浏览总次数
              ,bb.cf_cons_c1_amount as br_cf_cons_c1_amount -- 近两年本地生活类消费总金额
              ,bb.cf_cons_c1_nums as br_cf_cons_c1_nums -- 近两年本地生活类购买总次数
              ,bb.cf_cons_c1_views as br_cf_cons_c1_views -- 近两年本地生活类浏览总次数
              ,bb.cf_cons_c20_views as br_cf_cons_c20_views -- 近两年数码类浏览总次数
              ,bb.cf_cons_c21_views as br_cf_cons_c21_views -- 近两年通讯类浏览总次数
              ,bb.cf_cons_c22_views as br_cf_cons_c22_views -- 近两年文化娱乐类浏览总次数
              ,bb.cf_cons_c25_views as br_cf_cons_c25_views -- 近两年箱包类浏览总次数
              ,bb.cf_cons_c27_views as br_cf_cons_c27_views -- 近两年医疗保健类浏览总次数
              ,bb.cf_cons_c29_views as br_cf_cons_c29_views -- 近两年钟表首饰类浏览总次数
              ,bb.cf_cons_c3_views as br_cf_cons_c3_views -- 近两年出差旅游类浏览总次数
              ,bb.cf_cons_c4_amount as br_cf_cons_c4_amount -- 近两年宠物生活类消费总金额
              ,bb.cf_cons_c4_nums as br_cf_cons_c4_nums -- 近两年宠物生活类购买总次数
              ,bb.cf_cons_c4_views as br_cf_cons_c4_views -- 近两年宠物生活类浏览总次数
              ,bb.cf_cons_c5_views as br_cf_cons_c5_views -- 近两年电脑/办公类浏览总次数
              ,bb.cf_cons_c8_views as br_cf_cons_c8_views -- 近两年个护化妆类浏览总次数
              ,bb.cf_cons_views_model as br_cf_cons_views_model -- 近两年浏览总次数
              ,bb.cf_prob_min_model as br_cf_prob_min_model -- 请求id与cells的最小置信度
              ,bb.cons_m3_myyp_num as br_cons_m3_myyp_num -- 近3个月母婴用品类商品总消费等级
              ,bb.frg_list_level_model as br_frg_list_level_model -- 查询人欺诈团伙等级
              ,bb.gl_m1_max_time_model as br_gl_m1_max_time_model -- 近1个月命中灰名单最大时间间隔
              ,bb.ir_allmatch_days as br_ir_allmatch_days -- 身份证和手机号完全匹配的最近查询距今天数
              ,bb.ir_id_x_mail_cnt as br_ir_id_x_mail_cnt -- 身份证关联的邮箱个数
              ,bb.ir_m12_id_x_cell_cnt as br_ir_m12_id_x_cell_cnt -- 近12月身份证关联手机号个数
              ,bb.ns_avg_amt_model as br_ns_avg_amt_model -- 月均消费评分
              ,bb.stab_mail_num_model as br_stab_mail_num_model -- 关联电子邮箱个数
              ,bb.tl_nowamount as br_tl_nowamount -- 近12个月在非银机构借贷等级(不含小额现金贷)
              ,row_number() over (partition by aa.uid order by abs(unix_timestamp(bb.created_at) - unix_timestamp(aa.adt_tim)) asc) as n
        from default.szy_djte_dz_model_user_list_key as aa
        left join (
            select *
            from ods_loan.ods_loan_s3_creditdata_bairong_get_report
            where day <= '2020-10-22'
              and day >= '2020-08-01'
        ) as bb
        on aa.uid = bb.uid
        where bb.created_at < date_add(aa.adt_tim,7)
    ) as aa
    where n = 1
) as bb 
on aa.uid = bb.uid
