# Generated by PySCeS 1.0.3 (2022-10-20 14:40)
 
# Keywords
Description: Nijhout2006_Hepatic_Folate_Metab
Modelname: Nijhout2006_Folate_Metab
Output_In_Conc: True
Species_In_Conc: True
 
# GlobalUnitDefinitions
UnitSubstance: mole, 1.0, -6, 1
UnitVolume: litre, 1.0, 0, 1
UnitTime: second, 3600.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitArea: metre, 1.0, 0, 2
 
FIX: b_met b_gly b_ser GAR NADPH BET DUMP Fol CO HCHO 
 
# Compartments
Compartment: blood, 1.0, 3 
Compartment: cytosol, 1.0, 3 
Compartment: mito, 1.0, 3 
Compartment: cell, 1.0, 3 
 
# Function definitions
Function: MM, Vmax , Km , S  {
Vmax*S/(Km+S)
}
Function: MM_twosubst, Vmax , Km1 , Km2 , S1 , S2  {
Vmax*S1*S2/((Km1+S1)*(Km2+S2))
}
 
# Reactions
V_b_GLY_c@cytosol:
    b_gly = c_gly
    cytosol*(MM(V_bglyc,K_bglyc,b_gly)-k_out_gly*c_gly) * c_V_b_GLY_c

V_b_SER_c@cytosol:
    b_ser = c_ser
    cytosol*(MM(V_bserc,K_bserc,b_ser)-k_out_ser*c_ser) * c_V_b_SER_c

V_b_MET_c@cytosol:
    b_met = met
    cytosol*(MM(V_bmetc,K_bmetc,b_met)-k_out_met*met) * c_V_b_MET_c

VmFTD@mito:
    m_10f = m_thf
    mito*MM(Vm_mFTD,K_10f_FTD,m_10f) * c_VmFTD

VmSHMT@mito:
    m_thf + m_ser = m_gly + m_2cf
    mito*(MM_twosubst(Vf_mSHMT,K_thf_SHMT,K_ser_SHMT,m_thf,m_ser)-MM_twosubst(Vr_mSHMT,K_gly_SHMT,K_2cf_SHMT,m_gly,m_2cf)) * c_VmSHMT

VmFTS@mito:
    m_thf + m_coo = m_10f
    mito*(MM_twosubst(Vf_mFTS,K_thf_mFTS,K_coo_mFTS,m_thf,m_coo)-MM(Vr_mFTS,K_10f_mFTS,m_10f)) * c_VmFTS

VmNE@mito:
    m_thf + HCHO = m_2cf
    mito*(k1_mNE*m_thf*HCHO-k2_mNE*m_2cf) * c_VmNE

V_GDC@mito:
    m_thf + m_gly = m_2cf + CO
    mito*MM_twosubst(Vm_GDC,K_thf_GDC,K_gly_GDC,m_thf,m_gly) * c_V_GDC

V_SDH@mito:
    m_thf + src = m_2cf + m_gly
    mito*MM_twosubst(Vm_SDH,K_thf_SDH,K_src_SDH,m_thf,src) * c_V_SDH

V_DMGD@mito:
    m_thf + dmg = m_2cf + src
    mito*MM_twosubst(Vm_DMGD,K_thf_DMGD,K_dmg_DMGD,m_thf,dmg) * c_V_DMGD

VmMTD@mito:
    m_2cf = m_1cf
    mito*(MM(Vf_mMTD,K_2cf_MTD,m_2cf)-MM(Vr_MTD,K_1cf_MTD,m_1cf)) * c_VmMTD

VmMTCH@mito:
    m_1cf = m_10f
    mito*(MM(Vf_mMTCH,K_1cf_MTCH,m_1cf)-MM(Vr_MTCH,K_10f_MTCH,m_10f)) * c_VmMTCH

VmSERc@cytosol:
    {3.0}m_ser = c_ser
    MM(V_mser,K_mser,m_ser)*mito/3.0-MM(V_cser,K_cser,c_ser)*cytosol * c_VmSERc

VmHCOOHc:
    {3.0}m_coo = c_coo
    k_in_coo*m_coo*mito/3.0-k_out_coo*c_coo*cytosol * c_VmHCOOHc

VmGLYc:
    {3.0}m_gly = c_gly
    MM(V_mgly,K_mgly,m_gly)*mito/3.0-MM(V_cgly,K_cgly,c_gly)*cytosol * c_VmGLYc

V_MS@cytosol:
    c_5mf + hcy = c_thf + met
    cytosol*MM_twosubst(Vm_MS,K_5mf_MS,K_hcy_MS,c_5mf,hcy) * c_V_MS

V_DHFR@cytosol:
    dhf + NADPH = c_thf
    cytosol*MM_twosubst(Vm_DHFR,K_dhf_DHFR,K_NADPH_DHFR,dhf,NADPH) * c_V_DHFR

VcFTD@cytosol:
    c_10f = c_thf
    cytosol*MM(Vm_cFTD,K_10f_FTD,c_10f) * c_VcFTD

V_PGT@cytosol:
    c_10f + GAR = aic + c_thf
    cytosol*MM_twosubst(Vm_PGT,K_10f_PGT,K_GAR_PGT,c_10f,GAR) * c_V_PGT

VcFTS@cytosol:
    c_thf + c_coo = c_10f
    cytosol*MM_twosubst(Vm_cFTS,K_thf_cFTS,K_coo_cFTS,c_thf,c_coo) * c_VcFTS

VcSHMT@cytosol:
    c_ser + c_thf = c_gly + c_2cf
    cytosol*(MM_twosubst(Vf_cSHMT,K_thf_SHMT,K_ser_SHMT,c_thf,c_ser)-MM_twosubst(Vr_cSHMT,K_gly_SHMT,K_2cf_SHMT,c_gly,c_2cf)) * c_VcSHMT

VcNE@cytosol:
    c_thf + HCHO = c_2cf
    cytosol*(k1_cNE*c_thf*HCHO-k2_cNE*c_2cf) * c_VcNE

V_TS@cytosol:
    DUMP + c_2cf = dhf
    cytosol*MM_twosubst(Vm_TS,K_DUMP_TS,K_2cf_TS,DUMP,c_2cf) * c_V_TS

V_MTHFR@cytosol:
    c_2cf + NADPH = c_5mf
    cytosol*MM_twosubst(Vm_MTHFR,K_2cf_MTHFR,K_NADPH_MTHFR,c_2cf,NADPH)*60.0/(10.0+sam-sah) * c_V_MTHFR
# V_MTHFR has modifier(s): sam sah  

VcMTD@cytosol:
    c_2cf = c_1cf + NADPH
    cytosol*(MM(Vf_cMTD,K_2cf_MTD,c_2cf)-MM(Vr_MTD,K_1cf_MTD,c_1cf)) * c_VcMTD

VcMTCH@cytosol:
    c_1cf = c_10f
    cytosol*(MM(Vf_cMTCH,K_1cf_MTCH,c_1cf)-MM(Vr_MTCH,K_10f_MTCH,c_10f)) * c_VcMTCH

V_ART@cytosol:
    c_10f + aic = c_thf
    cytosol*MM_twosubst(Vm_ART,K_10f_ART,K_aic_ART,c_10f,aic) * c_V_ART

V_BHMT@cytosol:
    hcy + BET = met + dmg
    cytosol*math.exp(-0.0021*(sam+sah))*math.exp(0.0021*76.7)*MM_twosubst(Vm_BHMT,K_hcy_BHMT,K_bet_BHMT,hcy,BET) * c_V_BHMT
# V_BHMT has modifier(s): sam sah  

V_MATI@cytosol:
    met = sam
    cytosol*Vm_MAT1*(met/(Km_MAT1+met))*(0.23+0.8*math.exp(-0.0026*sam)) * c_V_MATI

V_MATIII@cytosol:
    met = sam
    cytosol*Vm_MAT3*(pow(met,1.21)/(Km_MAT3+pow(met,1.21)))*(1.0+7.2*pow(sam,2.0)/(pow(Ka_MAT3,2.0)+pow(sam,2.0))) * c_V_MATIII

V_GNMT@cytosol:
    sam + c_gly = sah + src
    cytosol*MM_twosubst(Vm_GNMT,K_sam_GNMT,K_gly_GNMT,sam,c_gly)*(1.0/(1.0+sah/Ki_GNMT))*(5.88/(0.35+c_5mf)) * c_V_GNMT
# V_GNMT has modifier(s): c_5mf  

V_DNMT@cytosol:
    sam = sah
    cytosol*Vm_DNMT*(sam/(Km_DNMT*(1.0+sah/Ki_DNMT)+sam)) * c_V_DNMT

V_SAHH@cytosol:
    sah = hcy
    cytosol*(MM(Vf_SAHH,K_sah_SAHH,sah)-MM(Vr_SAHH,K_hcy_SAHH,hcy)) * c_V_SAHH

gluconeogenesis_ser@cytosol:
    c_ser = $pool
    cytosol*1.2*c_ser * c_gluconeogenesis_ser

V_CBS@cytosol:
    hcy + c_ser = $pool
    cytosol*MM_twosubst(Vm_CBS,K_hcy_CBS,K_ser_CBS,hcy,c_ser)*(1.2*pow((sam+sah),2.0)/(pow(30.0,2.0)+pow((sam+sah),2.0))) * c_V_CBS
# V_CBS has modifier(s): sam sah sam sah  
 
# coefficients
c_V_b_GLY_c = 1.0
c_V_b_SER_c = 1.0
c_V_b_MET_c = 1.0
c_VmFTD = 1.0
c_VmSHMT = 1.0
c_VmFTS = 1.0
c_VmNE = 1.0
c_V_GDC = 1.0
c_V_SDH = 1.0
c_V_DMGD = 1.0
c_VmMTD = 1.0
c_VmMTCH = 1.0
c_VmSERc = 1.0
c_VmHCOOHc = 1.0
c_VmGLYc = 1.0
c_V_MS = 1.0
c_V_DHFR = 1.0
c_VcFTD = 1.0
c_V_PGT = 1.0
c_VcFTS = 1.0
c_VcSHMT = 1.0
c_VcNE = 1.0
c_V_TS = 1.0
c_V_MTHFR = 1.0
c_VcMTD = 1.0
c_VcMTCH = 1.0
c_V_ART = 1.0
c_V_BHMT = 1.0
c_V_MATI = 1.0
c_V_MATIII = 1.0
c_V_GNMT = 1.0
c_V_DNMT = 1.0
c_V_SAHH = 1.0
c_gluconeogenesis_ser = 1.0
c_V_CBS = 1.0

# Assignment rules
!F c_thf = Fol / (2 * 0.75) - (c_5mf + c_2cf + c_1cf + c_10f + dhf)
!F m_thf = Fol / (2 * 0.25) - (m_2cf + m_1cf + m_10f)
!F tot_cfol = c_5mf + c_2cf + c_1cf + c_10f + dhf + c_thf
!F tot_mfol = m_thf + m_2cf + m_1cf + m_10f

# Fixed species
b_met@blood = 30.0
b_gly@blood = 300.0
b_ser@blood = 150.0
GAR@cytosol = 10.0
NADPH@cytosol = 50.0
BET@cytosol = 50.0
DUMP@cytosol = 20.0
Fol@cell = 20.0
CO@mito = 0.0
HCHO@cell = 500.0

# Variable species
#c_thf@cytosol = Fol / (2 * 0.75) - (c_5mf + c_2cf + c_1cf + c_10f + dhf)
c_thf@cytosol = 0.0
#m_thf@mito = Fol / (2 * 0.25) - (m_2cf + m_1cf + m_10f)
m_thf@mito = 0.0
c_5mf@cytosol = 0.0
c_2cf@cytosol = 0.0
c_1cf@cytosol = 0.0
c_10f@cytosol = 0.0
dhf@cytosol = 0.0
m_2cf@mito = 0.0
m_1cf@mito = 0.0
m_10f@mito = 0.0
aic@cytosol = 0.0
c_gly@cytosol = 0.0
hcy@cytosol = 0.0
c_ser@cytosol = 0.0
sah@cytosol = 0.0
sam@cytosol = 0.0
met@cytosol = 0.0
c_coo@cytosol = 0.0
m_ser@mito = 0.0
m_gly@mito = 0.0
m_coo@mito = 0.0
src@cell = 0.0
dmg@cell = 0.0
 
# Parameters
V_bglyc = 2000.0
K_bglyc = 150.0
k_out_gly = 1.0
V_bserc = 2700.0
K_bserc = 150.0
k_out_ser = 1.0
V_bmetc = 910.0
K_bmetc = 150.0
k_out_met = 1.0
Vm_mFTD = 1050.0
K_10f_FTD = 20.0
Vf_mSHMT = 11440.0
K_thf_SHMT = 50.0
K_ser_SHMT = 600.0
Vr_mSHMT = 30000000.0
K_gly_SHMT = 10000.0
K_2cf_SHMT = 3200.0
Vf_mFTS = 2000.0
K_thf_mFTS = 3.0
K_coo_mFTS = 43.0
Vr_mFTS = 6300.0
K_10f_mFTS = 22.0
k1_mNE = 0.03
k2_mNE = 20.0
Vm_GDC = 15000.0
K_thf_GDC = 50.0
K_gly_GDC = 3400.0
Vm_SDH = 15000.0
K_thf_SDH = 50.0
K_src_SDH = 320.0
Vm_DMGD = 15000.0
K_thf_DMGD = 50.0
K_dmg_DMGD = 50.0
Vf_mMTD = 180000.0
K_2cf_MTD = 2.0
Vr_MTD = 600000.0
K_1cf_MTD = 10.0
Vf_mMTCH = 790000.0
K_1cf_MTCH = 250.0
Vr_MTCH = 20000.0
K_10f_MTCH = 100.0
V_mser = 10000.0
K_mser = 5700.0
V_cser = 10000.0
K_cser = 5700.0
k_in_coo = 100.0
k_out_coo = 100.0
V_mgly = 10000.0
K_mgly = 5700.0
V_cgly = 10000.0
K_cgly = 5700.0
Vm_MS = 500.0
K_5mf_MS = 25.0
K_hcy_MS = 1.0
Vm_DHFR = 2000.0
K_dhf_DHFR = 0.5
K_NADPH_DHFR = 4.0
Vm_cFTD = 500.0
Vm_PGT = 24300.0
K_10f_PGT = 4.9
K_GAR_PGT = 520.0
Vm_cFTS = 3900.0
K_thf_cFTS = 3.0
K_coo_cFTS = 43.0
Vf_cSHMT = 5200.0
Vr_cSHMT = 15000000.0
k1_cNE = 0.03
k2_cNE = 22.0
Vm_TS = 5000.0
K_DUMP_TS = 6.3
K_2cf_TS = 14.0
Vm_MTHFR = 5300.0
K_2cf_MTHFR = 50.0
K_NADPH_MTHFR = 16.0
Vf_cMTD = 80000.0
Vf_cMTCH = 500000.0
Vm_ART = 55000.0
K_10f_ART = 5.9
K_aic_ART = 100.0
Vm_BHMT = 2160.0
K_hcy_BHMT = 12.0
K_bet_BHMT = 100.0
Vm_MAT1 = 260.0
Km_MAT1 = 41.0
Vm_MAT3 = 220.0
Km_MAT3 = 300.0
Ka_MAT3 = 360.0
Vm_GNMT = 245.0
K_sam_GNMT = 32.0
K_gly_GNMT = 130.0
Ki_GNMT = 18.0
Vm_DNMT = 180.0
Km_DNMT = 1.4
Ki_DNMT = 1.4
Vf_SAHH = 5000.0
K_sah_SAHH = 10.0
Vr_SAHH = 5000.0
K_hcy_SAHH = 1.0
Vm_CBS = 402000.0
K_hcy_CBS = 1000.0
K_ser_CBS = 2000.0
tot_cfol = 0.0	# (rule)
tot_mfol = 0.0	# (rule)
c_cys = 0.0
c_gsg = 0.0
e = 2.71828
Ki_MS = 0.01
Ki_BHMT = 0.01

